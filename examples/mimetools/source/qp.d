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
module npp_mimetools.qp;


private static import core.stdc.string;

enum QP_ENCODED_LINE_LEN_MAX = 76;
enum line_buf_length = QP_ENCODED_LINE_LEN_MAX + 2 + 1;

struct QuotedPrintable
{
public:
	pure nothrow
	string encode(const char[] str)

		in
		{
			assert(str[$ - 1] == '\0');
		}

		out(result)
		{
			if (result != null) {
				assert(result[$ - 1] == '\0');
			}
		}

		do
		{
			this.initVar();
			this._bufLen = str.length * 2;
			this._buffer = new char[this._bufLen];
			size_t len = core.stdc.string.strlen(&(str[0]));

			for (size_t i = 0 ; i < len ; i++) {
				this.getQPChar(str[i]);
				this.putQPChar();
			}

			this._buffer[this._i] = '\0';
			this._i++;

			return this._buffer[0 .. this._i].idup;
		}

	pure nothrow
	string decode(const char[] str)

		in
		{
			assert(str[$ - 1] == '\0');
		}

		out(result)
		{
			if (result != null) {
				assert(result[$ - 1] == '\0');
			}
		}

		do
		{
			this.initVar();
			char[.line_buf_length] line;
			this._bufLen = str.length + 1;
			this._buffer = new char[this._bufLen];
			size_t len = core.stdc.string.strlen(&(str[0]));

			for (size_t j = 0; (j < len) && (str[j] != '\0'); ) {
				if (this.readQPLine(str, j, line) == -1) {
					return null;
				}

				if (!this.translate(line)) {
					return null;
				}
			}

			this._buffer[this._i] = '\0';
			this._i++;

			return this._buffer[0 .. this._i].idup;
		}

private:
	char[] _buffer;
	size_t _bufLen;
	size_t _i;
	int _nbCharInLine;

	int _nbChar;
	char[4] _chars;

	pure nothrow @nogc
	int readQPLine(const char[] pStr, ref size_t j, ref char[.line_buf_length] lineBuf)

		in
		{
			assert(pStr[$ - 1] == '\0');
		}

		do
		{
			size_t i = 0;
			size_t len = core.stdc.string.strlen(&(pStr[j]));

			for (; i < len ; i++) {
				if (i >= (.line_buf_length)) {
					return -1;
				}

				char c = pStr[j + i];

				if (c == 0x0D) {
					lineBuf[i] = c;
					i++;

					if ((i >= len) || (i >= (.line_buf_length))) {
						return -1;
					}

					if (pStr[j + i] != cast(char)(0x0A)) {
						return -1;
					}

					lineBuf[i] = pStr[j + i];
					i++;

					if (i >= (.line_buf_length)) {
						return -1;
					}

					lineBuf[i] = '\0';
					j += i;

					// Make sure there's no soft line break.
					if ((i >= 3) && (lineBuf[i - 3] == '=')) {
						lineBuf[i - 3] = '\0';

						return cast(int)(i - 3);
					}

					return cast(int)(i);
				} else if (c == 0x0A) {
					return -1;
				} else {
					lineBuf[i] = c;
				}
			}

			j += i;
			lineBuf[i] = '\0';

			return cast(int)(i);
		}

	pure nothrow @nogc
	bool translate(ref char[.line_buf_length] line2Trans)

		in
		{
			bool is_null_found = false;

			for (size_t i = 0; i < line2Trans.length; i++) {
				if (line2Trans[i] == '\0') {
					is_null_found = true;

					break;
				}
			}

			assert(is_null_found);
		}

		do
		{
			size_t len = core.stdc.string.strlen(&(line2Trans[0]));

			for (size_t i = 0 ; i < len ; i++) {
				if (line2Trans[i] == '=') {
					if ((i == len) || ((i + 1) == len) || ((i + 2) == len)) {
						return false;
					}

					ubyte restoredChar;
					//

					restoredChar = this.makeChar(line2Trans[i + 1], line2Trans[i + 2]);
					i += 2;

					if (!restoredChar) {
						return false;
					}

					this._buffer[this._i] = restoredChar;
					this._i++;
				} else {
					this._buffer[this._i] = line2Trans[i];
					this._i++;
				}
			}

			return true;
		}

	pure nothrow @safe
	void putQPChar()

		do
		{
			// it happens rarely, but it happens
			if (this._i >= this._bufLen) {
				size_t oldLen = this._bufLen;
				this._bufLen *= 2;
				char[] newBuf = new char[this._bufLen];

				for (size_t i = 0 ; i < oldLen ; i++) {
					newBuf[i] = this._buffer[i];
				}

				//char* tmp = &(this._buffer[0]);
				this._buffer = newBuf;
			}

			for (size_t i = 0 ; i < this._nbChar ; i++) {
				this._buffer[this._i++] = this._chars[i];
			}
		}

	pure nothrow @safe @nogc
	void getQPChar(char c)

		do
		{
			bool crlf = false;

			if (((c != '=') && (c > 32) && (c < 127)) || (c == ' ') || (c == '	') || (c == 0x0D)) {
				this._chars[0] = c;
				this._nbChar = 1;
			} else if (c == 0x0A) {
				this._chars[0] = c;
				this._nbChar = 1;
				crlf = true;
			} else {
				ubyte uc = c;
				this._chars[0] = '=';
				this._chars[1] = this.toChar(uc >> 4);
				this._chars[2] = this.toChar(uc & 15);
				this._chars[3] = '\0';
				this._nbChar = 3;
			}

			if (crlf) {
				this._nbCharInLine = this._nbChar;
			} else {
				this._nbCharInLine += this._nbChar;
			}

			if (this._nbCharInLine >= 76) {
				this._buffer[this._i++] = '=';
				this._buffer[this._i++] = 0x0D;
				this._buffer[this._i++] = 0x0A;
				this._nbCharInLine = this._nbChar;
			}
		}

	//core.stdc.stdint.int32_t charToDigit(char c) const
	pure nothrow @safe @nogc
	int charToDigit(char c) const

		do
		{
			if ((c >= '0') && (c <= '9')) {
				return (c - '0');
			}

			if ((c >= 'A') && (c <= 'F')) {
				return (10 + c - 'A');
			}

			return -1;
		}

	pure nothrow @safe @nogc
	ubyte makeChar(char hiChar, char loChar) const

		do
		{
			auto hi = this.charToDigit(hiChar);

			if (hi == -1) {
				return 0;
			}

			auto lo = this.charToDigit(loChar);

			if (lo == -1) {
				return 0;
			}

			return cast(ubyte)(hi << 4 | lo);
		}

	pure nothrow @safe @nogc
	void initVar()

		do
		{
			if (this._buffer != null) {
				this._buffer = null;
			}

			this._bufLen = 0;
			this._i = 0;
			this._nbChar = 0;
			this._nbCharInLine = 0;
		}

	pure nothrow @safe @nogc
	char toChar(int i) const

		in
		{
			assert(i >= 0);
		}

		do
		{
			if (i < 10) {
				return cast(char)('0' + i);
			} else {
				return cast(char)('A' + i - 10);
			}
		}
}
