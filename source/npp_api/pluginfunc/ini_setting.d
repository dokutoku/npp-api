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
 * ini file setting
 *
 * Author: dokutoku, https://twitter.com/dokutoku3
 * License: GPL-2.0 or later
 */
module npp_api.pluginfunc.ini_setting;


version (Windows):
version (Not_betterC):

private static import core.sys.windows.winbase;
private static import core.sys.windows.windef;
private static import core.sys.windows.winnt;
private static import core.sys.windows.winuser;
private static import std.conv;
private static import std.file;
private static import std.path;
private static import std.stdio;
private static import std.string;
private static import std.traits;
private static import std.utf;
private static import npp_api.pluginfunc.string;
private static import npp_api.pluginfunc.npp_msgs;
private static import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;
private static import npp_api.powereditor.misc.pluginsmanager.plugininterface;
private static import npp_api.pluginfunc.menu;
private static import npp_api.pluginfunc.path;
private static import npp_api.pluginfunc.config_file;

struct ini_setting_item
{
	mixin npp_api.pluginfunc.config_file.setting_item_internal!(wchar);
}

ini_setting_item[output_length] convert_setting(size_t output_length)(npp_api.pluginfunc.config_file.setting_item[] input_setting)

	body
	{
		static import npp_api.pluginfunc.config_file;

		ini_setting_item[output_length] output;

		for (size_t i = 0; i < input_setting.length; i++) {
			output[i].name = std.utf.toUTF16(input_setting[i].name[0 .. $]);
			output[i].name = npp_api.pluginfunc.string.copy_string(output[i].name);
			output[i].type = input_setting[i].type;

			switch (input_setting[i].type) {
				case npp_api.pluginfunc.config_file.value_type.string_type:
				case npp_api.pluginfunc.config_file.value_type.path_type:
					if (input_setting[i].value.string_value != null) {
						output[i].value.wstring_value = std.utf.toUTF16(input_setting[i].value.string_value[0 .. $]);
					}

					break;

				default:
					output[i].value = input_setting[i].value;

					break;
			}

			output[i].extra_filter = input_setting[i].extra_filter;
		}

		return output;
	}

pure nothrow @safe
wstring[] create_setting_idetifiers(size_t setting_length)(ini_setting_item[setting_length] setting_items)

	body
	{
		static import npp_api.pluginfunc.string;

		wstring[] output = new wstring[setting_length];

		for (size_t i = 0; i < setting_items.length; i++) {
			output[i] = npp_api.pluginfunc.string.from_stringz(setting_items[i].name);
		}

		return output;
	}

struct npp_ini_session
{
	static import core.sys.windows.winbase;
	static import core.sys.windows.windef;
	static import core.sys.windows.winnt;
	static import core.sys.windows.winuser;
	static import std.conv;
	static import std.file;
	static import std.path;
	static import std.stdio;
	static import std.string;
	static import std.traits;
	static import std.utf;
	static import npp_api.powereditor.misc.pluginsmanager.plugininterface;
	static import npp_api.pluginfunc.npp_msgs;
	static import npp_api.pluginfunc.string;
	static import npp_api.pluginfunc.path;
	static import npp_api.pluginfunc.config_file;

private:
	wstring npp_config_path = null;
	wstring plugin_config_path = null;
	wstring config_file = null;
	core.sys.windows.winnt.WCHAR[] section_name = null;
	bool is_valid = false;
	wchar[npp_api.pluginfunc.config_file.setting_name_length] setting_name_buf;
	//path_buf;

public:
	this(core.sys.windows.windef.HWND _nppHandle, const wchar[] plugin_directry, const wchar[] config_filename, const wchar[] section_name)

		in
		{
			assert(section_name.length != 0);

			if (plugin_directry.length != 0) {
				assert(std.path.isValidPath(plugin_directry));
			}
		}

