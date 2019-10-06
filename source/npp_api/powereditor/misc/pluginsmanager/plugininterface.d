// This file is part of Notepad++ project
// Copyright (C)2003 Don HO <don.h@free.fr>
//
// This program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public License
// as published by the Free Software Foundation; either
// version 2 of the License, or (at your option) any later version.
//
// Note that the GPL places important restrictions on "derived works", yet
// it does not provide a detailed definition of that term.  To avoid
// misunderstandings, we consider an application to constitute a
// "derivative work" for the purpose of this license if it does any of the
// following:
// 1. Integrates source code from Notepad++.
// 2. Integrates/includes/aggregates Notepad++ into a proprietary executable
//    installer, such as those produced by InstallShield.
// 3. Links to a library or executes a program that does any of the above.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program; if not, write to the Free Software
// Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
/**
 *
 *
 * License: GPL-2.0 or later
 */
module npp_api.powereditor.misc.pluginsmanager.plugininterface;


version (Windows):

private static import core.sys.windows.windef;
private static import core.sys.windows.winnt;
private static import npp_api.scintilla.scintilla;

extern (C):

enum size_t nbChar = 64;

alias PFUNCGETNAME = extern (C) nothrow const (core.sys.windows.winnt.WCHAR)* function();

struct NppData
{
	static import core.sys.windows.windef;

	core.sys.windows.windef.HWND _nppHandle;
	core.sys.windows.windef.HWND _scintillaMainHandle;
	core.sys.windows.windef.HWND _scintillaSecondHandle;
}

alias PFUNCSETINFO = extern (C) nothrow void function(.NppData);
alias PFUNCPLUGINCMD = extern (C) nothrow void function();
alias PBENOTIFIED = extern (C) nothrow void function(npp_api.scintilla.scintilla.SCNotification*);

extern (C)
nothrow
/* __gshared */ core.sys.windows.windef.LRESULT function(core.sys.windows.windef.UINT Message, core.sys.windows.windef.WPARAM wParam, core.sys.windows.windef.LPARAM lParam) PMESSAGEPROC;

struct ShortcutKey
{
	static import core.sys.windows.winnt;

	bool _isCtrl = false;
	bool _isAlt = false;
	bool _isShift = false;
	core.sys.windows.winnt.UCHAR _key = 0;
}

struct FuncItem
{
	static import core.sys.windows.winnt;

	/**
	 *
	 */
	core.sys.windows.winnt.WCHAR[.nbChar] _itemName = 0;

	/**
	 *
	 */
	.PFUNCPLUGINCMD _pFunc = null;

	/**
	 * Notepad++ allocate this
	 */
	int _cmdID = 0;

	/**
	 *
	 */
	bool _init2Check = false;

	/**
	 *
	 */
	.ShortcutKey* _pShKey = null;
}

alias PFUNCGETFUNCSARRAY = extern (C) nothrow .FuncItem* function(int*);
