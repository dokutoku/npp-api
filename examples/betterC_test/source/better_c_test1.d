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
 * BetterC test1
 *
 * Author: dokutoku, https://twitter.com/dokutoku3
 * License: GPL-2.0 or later
 */
module nppplugintemplate.better_c_test1;


version (Windows):
version (D_BetterC):
version (betterC_test1):

private static import core.sys.windows.basetsd;
private static import core.sys.windows.winnt;
private static import core.sys.windows.windef;
private static import npp_api.scintilla.scintilla;
private static import npp_api.powereditor.misc.pluginsmanager.plugininterface;

pragma(mangle, "nppData")
extern (C)
npp_api.powereditor.misc.pluginsmanager.plugininterface.NppData nppData;

npp_api.powereditor.misc.pluginsmanager.plugininterface.FuncItem main_menu;

extern (C)
pure nothrow @safe @nogc
void dummy_func()

	do
	{
	}

pragma(mangle, "DllMain")
extern (Windows)
pure nothrow @safe @nogc
core.sys.windows.windef.BOOL DllMain(core.sys.windows.basetsd.HANDLE hModule, core.sys.windows.windef.DWORD reasonForCall, core.sys.windows.winnt.LPVOID lpReserved)

	do
	{
		static import core.sys.windows.windef;

		return core.sys.windows.windef.TRUE;
	}

pragma(mangle, "getName")
extern (C)
pure nothrow @safe @nogc
export const (core.sys.windows.winnt.WCHAR)* getName()

	do
	{
		return &("BetterC test1\0"w[0]);
	}

pragma(mangle, "getFuncsArray")
extern (C)
nothrow @nogc
export const (npp_api.powereditor.misc.pluginsmanager.plugininterface.FuncItem)* getFuncsArray(int* nbF)

	do
	{
		if (nbF == null) {
			return null;
		}

		*nbF = 1;

		return &.main_menu;
	}

pragma(mangle, "isUnicode")
extern (C)
pure nothrow @safe @nogc
export core.sys.windows.windef.BOOL isUnicode()

	do
	{
		static import core.sys.windows.windef;

		return core.sys.windows.windef.TRUE;
	}

pragma(mangle, "setInfo")
extern (C)
nothrow @nogc
export void setInfo(npp_api.powereditor.misc.pluginsmanager.plugininterface.NppData notpadPlusData)

	do
	{
		.nppData = notpadPlusData;
		.main_menu._itemName = "dummy menu\0"w;
		.main_menu._pFunc = &dummy_func;
		.main_menu._cmdID = 0;
		.main_menu._init2Check = false;
		.main_menu._pShKey = null;
	}

pragma(mangle, "beNotified")
extern (C)
pure nothrow @safe @nogc
export void beNotified(npp_api.scintilla.scintilla.SCNotification* notifyCode)

	do
	{
	}

pragma(mangle, "messageProc")
extern (C)
pure nothrow @safe @nogc
export core.sys.windows.windef.LRESULT messageProc(core.sys.windows.windef.UINT Message, core.sys.windows.windef.WPARAM wParam, core.sys.windows.windef.LPARAM lParam)

	do
	{
		static import core.sys.windows.windef;

		return core.sys.windows.windef.TRUE;
	}