		body
		{
			this.section_name = section_name.dup;
			this.section_name ~= "\0"w;
			core.sys.windows.winnt.WCHAR[npp_api.pluginfunc.path.OS_MAX_PATH] input_buf = '\0';
			npp_api.pluginfunc.npp_msgs.send_NPPM_GETPLUGINSCONFIGDIR(_nppHandle, input_buf.length, &(input_buf[0]));
			this.npp_config_path = npp_api.pluginfunc.string.from_stringz(input_buf);

			if (std.file.exists(this.npp_config_path) && std.file.isDir(this.npp_config_path)) {
				if (plugin_directry.length != 0) {
					this.plugin_config_path = std.path.buildPath(this.npp_config_path, plugin_directry).idup;

					if (!std.file.exists(this.plugin_config_path) || !std.file.isDir(this.plugin_config_path)) {
						std.file.mkdir(this.plugin_config_path);
					}
				} else {
					this.plugin_config_path = this.npp_config_path.idup;
				}

				this.config_file = std.path.buildPath(this.plugin_config_path, std.path.setExtension(config_filename, `.ini`w)).idup;

				if (!std.file.exists(this.config_file) || !std.file.isFile(this.config_file)) {
					try {
						std.stdio.File new_file = std.stdio.File(this.config_file, `w`w);
						new_file.close();
						this.is_valid = true;
					} catch (Exception e) {
						//ToDo:
					}
				} else {
					this.is_valid = true;
				}

				this.config_file ~= "\0"w;
			} else {
				throw new Exception(`Unknown Notepad++ config path`);
			}
		}

	pragma(inline, true)
	pure nothrow @safe @nogc
	bool is_valid_setting() const

		body
		{
			return this.is_valid;
		}

	/**
	 * メニューにチェックをつけるかどうか
	 *
	 * Params:
	 *      key_name = 設定名
	 *      default_value = 設定の読み込みに失敗した場合のデフォルト値
	 *
	 * Returns: メニューにチェックをつけるかどうか
	 */
	nothrow @nogc
	bool is_mfs_checked(const wchar[] key_name, bool default_value = false)

		in
		{
			assert(key_name.length != 0);
		}

		body
		{
			npp_api.pluginfunc.string.copy_string(this.setting_name_buf, key_name);
			core.sys.windows.windef.UINT result = core.sys.windows.winbase.GetPrivateProfileIntW(&(this.section_name[0]), &(this.setting_name_buf[0]), int.max, &(this.config_file[0]));

			if (result == int.max) {
				return default_value;
			}

			return (result == 1) ? (true) : (false);
		}

	nothrow @nogc
	void load_menu_checked(size_t menu_index_length)(ref npp_api.pluginfunc.menu.sub_menu_index[menu_index_length] menu_index)

		body
		{
			for (size_t i = 0; i < menu_index.length; i++) {
				if (menu_index[i].menu_checked_identifier.length != 0) {
					menu_index[i].func_item._init2Check = this.is_mfs_checked(menu_index[i].menu_checked_identifier, menu_index[i].func_item._init2Check);
				}
			}
		}

	nothrow
	void auto_load(size_t setting_length)(ref .ini_setting_item[setting_length] settings) const

		body
		{
			npp_api.pluginfunc.config_file.value_buf value_buf;

			bool result_temp;

			foreach (ref setting; settings) {
				result_temp = false;

				switch (setting.type) {
					case npp_api.pluginfunc.config_file.value_type.bool_type:
						result_temp = this.load_config(setting.name, value_buf.bool_value);

						if ((result_temp) && (setting.extra_filter != null)) {
							result_temp = setting.extra_filter(value_buf);
						}

						if (result_temp) {
							setting.value.bool_value = value_buf.bool_value;
						}

						break;

					case npp_api.pluginfunc.config_file.value_type.int_type:
						result_temp = this.load_config(setting.name, int.max, value_buf.int_value);

						if ((result_temp) && (setting.extra_filter != null)) {
							result_temp = setting.extra_filter(value_buf);
						}

						if (result_temp) {
							setting.value.int_value = value_buf.int_value;
						}

						break;

					case npp_api.pluginfunc.config_file.value_type.uint_type:
						result_temp = this.load_config(setting.name, uint.max, value_buf.uint_value);

						if ((result_temp) && (setting.extra_filter != null)) {
							result_temp = setting.extra_filter(value_buf);
						}

						if (result_temp) {
							setting.value.uint_value = value_buf.uint_value;
						}

						break;

					case npp_api.pluginfunc.config_file.value_type.string_type:
						value_buf.wstring_value[] = '\0';
						result_temp = this.load_config(setting.name, value_buf.wstring_value);

						if ((result_temp) && (setting.extra_filter != null)) {
							result_temp = setting.extra_filter(value_buf);
						}

						if (result_temp) {
							setting.value.wstring_value = npp_api.pluginfunc.string.from_stringz(value_buf.wstring_value);
						}

						break;

					case npp_api.pluginfunc.config_file.value_type.path_type:
						value_buf.wstring_value[] = '\0';
						result_temp = this.load_config(setting.name, value_buf.wstring_value);

						if ((result_temp) && (setting.extra_filter != null)) {
							result_temp = setting.extra_filter(value_buf);
						}

						if (result_temp) {
							setting.value.wstring_value = npp_api.pluginfunc.string.from_stringz(value_buf.path_value);
						}

						break;

					default:
						break;
				}
			}
		}

