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
 * general plugin functions
 *
 * Author: dokutoku, https://twitter.com/dokutoku3
 * License: GPL-2.0 or later
 */
module npp_api.pluginfunc.basic;


version (Windows):

pragma(lib, "kernel32.lib");
pragma(lib, "user32.lib");

private static import core.sys.windows.winbase;
private static import core.sys.windows.windef;
private static import core.sys.windows.winnt;
private static import core.sys.windows.winuser;
private static import std.format;
private static import std.utf;
private static import npp_api.pluginfunc.string;

//plugin func
mixin template plugin_messageBox(wstring plugin_name)
{
	private static import core.sys.windows.winbase;
	private static import core.sys.windows.windef;
	private static import core.sys.windows.winnt;
	private static import core.sys.windows.winuser;
	private static import std.format;
	private static import std.utf;
	private static import npp_api.pluginfunc.string;

	static assert(plugin_name.length != 0);
	static assert(plugin_name[$ - 1] == '\0');

	/**
	 * show message
	 */
	nothrow
	void msgbox(C)(const (C)[] message)

		in
		{
			static import std.utf;
			static import std.exception;

			std.exception.assertNotThrown(std.utf.validate(message));
		}

		do
		{
			static import core.sys.windows.winuser;
			static import std.utf;

			try {
				core.sys.windows.winuser.MessageBoxW(.nppData._nppHandle, std.utf.toUTF16z(message), &(plugin_name[0]), core.sys.windows.winuser.MB_OK);
			} catch (Exception e) {
			}
		}

	nothrow @nogc
	trusted_msgbox(const wchar[] c_string)

		in
		{
			assert(c_string.length != 0);
			assert(c_string[$ - 1] == '\0');
		}

		do
		{
			static import core.sys.windows.winuser;

			core.sys.windows.winuser.MessageBoxW(.nppData._nppHandle, &(c_string[0]), &(plugin_name[0]), core.sys.windows.winuser.MB_OK);
		}

	/**
	 * Windowsのシステムエラーメッセージを表示する関数
	 */
	nothrow @nogc
	void show_windows_error(core.sys.windows.windef.DWORD lang_id = 0)

		do
		{
			static import core.sys.windows.winbase;
			static import core.sys.windows.windef;
			static import core.sys.windows.winnt;
			static import core.sys.windows.winuser;
			static import npp_api.pluginfunc.string;

			core.sys.windows.windef.DWORD error_code = core.sys.windows.winbase.GetLastError();

			if (error_code != 0) {
				core.sys.windows.winnt.WCHAR[512] message = '\0';

				if ((core.sys.windows.winbase.FormatMessageW(core.sys.windows.winbase.FORMAT_MESSAGE_FROM_SYSTEM, core.sys.windows.windef.NULL, error_code, lang_id, &(message[0]), message.length, core.sys.windows.windef.NULL)) == 0) {
					//show error code
					core.sys.windows.winuser.wsprintfW(&(message[0]), &(npp_api.pluginfunc.string.c_wstring!(`Windows Error Code: 0x%X`w)[0]), error_code);
					core.sys.windows.winuser.MessageBoxW(.nppData._nppHandle, &(message[0]), &(plugin_name[0]), core.sys.windows.winuser.MB_OK);
				} else {
					//show error message
					core.sys.windows.winuser.MessageBoxW(.nppData._nppHandle, &(message[0]), &(plugin_name[0]), core.sys.windows.winuser.MB_OK);
				}
			}
		}

	pure nothrow @safe @nogc
	void debug_format_msgbox(wstring format, A...)(A value)

		do
		{
			static import core.sys.windows.winuser;
			static import std.format;
			static import std.utf;
			static import npp_api.pluginfunc.string;

			debug {
				try {
					core.sys.windows.winuser.MessageBoxW(.nppData._nppHandle, std.utf.toUTF16z(std.format.format!(format)(value[0 .. $])), &(plugin_name[0]), core.sys.windows.winuser.MB_OK);
				} catch (Exception e) {
					core.sys.windows.winuser.MessageBoxW(.nppData._nppHandle, &(npp_api.pluginfunc.string.c_wstring!(`debug message Exception!`w)[0]), &(plugin_name[0]), core.sys.windows.winuser.MB_OK);
				}
			}
		}
}


/**
 * show message
 */
nothrow
void msgbox(C1, C2)(const (C1)[] message, const (C2)[] title)

	in
	{
		static import std.utf;
		static import std.exception;

		std.exception.assertNotThrown(std.utf.validate(message));
	}

	do
	{
		static import core.sys.windows.winuser;
		static import std.utf;

		try {
			core.sys.windows.winuser.MessageBoxW(.nppData._nppHandle, std.utf.toUTF16z(message), std.utf.toUTF16z(title), core.sys.windows.winuser.MB_OK);
		} catch (Exception e) {
		}
	}

/**
 * Windowsのシステムエラーメッセージを表示する関数
 */
nothrow @nogc
void show_windows_error(core.sys.windows.windef.HWND _nppHandle, const wchar[] title, core.sys.windows.windef.DWORD lang_id = 0)

	in
	{
		assert(title != null);
		assert(title[$ - 1] == '\0');
	}

	do
	{
		static import core.sys.windows.winbase;
		static import core.sys.windows.windef;
		static import core.sys.windows.winnt;
		static import core.sys.windows.winuser;
		static import npp_api.pluginfunc.string;

		core.sys.windows.windef.DWORD error_code = core.sys.windows.winbase.GetLastError();

		if (error_code != 0) {
			core.sys.windows.winnt.WCHAR[512] message = '\0';

			if ((core.sys.windows.winbase.FormatMessageW(core.sys.windows.winbase.FORMAT_MESSAGE_FROM_SYSTEM, core.sys.windows.windef.NULL, error_code, lang_id, &(message[0]), message.length, core.sys.windows.windef.NULL)) == 0) {
				//show error code
				core.sys.windows.winuser.wsprintfW(&(message[0]), &(npp_api.pluginfunc.string.c_wstring!(`Windows Error Code: 0x%X`w)[0]), error_code);
				core.sys.windows.winuser.MessageBoxW(_nppHandle, &(message[0]), &(title[0]), core.sys.windows.winuser.MB_OK);
			} else {
				//show error message
				core.sys.windows.winuser.MessageBoxW(_nppHandle, &(message[0]), &(title[0]), core.sys.windows.winuser.MB_OK);
			}
		}
	}

pure nothrow @safe @nogc
void debug_format_msgbox(wstring format, A...)(core.sys.windows.windef.HWND _nppHandle, const wchar[] title, A value)

	in
	{
		assert(title != null);
		assert(title[$ - 1] == '\0');
	}

	do
	{
		static import core.sys.windows.winuser;
		static import std.format;
		static import std.utf;
		static import npp_api.pluginfunc.string;

		debug {
			try {
				core.sys.windows.winuser.MessageBoxW(_nppHandle, std.utf.toUTF16z(std.format.format!(format)(value[0 .. $])), &(title[0]), core.sys.windows.winuser.MB_OK);
			} catch (Exception e) {
				core.sys.windows.winuser.MessageBoxW(_nppHandle, &(npp_api.pluginfunc.string.c_wstring!(`debug message Exception!`w)[0]), &(title[0]), core.sys.windows.winuser.MB_OK);
			}
		}
	}
