/*
 * tinflate  -  tiny inflate
 *
 * Copyright (c) 2003 by Joergen Ibsen / Jibz
 * All Rights Reserved
 *
 * http://www.ibsensoftware.com/
 *
 * This software is provided 'as-is', without any express
 * or implied warranty.  In no event will the authors be
 * held liable for any damages arising from the use of
 * this software.
 *
 * Permission is granted to anyone to use this software
 * for any purpose, including commercial applications,
 * and to alter it and redistribute it freely, subject to
 * the following restrictions:
 *
 * 1. The origin of this software must not be
 *    misrepresented; you must not claim that you
 *    wrote the original software. If you use this
 *    software in a product, an acknowledgment in
 *    the product documentation would be appreciated
 *    but is not required.
 *
 * 2. Altered source versions must be plainly marked
 *    as such, and must not be misrepresented as
 *    being the original software.
 *
 * 3. This notice may not be removed or altered from
 *    any source distribution.
 */
module npp_mimetools.tinflate;


//#ifdef __WATCOMC__
//	enum TINFCC = __cdecl;
//#else
//	#define TINFCC
//#endif

extern(C):

enum TINF_OK = 0;
enum TINF_DATA_ERROR = -3;

/* ------------------------------ *
 * -- internal data structures -- *
 * ------------------------------ */

struct TINF_TREE
{
	/**
	 * table of code length counts 
	 */
	ushort[16] table;

	/**
	 * code -> symbol translation table 
	 */
	ushort[288] trans;
}

struct TINF_DATA
{
	const (ubyte)* source;
	uint tag;
	uint bitcount;

	ubyte* dest;
	uint destLen;

	/**
	 * dynamic length/symbol tree 
	 */
	.TINF_TREE ltree;

	/**
	 * dynamic distance tree 
	 */
	.TINF_TREE dtree;
}

/* --------------------------------------------------- *
 * -- uninitialized global data (static structures) -- *
 * --------------------------------------------------- */

/**
 * fixed length/symbol tree 
 */
.TINF_TREE sltree;

/**
 * fixed distance tree 
 */
.TINF_TREE sdtree;

/* extra bits and base tables for length codes */
ubyte[30] length_bits;
ushort[30] length_base;

/* extra bits and base tables for distance codes */
ubyte[30] dist_bits;
ushort[30] dist_base;

/**
 * special ordering of code length codes
 */
private static immutable ubyte[] clcidx =
[
	16, 17, 18, 0, 8, 7, 9, 6,
	10, 5, 11, 4, 12, 3, 13, 2,
	14, 1, 15,
];

/* ----------------------- *
 * -- utility functions -- *
 * ----------------------- */

/**
 * build extra bits and base tables
 */
pure nothrow @safe @nogc
private void tinf_build_bits_base(ref ubyte[30] bits, ref ushort[30] base, int delta, int first)

	body
	{
		size_t i;
		int sum;

		/* build bits table */
		for (i = 0; i < delta; ++i) {
			bits[i] = 0;
		}

		for (i = 0; i < 30 - delta; ++i) {
			bits[i + delta] = cast(char)(cast(int)(i) / delta);
		}

		/* build base table */
		for (sum = first, i = 0; i < 30; ++i) {
			base[i] = cast(char)(sum);
			sum += 1 << bits[i];
		}
	}

/**
 * build the fixed huffman trees
 */
pure nothrow @safe @nogc
private void tinf_build_fixed_trees(ref .TINF_TREE lt, ref .TINF_TREE dt)

	body
	{
		size_t i;

		/* build fixed length tree */
		for (i = 0; i < 7; ++i) {
			lt.table[i] = 0;
		}

		lt.table[7] = 24;
		lt.table[8] = 152;
		lt.table[9] = 112;

		for (i = 0; i < 24; ++i) {
			lt.trans[i] = cast(ushort)(256 + i);
		}

		for (i = 0; i < 144; ++i) {
			lt.trans[24 + i] = cast(ushort)(i);
		}

		for (i = 0; i < 8; ++i) {
			lt.trans[24 + 144 + i] = cast(ushort)(280 + i);
		}

		for (i = 0; i < 112; ++i) {
			lt.trans[24 + 144 + 8 + i] = cast(ushort)(144 + i);
		}

		/* build fixed distance tree */
		for (i = 0; i < 5; ++i) {
			dt.table[i] = 0;
		}

		dt.table[5] = 32;

		for (i = 0; i < 32; ++i) {
			dt.trans[i] = cast(ushort)(i);
		}
	}

/**
 * given an array of code lengths, build a tree
 */