	pragma(inline, true)
	nothrow
	void auto_load(size_t setting_length, size_t menu_index_length)(ref .ini_setting_item[setting_length] settings, ref npp_api.pluginfunc.menu.sub_menu_index[menu_index_length] menu_index)

		body
		{
			this.auto_load(settings);
			this.load_menu_checked(menu_index);
		}

	pragma(inline, true)
	nothrow @nogc
	void write_menu_checked(const wchar[] key_name, bool value)

		in
		{
			assert(key_name.length != 0);
		}

		body
		{
			npp_api.pluginfunc.string.copy_string(this.setting_name_buf, key_name);
			core.sys.windows.winbase.WritePrivateProfileStringW(&(this.section_name[0]), &(this.setting_name_buf[0]), &(((value) ? (npp_api.pluginfunc.string.c_wstring!(`1`w)) : (npp_api.pluginfunc.string.c_wstring!(`0`w)))[0]), &(this.config_file[0]));
		}

	pragma(inline, true)
	nothrow @nogc
	void write_menu_checked(size_t menu_index_length)(ref npp_api.pluginfunc.menu.sub_menu_index[menu_index_length] menu_index)

		body
		{
			for (size_t i = 0; i < menu_index.length; i++) {
				if (menu_index[i].menu_checked_identifier.length != 0) {
					this.write_menu_checked(menu_index[i].menu_checked_identifier, menu_index[i].func_item._init2Check);
				}
			}
		}

	pragma(inline, true)
	nothrow
	bool auto_write(size_t setting_length)(const ref .ini_setting_item[setting_length] settings)

		body
		{
			foreach (setting; settings) {
				switch (setting.type) {
					case npp_api.pluginfunc.config_file.value_type.bool_type:
						this.write_config(setting.name, setting.value.bool_value);

						break;

					case npp_api.pluginfunc.config_file.value_type.int_type:
						this.write_config(setting.name, setting.value.int_value);

						break;

					case npp_api.pluginfunc.config_file.value_type.uint_type:
						this.write_config(setting.name, setting.value.uint_value);

						break;

					case npp_api.pluginfunc.config_file.value_type.string_type:
						this.write_config(setting.name, setting.value.wstring_value);

						break;

					case npp_api.pluginfunc.config_file.value_type.path_type:
						this.write_config(setting.name, setting.value.wstring_value);

						break;

					default:
						break;
				}
			}
		}

	pragma(inline, true)
	nothrow
	void auto_write(size_t setting_length, size_t menu_index_length)(ref .ini_setting_item[setting_length] settings, ref npp_api.pluginfunc.menu.sub_menu_index[menu_index_length] menu_index)

		body
		{
			this.auto_write(settings);
			this.load_menu_checked(menu_index);
		}

	/**
	 * ???
	 *
	 * Params:
	 *      key_name = ???
	 *      result_value = オプションの格納場所
	 *
	 * Returns: 正常にloadできたかどうか
	 */
	nothrow @nogc
	bool load_config(const ref wchar[npp_api.pluginfunc.config_file.setting_name_length] key_name, ref bool result_value) const

		in
		{
			assert(key_name[$ - 1] == '\0');
		}

		body
		{
			core.sys.windows.windef.UINT temp_value = core.sys.windows.winbase.GetPrivateProfileIntW(&(this.section_name[0]), &(key_name[0]), int.max, &(this.config_file[0]));

			switch (temp_value) {
				case 0:
					result_value = false;

					return true;

				case 1:
					result_value = true;

					return true;

				default:
					return false;
			}
		}

	/**
	 * ???
	 *
	 * Params:
	 *      key_name = ???
	 *      invaild_value = ???
	 *      result_value = オプションの格納場所
	 *
	 * Returns: 正常にloadできたかどうか
	 */
	nothrow @nogc
	bool load_config(const ref wchar[npp_api.pluginfunc.config_file.setting_name_length] key_name, core.sys.windows.windef.INT invaild_value, ref core.sys.windows.windef.UINT result_value) const

		in
		{
			assert(key_name[$ - 1] == '\0');
		}

		body
		{
			core.sys.windows.windef.UINT temp_value = core.sys.windows.winbase.GetPrivateProfileIntW(&(this.section_name[0]), &(key_name[0]), invaild_value, &(this.config_file[0]));

			if (temp_value == invaild_value) {
				return false;
			}

			result_value = temp_value;

			return true;
		}

