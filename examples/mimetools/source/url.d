//this file is part of MimeTools (plugin for Notepad++)
//Copyright (C)2019 Don HO <don.h@free.fr>
//
//This program is free software; you can redistribute it and/or
//modify it under the terms of the GNU General Public License
//as published by the Free Software Foundation; either
//version 2 of the License, or (at your option) any later version.
//
//This program is distributed in the hope that it will be useful,
//but WITHOUT ANY WARRANTY; without even the implied warranty of
//MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//GNU General Public License for more details.
//
//You should have received a copy of the GNU General Public License
//along with this program; if not, write to the Free Software
//Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
module npp_mimetools.url;


private static import core.stdc.ctype;
private static import core.stdc.string;

// These characters must be encoded in a URL, as per RFC1738
enum gReservedAscii = "<>\"#%{}|\\^~[]`;/?:@=& ";
enum gHexChar = "0123456789ABCDEF";

pure nothrow @nogc
size_t AsciiToUrl(ref char[] dest, const char[] src, bool encodeAll)

	in
	{
		assert(dest.length > 2);
	}

	do
	{
		static import core.stdc.ctype;
		static import core.stdc.string;

		size_t i = 0;
		size_t k = 0;
		size_t l = 0;
		size_t end_length = dest.length - 2;
		dest[] = '\0';

		for (; (i < end_length) && ((l < src.length) && (src[l] != '\0')); ++i, ++l) {
			// Encode source if it is a reserved or non-printable character.
			if (encodeAll || (core.stdc.string.strchr(&(.gReservedAscii[0]), src[l]) != null) || !core.stdc.ctype.isprint(src[l])) {
				dest[k++] = '%';
				dest[k++] = .gHexChar[((src[l] >> 4) & 0x0F)];
				dest[k++] = .gHexChar[(src[l] & 0x0F)];
				i += 2;
			} else {
				// don't encode character
				dest[k++] = src[l];
			}
		}

		// return characters stored to destination
		return i;
	}

pure nothrow @safe @nogc
size_t UrlToAscii(ref char[] dest, const char[] src)

	do
	{
		static import core.stdc.ctype;

		size_t i = 0;
		size_t l = 0;
		dest[] = '\0';

		for (i = 0; (i < dest.length) && ((l < src.length) && (src[l] != '\0')); ++i) {
			if (src[l] == '%') {
				++l;

				if (l >= (src.length - 1)) {
					return 0;
				}

				// Found an encoded triplet.
				// The next two characters must be hex.
				if (core.stdc.ctype.isxdigit(src[l]) && core.stdc.ctype.isxdigit(src[l + 1])) {
					char val = 0;
					size_t j = 0;

					for (; j < 2; ++j, ++l) {
						val <<= 4;

						if (l >= src.length) {
							return 0;
						}

						if (core.stdc.ctype.isdigit(src[l])) {
							val += src[l] - '0';
						} else if (core.stdc.ctype.isupper(src[l])) {
							val += src[l] - 'A' + 10;
						} else {
							val += src[l] - 'a' + 10;
						}
					}

					dest[i] = val;
				} else {
					// invalid encoding
					return 0;
				}
			} else {
				// non-encoded character, so just copy it
				dest[i] = src[l];
				++l;
			}
		}

		return i;
	}