pure nothrow @safe @nogc
private void tinf_build_tree(ref .TINF_TREE t, const ubyte[] lengths, uint num)

	body
	{
		ushort[16] offs;
		size_t i;
		uint sum;

		/* clear code length count table */
		for (i = 0; i < 16; ++i) {
			t.table[i] = 0;
		}

		/* scan symbol lengths, and sum code length counts */
		for (i = 0; i < num; ++i) {
			t.table[lengths[i]]++;
		}

		t.table[0] = 0;

		/* compute offset table for distribution sort */
		for (sum = 0, i = 0; i < 16; ++i) {
			offs[i] = cast(ushort)(sum);
			sum += t.table[i];
		}

		/* create code->symbol translation table (symbols sorted by code) */
		for (i = 0; i < num; ++i) {
			if (lengths[i]) {
				t.trans[offs[lengths[i]]++] = cast(ushort)(i);
			}
		}
	}

/* ---------------------- *
 * -- decode functions -- *
 * ---------------------- */

/**
 * get one bit from source stream
 */
pure nothrow @nogc
private int tinf_getbit(ref .TINF_DATA d)

	body
	{
		uint bit;

		/* check if tag is empty */
		if (!d.bitcount--) {
			/* load next tag */
			d.tag = *d.source++;
			d.bitcount = 7;
		}

		/* shift bit out of tag */
		bit = d.tag & 0x01;
		d.tag >>= 1;

		return bit;
	}

/**
 * read a num bit value from a stream and add base
 */
pure nothrow @nogc
private uint tinf_read_bits(ref .TINF_DATA d, int num, int base)

	body
	{
		uint val = 0;

		/* read num bits */
		if (num) {
			uint limit = 1 << (num);
			uint mask;

			for (mask = 1; mask < limit; mask *= 2)
				if (.tinf_getbit(d)) {
					val += mask;
				}
		}

		return val + base;
	}

/**
 * given a data stream and a tree, decode a symbol
 */
pure nothrow @nogc
private int tinf_decode_symbol(ref .TINF_DATA d, ref .TINF_TREE t)

	body
	{
		int sum = 0;
		int cur = 0;
		int len = 0;

		/* get more bits while code value is above sum */
		do {
			cur = 2 * cur + .tinf_getbit(d);

			++len;

			sum += t.table[len];
			cur -= t.table[len];
		} while (cur >= 0);

		return t.trans[sum + cur];
	}

/**
 * given a data stream, decode dynamic trees from it
 */
nothrow @nogc
private void tinf_decode_trees(ref .TINF_DATA d, ref .TINF_TREE lt, ref .TINF_TREE dt)

	body
	{
		.TINF_TREE code_tree;
		ubyte[288 + 32] lengths;
		uint hlit;
		uint hdist;
		uint hclen;
		size_t i;
		uint num;
		uint length;

		/* get 5 bits HLIT (257-286) */
		hlit = .tinf_read_bits(d, 5, 257);

		/* get 5 bits HDIST (1-32) */
		hdist = .tinf_read_bits(d, 5, 1);

		/* get 4 bits HCLEN (4-19) */
		hclen = .tinf_read_bits(d, 4, 4);

		for (i = 0; i < 19; ++i) {
			lengths[i] = 0;
		}

		/* read code lengths for code length alphabet */
		for (i = 0; i < hclen; ++i) {
			/* get 3 bits code length (0-7) */
			uint clen = .tinf_read_bits(d, 3, 0);

			lengths[.clcidx[i]] = cast(ubyte)(clen);
		}

		/* build code length tree */
		.tinf_build_tree(code_tree, lengths, 19);

		/* decode code lengths for the dynamic trees */
		for (num = 0; num < hlit + hdist; ) {
			int sym = .tinf_decode_symbol(d, code_tree);

			switch (sym) {
				case 16:
					/* copy previous code length 3-6 times (read 2 bits) */
					{
						ubyte prev = lengths[num - 1];

						for (length = .tinf_read_bits(d, 2, 3); length; --length) {
							lengths[num++] = prev;
						}
					}

					break;

				case 17:
					/* repeat code length 0 for 3-10 times (read 3 bits) */
					for (length = .tinf_read_bits(d, 3, 3); length; --length) {
						lengths[num++] = 0;
					}

					break;

				case 18:
					/* repeat code length 0 for 11-138 times (read 7 bits) */
					for (length = .tinf_read_bits(d, 7, 11); length; --length) {
						lengths[num++] = 0;
					}

					break;

				default:
					/* values 0-15 represent the actual code lengths */
					lengths[num++] = cast(char)(sym);

					break;
			}
		}

		/* build dynamic trees */
		.tinf_build_tree(lt, lengths[0 .. $], hlit);
		.tinf_build_tree(dt, lengths[hlit .. $], hdist);
	}