	/**
	 * ???
	 *
	 * Params:
	 *      key_name = ???
	 *      invaild_value = ???
	 *      result_value = オプションの格納場所
	 *
	 * Returns: 正常にloadできたかどうか
	 */
	nothrow @nogc
	bool load_config(const ref wchar[npp_api.pluginfunc.config_file.setting_name_length] key_name, core.sys.windows.windef.INT invaild_value, ref int result_value) const

		in
		{
			assert(key_name[$ - 1] == '\0');
		}

		body
		{
			core.sys.windows.windef.UINT temp_value = core.sys.windows.winbase.GetPrivateProfileIntW(&(this.section_name[0]), &(key_name[0]), invaild_value, &(this.config_file[0]));

			if (temp_value == invaild_value) {
				return false;
			}

			result_value = cast(int)(temp_value);

			return true;
		}

	/**
	 * ???
	 *
	 * Params:
	 *      key_name = ???
	 *      invaild_value = ???
	 *      result_value = オプションの格納場所
	 *
	 * Returns: 正常にloadできたかどうか
	 */
	pragma(inline, true)
	nothrow @nogc
	bool load_config(size_t value_length)(const ref wchar[npp_api.pluginfunc.config_file.setting_name_length] key_name, ref wchar[value_length] result_value) const

		in
		{
			assert(key_name[$ - 1] == '\0');
		}

		body
		{
			core.sys.windows.windef.DWORD result_temp = core.sys.windows.winbase.GetPrivateProfileStringW(&(this.section_name[0]), &(key_name[0]), &("\0"w[0]), &(result_value[0]), result_value.length, &(this.config_file[0]));

			if ((result_temp == 0) || (result_value[0] == '\0')) {
				return false;
			}

			return true;
		}

	/**
	 * ???
	 *
	 * Params:
	 *      key_name = ???
	 *      result_value = オプションの格納場所
	 *
	 * Returns: 正常にloadできたかどうか
	 */
	pragma(inline, true)
	bool load_config(C)(const (C)[] key_name, ref bool result_value) const
		if (std.traits.isSomeChar!(C))

		in
		{
		}

		body
		{
			core.sys.windows.windef.UINT temp_value = core.sys.windows.winbase.GetPrivateProfileIntW(&(this.section_name[0]), std.utf.toUTF16z(key_name), int.max, &(this.config_file[0]));

			switch (temp_value) {
				case 0:
					result_value = false;

					return true;

				case 1:
					result_value = true;

					return true;

				default:
					return false;
			}
		}

	/**
	 * ???
	 *
	 * Params:
	 *      key_name = ???
	 *      invaild_value = ???
	 *      result_value = オプションの格納場所
	 *
	 * Returns: 正常にloadできたかどうか
	 */
	pragma(inline, true)
	bool load_config(C)(const (C)[] key_name, core.sys.windows.windef.INT invaild_value, ref core.sys.windows.windef.UINT result_value) const
		if (std.traits.isSomeChar!(C))

		in
		{
		}

		body
		{
			core.sys.windows.windef.UINT temp_value = core.sys.windows.winbase.GetPrivateProfileIntW(&(this.section_name[0]), std.utf.toUTF16z(key_name), invaild_value, &(this.config_file[0]));

			if (temp_value == invaild_value) {
				return false;
			}

			result_value = temp_value;

			return true;
		}

	/**
	 * ???
	 *
	 * Params:
	 *      key_name = ???
	 *      value = ???
	 *
	 * Returns: WritePrivateProfileStringWの結果
	 */
	pragma(inline, true)
	nothrow @nogc
	bool write_config(size_t value_length)(const ref wchar[npp_api.pluginfunc.config_file.setting_name_length] key_name, bool value) const

		in
		{
			assert(key_name[$ - 1] == '\0');
		}

		body
		{
			return (core.sys.windows.winbase.WritePrivateProfileStringW(&(this.section_name[0]), &(key_name[0]), &(((value) ? (npp_api.pluginfunc.string.c_wstring!(`1`w)) : (npp_api.pluginfunc.string.c_wstring!(`0`w)))[0]), &(this.config_file[0])) != 0) ? (true) : (false);
		}

	/**
	 * ???
	 *
	 * Params:
	 *      key_name = ???
	 *      value = ???
	 *
	 * Returns: 正常にwriteできたかどうか
	 */
	pragma(inline, true)
	nothrow
	bool write_config(size_t value_length, D)(const ref wchar[npp_api.pluginfunc.config_file.setting_name_length] key_name, const D value) const
		if (std.traits.isNumeric!(D))

		in
		{
			assert(key_name[$ - 1] == '\0');
		}

