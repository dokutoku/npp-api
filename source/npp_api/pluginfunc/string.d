//this file is part of notepad++
//Copyright (C)2003 Don HO <donho@altern.org>
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
/**
 * 
 *
 * Author: dokutoku, https://twitter.com/dokutoku3
 * License: GPL-2.0 or later
 */
module npp_api.pluginfunc.string;


private static import std.format;
private static import std.traits;

template c_string(string input_string)
{
	enum string c_string = (input_string.length == 0) ? ("\0") : ((input_string[$ - 1] != '\0') ? (input_string ~ "\0") : (input_string));
}

template c_wstring(wstring input_string)
{
	enum wstring c_wstring = (input_string.length == 0) ? ("\0"w) : ((input_string[$ - 1] != '\0') ? ((input_string ~ "\0"w)) : (input_string));
}

pure nothrow @safe @nogc
void to_c_wstring(size_t LENGTH)(const wchar[] input, ref wchar[LENGTH] buffer)

	in
	{
		assert(LENGTH >= (input.length + 1));
	}

	do
	{
		size_t i = 0;

		buffer[0 .. input.length] = input[0 .. input.length];
		buffer[input.length + 1] = '\0';
	}

pure nothrow @safe @nogc
size_t count_string(S)(const S c_wstring)
	if (std.traits.isStaticArray!(S))

	do
	{
		size_t i = 0;

		for (; (i < c_wstring.length) && (c_wstring[i] != '\0') && (c_wstring[i] != '\xFF'); i++) {
		}

		return i;
	}

/**
 * 文字列終端を'\0'にするようにしたしたコピー関数
 */
pragma(inline, true)
pure nothrow @safe @nogc
void copy_string(S_array, T_array)(ref S_array output_string, const T_array input_string)
	if (std.traits.isArray!(S_array) && std.traits.isDynamicArray!(T_array))

	in
	{
		assert(input_string.length != 0);
		assert(output_string.length != 0);
		assert(output_string.length >= input_string.length);

		//not dchar
		assert(output_string[0].max >= wchar.max);
		assert(output_string[0].max == input_string[0].max);
	}

	out
	{
		for (size_t i = 0; i < output_string.length; i++) {
			assert(output_string[i] != '\xFF');
		}

		assert(output_string[$ - 1] == '\0');
	}

	do
	{
		output_string[] = '\0';
		size_t c_max = output_string.length - 1;

		for (size_t i = 0; (i < c_max) && (i < input_string.length) && (input_string[i] != '\0') && (input_string[i] != '\xFF'); i++) {
			output_string[i] = input_string[i];
		}
	}

pure nothrow @safe @nogc
wchar[LENGTH] copy_string(size_t LENGTH)(const wchar[LENGTH] input_string)

	out(result)
	{
		for (size_t i = 0; i < result.length; i++) {
			assert(result[i] != '\xFF');
		}

		assert(result[$ - 1] == '\0');
	}

	do
	{
		wchar[LENGTH] output_string;
		output_string[] = '\0';
		size_t c_max = output_string.length - 1;

		for (size_t i = 0; (i < c_max) && (input_string[i] != '\0') && (input_string[i] != '\xFF'); i++) {
			output_string[i] = input_string[i];
		}

		return output_string;
	}

version (Not_betterC):

pure nothrow @safe
wstring to_c_wstring(const wchar[] input)

	do
	{
		return (input ~ '\0').idup;
	}

pure nothrow @safe
immutable (C)[] from_stringz(C, size_t INPUT_LENGTH)(const ref C[INPUT_LENGTH] input)
	if (std.traits.isSomeChar!(C))

	in
	{
		static assert(INPUT_LENGTH >= 1);
	}

	do
	{
		size_t i = 0;

		for (; (i < INPUT_LENGTH) && (input[i] != '\0') && (input[i] != '\xFF'); i++) {
		}

		return input[0 .. i].idup;
	}

pure nothrow @safe
immutable (C)[] from_stringz(C)(const ref C[] input)
	if (std.traits.isSomeChar!(C))

	in
	{
		assert(input.length >= 1);
	}

	do
	{
		size_t i = 0;

		for (; (i < input.length) && (input[i] != '\0') && (input[i] != '\xFF'); i++) {
		}

		return input[0 .. i].idup;
	}

pure nothrow @trusted
immutable (C)[] from_stringz(C)(const C* input)
	if (std.traits.isSomeChar!(C))

	do
	{
		size_t i = 0;
		C[] output_buf;

		for (; ((*(input + i)) != '\0') && (*(input + i)) != '\xFF'; i++) {
			output_buf ~= *(input + i);
		}

		output_buf ~= '\0';

		return output_buf.idup;
	}

pure nothrow @trusted
immutable (C)[] from_stringz(C)(const C* input, size_t max_length)
	if (std.traits.isSomeChar!(C))

	do
	{
		if (max_length == 0) {
			return null;
		}

		size_t i = 0;
		C[] output_buf = new C[max_length];

		for (; (i < max_length) && ((*(input + i)) != '\0') && ((*(input + i)) != '\xFF'); i++) {
			output_buf[i] = *(input + i);
		}

		return output_buf[0 .. i].idup;
	}

pure nothrow @safe
immutable (C)[] to_cstring(C, size_t INPUT_LENGTH)(const ref C[INPUT_LENGTH] input)
	if (std.traits.isSomeChar!(C))

	in
	{
		static assert(INPUT_LENGTH >= 2);
	}

	do
	{
		enum size_t c_max = INPUT_LENGTH - 1;
		size_t i = 0;
		C[INPUT_LENGTH] output_buf;

		for (; (i < c_max) && (input[i] != '\0') && (input[i] != '\xFF'); i++) {
			output_buf[i] = input[i];
		}

		i++;
		output_buf[i] = '\0';

		return output_buf[0 .. i].idup;
	}

pure nothrow @safe
immutable (C)[] to_cstring(C, size_t INPUT_LENGTH, size_t OUTPUT_LENGTH)(const ref C[INPUT_LENGTH] input, ref C[OUTPUT_LENGTH] output_buf)
	if (std.traits.isSomeChar!(C))

	in
	{
		static assert(input.length >= 2);
		static assert(OUTPUT_LENGTH >= INPUT_LENGTH);
	}

	do
	{
		size_t i = 0;
		size_t c_max = INPUT_LENGTH - 1;

		for (; (i < c_max) && (input[i] != '\0') && (input[i] != '\xFF'); i++) {
			output_buf[i] = input[i];
		}

		i++;
		output_buf[i] = '\0';

		return output_buf[0 .. i].idup;
	}

pure nothrow @trusted
immutable (C)[] to_cstring(C)(const C* input, size_t max_length)
	if (std.traits.isSomeChar!(C))

	do
	{
		if (max_length == 0) {
			return null;
		}

		size_t i = 0;
		size_t c_max = max_length - 1;
		C[] output_buf = new C[max_length + 1];

		for (; (i < c_max) && ((*(input + i)) != '\0') && ((*(input + i)) != '\xFF'); i++) {
			output_buf[i] = *(input + i);
		}

		i++;
		output_buf[i] = '\0';

		return output_buf[0 .. i].idup;
	}
