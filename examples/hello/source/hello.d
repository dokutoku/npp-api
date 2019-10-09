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
 * Notepad++ hello plugin
 *
 * License: GPL-2.0 or later
 */
module npp_api.example.hello;


version (Windows):

import npp_api.pluginfunc;

/**
 * plugin config
 */
enum npp_plugin_definition plugin_def =
{
	name: "hello plugin",
	version_string: "0.1",
	author: "",
	menu_items:
	[
		{
			func_item:
			{
				_itemName: "Hello Notepad++"w,
				_pFunc: &hello,
				_init2Check: false,
				_pShKey: null,
			},
		},
	],
};

/**
 * plugin menu item
 * show "Hello, World" message
 */
extern (C)
nothrow @nogc
void hello()

	do
	{
		MessageBoxW(.nppData._nppHandle, &(c_wstring!("Hello, Notepad++!"w)[0]), &(c_wstring!(plugin_def.name)[0]), MB_OK);
	}

/**
 * This function is called within the "DllMain" function.
 *
 * You can delete this function.
 */
pragma(inline, true)
nothrow
void pluginInit(HANDLE hModule)

	do
	{
	}

/**
 * This function is called within the "DllMain" function.
 *
 * You can delete this function.
 */
pragma(inline, true)
nothrow
void pluginCleanUp()

	do
	{
	}

/**
 * This function is called within the "setInfo" function.
 *
 * You can delete this function.
 */
pragma(inline, true)
nothrow
void pluginSetInfo(ref NppData notpadPlusData)

	do
	{
	}

/**
 * This function is called within the "beNotified" function.
 *
 * You can delete this function.
 */
pragma(inline, true)
nothrow
void pluginBeNotified(ref SCNotification notifyCode)

	do
	{
		/*
		switch (notifyCode.nmhdr.code) {
			case NPPN_READY:
			case NPPN_TBMODIFICATION:
			case NPPN_FILEBEFORECLOSE:
			case NPPN_FILEOPENED:
			case NPPN_FILECLOSED:
			case NPPN_FILEBEFOREOPEN:
			case NPPN_FILEBEFORESAVE:
			case NPPN_FILESAVED:
			case NPPN_SHUTDOWN:
			case NPPN_BUFFERACTIVATED:
			case NPPN_LANGCHANGED:
			case NPPN_WORDSTYLESUPDATED:
			case NPPN_SHORTCUTREMAPPED:
			case NPPN_FILEBEFORELOAD:
			case NPPN_FILELOADFAILED:
			case NPPN_READONLYCHANGED:
			case NPPN_DOCORDERCHANGED:
			case NPPN_SNAPSHOTDIRTYFILELOADED:
			case NPPN_BEFORESHUTDOWN:
			case NPPN_CANCELSHUTDOWN:
			case NPPN_FILEBEFORERENAME:
			case NPPN_FILERENAMECANCEL:
			case NPPN_FILERENAMED:
			case NPPN_FILEBEFOREDELETE:
			case NPPN_FILEDELETEFAILED:
			case NPPN_FILEDELETED:
				break;

			default:
				break;
		}
		*/
	}

/**
 * This function is called within the "messageProc" function.
 *
 * You can delete this function.
 */
pragma(inline, true)
nothrow
bool pluginMessageProc(UINT Message, WPARAM wParam, LPARAM lParam)

	do
	{
		/*
		switwch (Message) {
			case WM_MOVE:
			case WM_SIZE:
			case WM_COMMAND:
				break;

			default:
				break;
		}
		*/

		return true;
	}

/**
 * mixin Notepad++ interface
 */
mixin npp_plugin_interface!(.plugin_def);