		body
		{
			return (core.sys.windows.winbase.WritePrivateProfileStringW(&(this.section_name[0]), &(key_name[0]), std.utf.toUTF16z(std.conv.to!(wstring)(value)), &(this.config_file[0])) != 0) ? (true) : (false);
		}

	/**
	 * ???
	 *
	 * Params:
	 *      key_name = ???
	 *      value = ???
	 *
	 * Returns: 正常にwriteできたかどうか
	 */
	pragma(inline, true)
	nothrow
	bool write_config(size_t value_length)(const ref wchar[npp_api.pluginfunc.config_file.setting_name_length] key_name, const wchar[] value) const

		in
		{
			assert(key_name[$ - 1] == '\0');
		}

		body
		{

			return (core.sys.windows.winbase.WritePrivateProfileStringW(&(this.section_name[0]), &(key_name[0]), (value.length != 0) ? (std.utf.toUTF16z(value)) : (core.sys.windows.windef.NULL), &(this.config_file[0])) != 0) ? (true) : (false);
		}

	/**
	 * ???
	 *
	 * Params:
	 *      key_name = ???
	 *      value = ???
	 *
	 * Returns: WritePrivateProfileStringWの結果
	 */
	pragma(inline, true)
	bool write_config(C)(const (C)[] key_name, bool value) const
		if (std.traits.isSomeChar!(C))

		in
		{
			assert(key_name.length != 0);
		}

		body
		{
			return (core.sys.windows.winbase.WritePrivateProfileStringW(&(this.section_name[0]), std.utf.toUTF16z(key_name), &(((value) ? (npp_api.pluginfunc.string.c_wstring!(`1`w)) : (npp_api.pluginfunc.string.c_wstring!(`0`w)))[0]), &(this.config_file[0])) != 0) ? (true) : (false);
		}

	/**
	 * ???
	 *
	 * Params:
	 *      key_name = ???
	 *      value = ???
	 *
	 * Returns: 正常にwriteできたかどうか
	 */
	pragma(inline, true)
	bool write_config(C, D)(const (C)[] key_name, const D value) const
		if (std.traits.isSomeChar!(C) && std.traits.isNumeric!(D))

		in
		{
		}

		body
		{
			return (core.sys.windows.winbase.WritePrivateProfileStringW(&(this.section_name[0]), std.utf.toUTF16z(key_name), std.utf.toUTF16z(std.conv.to!(wstring)(value)), &(this.config_file[0])) != 0) ? (true) : (false);
		}

	/**
	 * ???
	 *
	 * Params:
	 *      key_name = ???
	 *      value = ???
	 *
	 * Returns: 正常にwriteできたかどうか
	 */
	bool write_config(C)(const (C)[] key_name, const (C)[] value) const
		if (std.traits.isSomeChar!(C))

		in
		{
		}

		body
		{
			if (value.length == 0) {
				return (core.sys.windows.winbase.WritePrivateProfileStringW(&(this.section_name[0]), std.utf.toUTF16z(key_name), core.sys.windows.windef.NULL, &(this.config_file[0])) != 0) ? (true) : (false);
			} else {
				return (core.sys.windows.winbase.WritePrivateProfileStringW(&(this.section_name[0]), std.utf.toUTF16z(key_name), std.utf.toUTF16z(value), &(this.config_file[0])) != 0) ? (true) : (false);
			}
		}

	/**
	 * ???
	 *
	 * Params:
	 *      ??? = ???
	 */
	void write_config(C)(const (C)[] key_name, const npp_api.powereditor.misc.pluginsmanager.plugininterface.FuncItem func_item) const
		if (std.traits.isSomeChar!(C))

		body
		{
			this.write_config(key_name, func_item._init2Check);
		}

	pragma(inline, true)
	pure nothrow @safe
	wstring get_config_file_path() const

		body
		{
			return this.config_file.idup;
		}

	pragma(inline, true)
	pure nothrow @safe
	wstring get_config_folder_path() const

		body
		{
			return this.plugin_config_path.idup;
		}

	/**
	 * 
	 */
	void mkdir(const wchar[] sub_directry = ``w)

		in
		{
			if (sub_directry.length != 0) {
				assert(std.path.isValidPath(sub_directry));
			}
		}

		body
		{
			wstring path = std.path.buildPath(this.plugin_config_path, sub_directry);

			if (!std.file.exists(path) && !std.file.isDir(path)) {
				std.file.mkdir(path);
			}
		}

	invariant
	{
		assert((this.section_name.length != 0) && (this.section_name[$ - 1] == '\0'));
		assert((this.config_file.length != 0));
	}
}
