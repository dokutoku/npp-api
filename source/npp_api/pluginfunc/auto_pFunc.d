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
 * Notepad++のメニューから呼び出し可能な関数テンプレート。
 * _pFuncに関数ポインタを渡すのに使う。
 *
 * Author: dokutoku, https://twitter.com/dokutoku3
 * License: GPL-2.0 or later
 */
module npp_api.pluginfunc.auto_pFunc;


version (Windows):
version (Not_betterC):

pragma(lib, "user32.lib");
//pragma(lib, "Shell32.lib");

private static import core.sys.windows.shellapi;
private static import core.sys.windows.windef;
private static import core.sys.windows.winuser;
private static import std.traits;
private static import npp_api.powereditor.misc.pluginsmanager.plugininterface;
private static import npp_api.pluginfunc.string;

extern (C):
nothrow:

extern (C)
extern
npp_api.powereditor.misc.pluginsmanager.plugininterface.NppData nppData;

pure nothrow @safe @nogc
void auto_dummy_func()

	do
	{
	}

nothrow @nogc
void auto_message_box(alias message, alias title)()
	if (is(typeof(message) : immutable wstring) && is(typeof(title) : immutable wstring))

	in
	{
		static assert(message.length != 0);
		static assert(title.length != 0);
	}

	do
	{
		static import core.sys.windows.winuser;
		static import std.utf;
		static import npp_api.pluginfunc.string;

		enum message_def = npp_api.pluginfunc.string.c_wstring!(message);
		enum title_def = npp_api.pluginfunc.string.c_wstring!(title);

		core.sys.windows.winuser.MessageBoxW(.nppData._nppHandle, &(message_def[0]), &(title_def[0]), core.sys.windows.winuser.MB_OK);
	}

nothrow @nogc
void auto_open_uri(alias uri)()
	if (is(typeof(uri) : immutable wstring))

	in
	{
		static assert(uri.length != 0);
	}

	do
	{
		static import core.sys.windows.shellapi;
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import std.utf;
		static import npp_api.pluginfunc.string;

		enum uri_def = npp_api.pluginfunc.string.c_wstring!(uri);

		core.sys.windows.shellapi.ShellExecuteW(.nppData._nppHandle, &(npp_api.pluginfunc.string.c_wstring!(`open`w)[0]), &(uri_def[0]), core.sys.windows.windef.NULL, core.sys.windows.windef.NULL, core.sys.windows.winuser.SW_SHOWNORMAL);
	}

/**
 * メインメニューのチェックを変える
 */
mixin template mixin_main_menu_change_check(immutable string change_identifier, disable_identifiers...)
{
	private static import npp_api.pluginfunc.menu;

	extern (C)
	nothrow @nogc
	void auto_change_check()

		in
		{
			assert(.main_menu_def.length == .main_menu.length);

			foreach (disable_identifier; disable_identifiers) {
				static assert(is(typeof(disable_identifier) : immutable string));
			}
		}

		do
		{
			static import npp_api.pluginfunc.menu;

			enum change_pos = npp_api.pluginfunc.menu.search_menu_index(.menu_index_def, change_identifier);
			static assert(.main_menu_def.length > change_pos);
			npp_api.pluginfunc.menu.change_check(.nppData._nppHandle, .main_menu[change_pos]);

			static if (disable_identifiers.length != 0) {
				foreach (disable_identifier; disable_identifiers) {
					enum disable_menu_pos = npp_api.pluginfunc.menu.search_menu_index(.menu_index_def, disable_identifier);
					static assert(change_pos != disable_menu_pos);
					static assert(.main_menu_def.length > disable_menu_pos);
					npp_api.pluginfunc.menu.disable_check(.nppData._nppHandle, .main_menu[disable_menu_pos]);
				}
			}
		}
}

/**
 * メニューのチェックを変える
 */
mixin template mixin_menu_index_change_check(immutable string change_identifier, disable_identifiers...)
{
	private static import npp_api.pluginfunc.menu;

	extern (C)
	nothrow @nogc
	void auto_change_check()

		in
		{
			assert(.menu_index_def.length == .menu_index.length);

			foreach (disable_identifier; disable_identifiers) {
				static assert(is(typeof(disable_identifier) : immutable string));
			}
		}

		do
		{
			static import npp_api.pluginfunc.menu;

			enum change_pos = npp_api.pluginfunc.menu.search_index(.menu_index_def, change_identifier);
			static assert(.menu_index_def.length > change_pos);
			npp_api.pluginfunc.menu.change_check(.nppData._nppHandle, .menu_index[change_pos].func_item);

			static if (disable_identifiers.length != 0) {
				foreach (disable_identifier; disable_identifiers) {
					enum disable_menu_pos = npp_api.pluginfunc.menu.search_index(.menu_index_def, disable_identifier);
					static assert(change_pos != disable_menu_pos);
					static assert(.menu_index_def.length > disable_menu_pos);
					npp_api.pluginfunc.menu.disable_check(.nppData._nppHandle, .menu_index[disable_menu_pos].func_item);
				}
			}
		}
}

/**
 * 同階層のメニューのチェックを変える
 */
mixin template mixin_group_menu_checked(immutable string change_identifier)
{
	private static import npp_api.pluginfunc.menu;

	extern (C)
	nothrow @nogc
	void auto_change_check()

		do
		{
			enum size_t pos = search_index!(change_identifier);
			enum size_t start = npp_api.pluginfunc.menu.same_menu_start_pos(menu_index_def, pos);
			enum size_t end = npp_api.pluginfunc.menu.same_menu_end_pos(menu_index_def, pos);

			for (size_t i = start; i <= end; i++) {
				if (i == pos) {
					npp_api.pluginfunc.menu.change_check(.nppData._nppHandle, .menu_index[i].func_item);
				} else {
					npp_api.pluginfunc.menu.disable_check(.nppData._nppHandle, .menu_index[i].func_item);
				}
			}
		}
}