/* ----------------------------- *
 * -- block inflate functions -- *
 * ----------------------------- */

/**
 * given a stream and two trees, inflate a block of data
 */
nothrow @nogc
private int tinf_inflate_block_data(ref .TINF_DATA d, ref .TINF_TREE lt, ref .TINF_TREE dt)

	body
	{
		/* remember current output position */
		ubyte* start = d.dest;

		for (;;) {
			int sym = .tinf_decode_symbol(d, lt);

			/* check for end of block */
			if (sym == 256) {
				d.destLen += cast(uint)(d.dest - start);

				return .TINF_OK;
			}

			if (sym < 256) {
				*d.dest++ = cast(char)(sym);
			} else {
				int length;
				int dist;
				int offs;
				int i;

				sym -= 257;

				/* possibly get more bits from length code */
				length = .tinf_read_bits(d, .length_bits[sym], .length_base[sym]);

				dist = .tinf_decode_symbol(d, dt);

				/* possibly get more bits from distance code */
				offs = .tinf_read_bits(d, .dist_bits[dist], .dist_base[dist]);

				/* copy match */
				for (i = 0; i < length; ++i) {
					d.dest[i] = d.dest[i - offs];
				}

				d.dest += length;
			}
		}
	}

/**
 * inflate an uncompressed block of data
 */
pure nothrow @nogc
private int tinf_inflate_uncompressed_block(ref .TINF_DATA d)

	body
	{
		uint length;
		uint invlength;
		uint i;

		/* get length */
		length = d.source[1];
		length = 256 * length + d.source[0];

		/* get one's complement of length */
		invlength = d.source[3];
		invlength = 256 * invlength + d.source[2];

		/* check length */
		if (length != (~invlength & 0x0000FFFF)) {
			return .TINF_DATA_ERROR;
		}

		d.source += 4;

		/* copy block */
		for (i = length; i; --i) {
			*d.dest++ = *d.source++;
		}

		/* make sure we start next block on a byte boundary */
		d.bitcount = 0;

		d.destLen += length;

		return .TINF_OK;
	}

/**
 * inflate a block of data compressed with fixed huffman trees
 */
nothrow @nogc
private int tinf_inflate_fixed_block(ref .TINF_DATA d)

	body
	{
		/* decode block using fixed trees */
		return .tinf_inflate_block_data(d, .sltree, .sdtree);
	}

/**
 * inflate a block of data compressed with dynamic huffman trees
 */
nothrow @nogc
private int tinf_inflate_dynamic_block(ref .TINF_DATA d)

	body
	{
		/* decode trees from stream */
		.tinf_decode_trees(d, d.ltree, d.dtree);

		/* decode block using decoded trees */
		return .tinf_inflate_block_data(d, d.ltree, d.dtree);
	}

/* ---------------------- *
 * -- public functions -- *
 * ---------------------- */

/**
 * initialize global (static) data
 */
nothrow @nogc
void tinf_init()

	body
	{
		/* build fixed huffman trees */
		.tinf_build_fixed_trees(.sltree, .sdtree);

		/* build extra bits and base tables */
		.tinf_build_bits_base(.length_bits, .length_base, 4, 3);
		.tinf_build_bits_base(.dist_bits, .dist_base, 2, 1);

		/* fix a special case */
		.length_bits[28] = 0;
		.length_base[28] = 258;
	}

/**
 * inflate stream from source to dest
 */
nothrow @nogc
int tinf_uncompress(void[] dest, ref uint destLen, const void[] source)

	body
	{
		.TINF_DATA d;
		int bfinal;

		/* initialise data */
		d.source = cast(const (ubyte)*)(&(source[0]));
		d.bitcount = 0;

		d.dest = cast(ubyte*)(&(dest[0]));
		d.destLen = destLen;

		destLen = 0;

		do {
			uint btype;
			int res;

			/* read final block flag */
			bfinal = .tinf_getbit(d);

			/* read block type (2 bits) */
			btype = .tinf_read_bits(d, 2, 0);

			/* decompress block */
			switch (btype) {
				case 0:
					/* decompress uncompressed block */
					res = .tinf_inflate_uncompressed_block(d);

					break;

				case 1:
					/* decompress block with fixed huffman trees */
					res = .tinf_inflate_fixed_block(d);

					break;

				case 2:
					/* decompress block with dynamic huffman trees */
					res = .tinf_inflate_dynamic_block(d);

					break;

				default:
					return .TINF_DATA_ERROR;
			}

			if (res != .TINF_OK) {
				return .TINF_DATA_ERROR;
			}
		} while (!bfinal);

		return .TINF_OK;
	}
