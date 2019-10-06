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
module npp_api.pluginfunc.config_file;


version (Windows):
version (Not_betterC):

private static import std.traits;
private static import npp_api.pluginfunc.path;
private static import npp_api.pluginfunc.string;

enum setting_name_length = 64;
enum string_max_lengt = npp_api.pluginfunc.path.OS_MAX_PATH;

enum config_type_t
{
	none,
	ini,
	json,
	registry,
}

enum value_type : ubyte
{
	none = 0,

	//basic types
	string_type = 1,
	bool_type = 2,
	int_type = 3,
	uint_type = 4,
	float_type = 5,

	//other types
	path_type = 6,
}

union value_data
{
	string string_value;
	wstring wstring_value;
	bool bool_value;
	int int_value;
	uint uint_value;
	float float_value;
}

union value_buf
{
	char[string_max_lengt] string_value;
	wchar[string_max_lengt] wstring_value;
	bool bool_value;
	int int_value;
	uint uint_value;
	float float_value;
	wchar[npp_api.pluginfunc.path.OS_MAX_PATH] path_value;
}

alias value_filter_func_t = pure nothrow @safe @nogc bool function(const ref value_buf);

mixin template setting_item_internal(C)
	if (std.traits.isSomeChar!(C))
{
	private static import npp_api.pluginfunc.config_file;
	private static import npp_api.pluginfunc.string;

	C[npp_api.pluginfunc.config_file.setting_name_length] name;
	npp_api.pluginfunc.config_file.value_type type = npp_api.pluginfunc.config_file.value_type.none;
	npp_api.pluginfunc.config_file.value_data value;

	/**
	 * 追加のフィルター
	 */
	npp_api.pluginfunc.config_file.value_filter_func_t extra_filter = null;

	invariant
	{
		assert((this.name[0] != '\0') && (this.name[0] != '\xFF'));
		assert((npp_api.pluginfunc.config_file.setting_name_length - 1) >= npp_api.pluginfunc.string.count_string(this.name));
	}
}

struct setting_item
{
	mixin setting_item_internal!(char);
}

struct plugin_config_info
{
	.config_type_t type = npp_api.pluginfunc.config_file.config_type_t.none;

	/**
	 * config directory name
	 */
	string directory_name = null;

	/**
	 * config file name
	 */
	string file_name = null;

	/**
	 * ini config section name
	 */
	string ini_section_name = null;

	/**
	 * 自動的に設定する設定名と値
	 */
	.setting_item[] settings = null;
}
