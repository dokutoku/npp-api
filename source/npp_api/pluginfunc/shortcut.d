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
 * ショートカットをいろいろする
 *
 * Author: dokutoku, https://twitter.com/dokutoku3
 * License: GPL-2.0 or later
 */
module npp_api.pluginfunc.shortcut;


version (Windows):

private static import core.sys.windows.windef;
private static import core.sys.windows.winuser;
private static import npp_api.powereditor.misc.pluginsmanager.plugininterface;
private static import npp_api.pluginfunc.menu;

pure nothrow @safe @nogc
void set_ACCEL(ref core.sys.windows.winuser.ACCEL HACCEL_shortcut, const ref npp_api.powereditor.misc.pluginsmanager.plugininterface.ShortcutKey npp_shortcut, core.sys.windows.windef.WORD cmd = 0)

	do
	{
		HACCEL_shortcut.cmd = cmd;
		HACCEL_shortcut.key = npp_shortcut._key;
		HACCEL_shortcut.fVirt =
			((npp_shortcut._isCtrl) ? (core.sys.windows.winuser.FCONTROL) : (0))
			| ((npp_shortcut._isAlt) ? (core.sys.windows.winuser.FALT) : (0))
			| ((npp_shortcut._isShift) ? (core.sys.windows.winuser.FSHIFT) : (0))
			| (core.sys.windows.winuser.FVIRTKEY);
	}

version (Not_betterC):

pure nothrow @safe @nogc
size_t sub_menu_shortcuts_length(const npp_api.pluginfunc.menu.sub_menu_index[] menu_list)

	do
	{
		size_t length;

		for (size_t i = 0; i < menu_list.length; i++) {
			if ((menu_list[i].depth > 1) && (menu_list[i].func_item._pShKey != null)) {
				length++;
			}
		}

		return length;
	}

pure nothrow @safe @nogc
core.sys.windows.winuser.ACCEL[shortcut_length] create_sub_menu_shortcuts(size_t shortcut_length)(const ref npp_api.pluginfunc.menu.sub_menu_index[] menu_list)

	in
	{
		assert(shortcut_length == sub_menu_shortcuts_length(menu_list));
	}

	do
	{
		core.sys.windows.winuser.ACCEL[shortcut_length] output;

		size_t length = 0;

		for (size_t i = 0; i < menu_list.length; i++) {
			if ((menu_list[i].depth > 1) && (menu_list[i].func_item._pShKey != null)) {
				.set_ACCEL(output[length], *(menu_list[i].func_item._pShKey));
				length++;
			}
		}

		return output;
	}
