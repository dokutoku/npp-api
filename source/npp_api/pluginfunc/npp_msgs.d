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
 * notepad_plus_msgs wrapper
 *
 * See_Also:
 *      https://npp-user-manual.org/docs/plugin-communication/
 *
 * ToDo: recheck
 * Author: dokutoku, https://twitter.com/dokutoku3
 * License: GPL-2.0 or later
 */
module npp_api.pluginfunc.npp_msgs;


version (Windows):

pragma(lib, "user32.lib");

private static import core.stdc.config;
private static import core.sys.windows.windef;
private static import core.sys.windows.winuser;
private static import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;
private static import npp_api.powereditor.misc.pluginsmanager.plugininterface;

pragma(inline, true):
nothrow @nogc:

/**
 * NPPM_GETCURRENTSCINTILLA
 */
void send_NPPM_GETCURRENTSCINTILLA(core.sys.windows.windef.HWND _nppHandle, ref int currentEdit)

	in
	{
		static import core.sys.windows.windef;

		assert(_nppHandle != core.sys.windows.windef.NULL);
	}

	do
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;

		core.sys.windows.winuser.SendMessageW(_nppHandle, npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPM_GETCURRENTSCINTILLA, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(&currentEdit));
	}

/**
 * NPPM_GETCURRENTLANGTYPE
 */
void send_NPPM_GETCURRENTLANGTYPE(core.sys.windows.windef.HWND _nppHandle, ref npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType langType)

	in
	{
		static import core.sys.windows.windef;

		assert(_nppHandle != core.sys.windows.windef.NULL);
	}

	do
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;

		int output_langType;

		core.sys.windows.winuser.SendMessageW(_nppHandle, npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPM_GETCURRENTLANGTYPE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(&output_langType));

		langType = ((output_langType >= 0) && (cast(int)(npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_EXTERNAL) > output_langType)) ? (cast(npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType)(output_langType)) : (npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_EXTERNAL);
	}

/**
 * NPPM_SETCURRENTLANGTYPE
 */
bool send_NPPM_SETCURRENTLANGTYPE(core.sys.windows.windef.HWND _nppHandle, npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType langTypeToSet)

	in
	{
		static import core.sys.windows.windef;

		assert(_nppHandle != core.sys.windows.windef.NULL);
	}

	do
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;

		return cast(bool)(core.sys.windows.winuser.SendMessageW(_nppHandle, npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPM_SETCURRENTLANGTYPE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(cast(int)(langTypeToSet))));
	}

/**
 * NPPM_GETNBOPENFILES
 */
size_t send_NPPM_GETNBOPENFILES(core.sys.windows.windef.HWND _nppHandle, int nbType)

	in
	{
		static import core.sys.windows.windef;

		assert(_nppHandle != core.sys.windows.windef.NULL);
	}

	do
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;

		return cast(size_t)(core.sys.windows.winuser.SendMessageW(_nppHandle, npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPM_GETNBOPENFILES, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(nbType)));
	}

/**
 * NPPM_GETOPENFILENAMES
 */
size_t send_NPPM_GETOPENFILENAMES(core.sys.windows.windef.HWND _nppHandle, core.sys.windows.winnt.WCHAR** fileNames, int nbFile)

	in
	{
		static import core.sys.windows.windef;

		assert(_nppHandle != core.sys.windows.windef.NULL);
		assert(fileNames != null);
	}

	do
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;

		return cast(size_t)(core.sys.windows.winuser.SendMessageW(_nppHandle, npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPM_GETOPENFILENAMES, cast(core.sys.windows.windef.WPARAM)(fileNames), cast(core.sys.windows.windef.LPARAM)(nbFile)));
	}

/**
 * NPPM_MODELESSDIALOG
 */
core.sys.windows.windef.HWND send_NPPM_MODELESSDIALOG(core.sys.windows.windef.HWND _nppHandle, int op, core.sys.windows.windef.HWND hDlg)

	in
	{
		static import core.sys.windows.windef;

		assert(_nppHandle != core.sys.windows.windef.NULL);
	}

	do
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;

		return cast(core.sys.windows.windef.HWND)(core.sys.windows.winuser.SendMessageW(_nppHandle, npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPM_MODELESSDIALOG, cast(core.sys.windows.windef.WPARAM)(op), cast(core.sys.windows.windef.LPARAM)(hDlg)));
	}

/**
 * NPPM_GETNBSESSIONFILES
 */
size_t send_NPPM_GETNBSESSIONFILES(core.sys.windows.windef.HWND _nppHandle, scope const core.sys.windows.winnt.WCHAR* sessionFileName)

	in
	{
		static import core.sys.windows.windef;

		assert(_nppHandle != core.sys.windows.windef.NULL);
		assert(sessionFileName != null);
	}

	do
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;

		return cast(size_t)(core.sys.windows.winuser.SendMessageW(_nppHandle, npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPM_GETNBSESSIONFILES, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(sessionFileName)));
	}

/**
 * NPPM_GETSESSIONFILES
 */
bool send_NPPM_GETSESSIONFILES(core.sys.windows.windef.HWND _nppHandle, core.sys.windows.winnt.WCHAR** sessionFileArray, scope const core.sys.windows.winnt.WCHAR* sessionFileName)

	in
	{
		static import core.sys.windows.windef;

		assert(_nppHandle != core.sys.windows.windef.NULL);
		assert(sessionFileArray != null);
		assert(sessionFileName != null);
	}

	do
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;

		return cast(bool)(core.sys.windows.winuser.SendMessageW(_nppHandle, npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPM_GETSESSIONFILES, cast(core.sys.windows.windef.WPARAM)(sessionFileArray), cast(core.sys.windows.windef.LPARAM)(sessionFileName)));
	}

/**
 * NPPM_SAVESESSION
 * ToDo: pointer? sessionInfomation
 */
const (core.sys.windows.winnt.WCHAR)* send_NPPM_SAVESESSION(core.sys.windows.windef.HWND _nppHandle, npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.sessionInfo* sessionInfomation)

	in
	{
		static import core.sys.windows.windef;

		assert(_nppHandle != core.sys.windows.windef.NULL);
		assert(sessionInfomation != null);
	}

	do
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;

		return cast(const (core.sys.windows.winnt.WCHAR)*)(core.sys.windows.winuser.SendMessageW(_nppHandle, npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPM_SAVESESSION, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(sessionInfomation)));
	}

/**
 * NPPM_SAVECURRENTSESSION
 */
const (core.sys.windows.winnt.WCHAR)* send_NPPM_SAVECURRENTSESSION(core.sys.windows.windef.HWND _nppHandle, scope const core.sys.windows.winnt.WCHAR* sessionFileName)

	in
	{
		static import core.sys.windows.windef;

		assert(_nppHandle != core.sys.windows.windef.NULL);
		//assert(sessionFileName != null);
	}

	do
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;

		return cast(const (core.sys.windows.winnt.WCHAR)*)(core.sys.windows.winuser.SendMessageW(_nppHandle, npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPM_SAVECURRENTSESSION, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(sessionFileName)));
	}

/**
 * NPPM_GETOPENFILENAMESPRIMARY
 */
size_t send_NPPM_GETOPENFILENAMESPRIMARY(core.sys.windows.windef.HWND _nppHandle, core.sys.windows.winnt.WCHAR** fileNames, int nbFile)

	in
	{
		static import core.sys.windows.windef;

		assert(_nppHandle != core.sys.windows.windef.NULL);
		assert(fileNames != null);
	}

	do
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;

		return cast(size_t)(core.sys.windows.winuser.SendMessageW(_nppHandle, npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPM_GETOPENFILENAMESPRIMARY, cast(core.sys.windows.windef.WPARAM)(fileNames), cast(core.sys.windows.windef.LPARAM)(nbFile)));
	}

/**
 * NPPM_GETOPENFILENAMESSECOND
 */
size_t send_NPPM_GETOPENFILENAMESSECOND(core.sys.windows.windef.HWND _nppHandle, core.sys.windows.winnt.WCHAR** fileNames, int nbFile)

	in
	{
		static import core.sys.windows.windef;

		assert(_nppHandle != core.sys.windows.windef.NULL);
		assert(fileNames != null);
	}

	do
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;

		return cast(size_t)(core.sys.windows.winuser.SendMessageW(_nppHandle, npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPM_GETOPENFILENAMESSECOND, cast(core.sys.windows.windef.WPARAM)(fileNames), cast(core.sys.windows.windef.LPARAM)(nbFile)));
	}

/**
 * NPPM_CREATESCINTILLAHANDLE
 */
core.sys.windows.windef.HWND send_NPPM_CREATESCINTILLAHANDLE(core.sys.windows.windef.HWND _nppHandle, core.sys.windows.windef.HWND pluginWindowHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_nppHandle != core.sys.windows.windef.NULL);
	}

	do
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;

		return cast(core.sys.windows.windef.HWND)(core.sys.windows.winuser.SendMessageW(_nppHandle, npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPM_CREATESCINTILLAHANDLE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(pluginWindowHandle)));
	}

/**
 * NPPM_DESTROYSCINTILLAHANDLE
 */
bool send_NPPM_DESTROYSCINTILLAHANDLE(core.sys.windows.windef.HWND _nppHandle, core.sys.windows.windef.HWND scintillaHandle2Destroy)

	in
	{
		static import core.sys.windows.windef;

		assert(_nppHandle != core.sys.windows.windef.NULL);
	}

	do
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;

		return cast(bool)(core.sys.windows.winuser.SendMessageW(_nppHandle, npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPM_DESTROYSCINTILLAHANDLE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(scintillaHandle2Destroy)));
	}

/**
 * NPPM_GETNBUSERLANG
 */
int send_NPPM_GETNBUSERLANG(core.sys.windows.windef.HWND _nppHandle, int* lParam)

	in
	{
		static import core.sys.windows.windef;

		assert(_nppHandle != core.sys.windows.windef.NULL);
		assert(lParam != null);
	}

	do
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;

		return cast(int)(core.sys.windows.winuser.SendMessageW(_nppHandle, npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPM_GETNBUSERLANG, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(lParam)));
	}

/**
 * NPPM_GETCURRENTDOCINDEX
 */
int send_NPPM_GETCURRENTDOCINDEX(core.sys.windows.windef.HWND _nppHandle, int iView)

	in
	{
		static import core.sys.windows.windef;

		assert(_nppHandle != core.sys.windows.windef.NULL);
	}

	do
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;

		return cast(int)(core.sys.windows.winuser.SendMessageW(_nppHandle, npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPM_GETCURRENTDOCINDEX, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(iView)));
	}

/**
 * NPPM_SETSTATUSBAR
 */
bool send_NPPM_SETSTATUSBAR(core.sys.windows.windef.HWND _nppHandle, core.sys.windows.winnt.WCHAR* wParam, int lParam)

	in
	{
		static import core.sys.windows.windef;

		assert(_nppHandle != core.sys.windows.windef.NULL);
		assert(wParam != null);
	}

	do
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;

		return cast(bool)(core.sys.windows.winuser.SendMessageW(_nppHandle, npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPM_SETSTATUSBAR, cast(core.sys.windows.windef.WPARAM)(wParam), cast(core.sys.windows.windef.LPARAM)(lParam)));
	}

/**
 * NPPM_GETMENUHANDLE
 */
core.sys.windows.windef.HMENU send_NPPM_GETMENUHANDLE(core.sys.windows.windef.HWND _nppHandle, core.sys.windows.windef.INT menuChoice)

	in
	{
		static import core.sys.windows.windef;

		assert(_nppHandle != core.sys.windows.windef.NULL);
		static import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;

		assert((menuChoice == npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPPLUGINMENU) || (menuChoice == npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPMAINMENU));
	}

	do
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;

		return cast(core.sys.windows.windef.HMENU)(core.sys.windows.winuser.SendMessageW(_nppHandle, npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPM_GETMENUHANDLE, cast(core.sys.windows.windef.WPARAM)(menuChoice), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/**
 * NPPM_ENCODESCI
 */
int send_NPPM_ENCODESCI(core.sys.windows.windef.HWND _nppHandle, int wParam)

	in
	{
		static import core.sys.windows.windef;

		assert(_nppHandle != core.sys.windows.windef.NULL);
		assert((wParam == npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.MAIN_VIEW) || (wParam == npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.SUB_VIEW));
	}

	do
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;

		return cast(int)(core.sys.windows.winuser.SendMessageW(_nppHandle, npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPM_ENCODESCI, cast(core.sys.windows.windef.WPARAM)(wParam), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/**
 * NPPM_DECODESCI
 */
int send_NPPM_DECODESCI(core.sys.windows.windef.HWND _nppHandle, int wParam)

	in
	{
		static import core.sys.windows.windef;

		assert(_nppHandle != core.sys.windows.windef.NULL);
		assert((wParam == npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.MAIN_VIEW) || (wParam == npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.SUB_VIEW));
	}

	do
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;

		return cast(int)(core.sys.windows.winuser.SendMessageW(_nppHandle, npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPM_DECODESCI, cast(core.sys.windows.windef.WPARAM)(wParam), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/**
 * NPPM_ACTIVATEDOC
 */
void send_NPPM_ACTIVATEDOC(core.sys.windows.windef.HWND _nppHandle, int view, int index2Activate)

	in
	{
		static import core.sys.windows.windef;

		assert(_nppHandle != core.sys.windows.windef.NULL);
	}

	do
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;

		core.sys.windows.winuser.SendMessageW(_nppHandle, npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPM_ACTIVATEDOC, cast(core.sys.windows.windef.WPARAM)(view), cast(core.sys.windows.windef.LPARAM)(index2Activate));
	}

/**
 * NPPM_LAUNCHFINDINFILESDLG
 */
void send_NPPM_LAUNCHFINDINFILESDLG(core.sys.windows.windef.HWND _nppHandle, core.sys.windows.winnt.WCHAR* dir2Search, core.sys.windows.winnt.WCHAR* filtre)

	in
	{
		static import core.sys.windows.windef;

		assert(_nppHandle != core.sys.windows.windef.NULL);
		assert(dir2Search != null);
		assert(filtre != null);
	}

	do
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;

		core.sys.windows.winuser.SendMessageW(_nppHandle, npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPM_LAUNCHFINDINFILESDLG, cast(core.sys.windows.windef.WPARAM)(dir2Search), cast(core.sys.windows.windef.LPARAM)(filtre));
	}

/**
 * NPPM_DMMSHOW
 */
void send_NPPM_DMMSHOW(core.sys.windows.windef.HWND _nppHandle, core.sys.windows.windef.HWND lParam)

	in
	{
		static import core.sys.windows.windef;

		assert(_nppHandle != core.sys.windows.windef.NULL);
	}

	do
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;

		core.sys.windows.winuser.SendMessageW(_nppHandle, npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPM_DMMSHOW, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(lParam));
	}

/**
 * NPPM_DMMHIDE
 */
void send_NPPM_DMMHIDE(core.sys.windows.windef.HWND _nppHandle, core.sys.windows.windef.HWND lParam)

	in
	{
		static import core.sys.windows.windef;

		assert(_nppHandle != core.sys.windows.windef.NULL);
	}

	do
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;

		core.sys.windows.winuser.SendMessageW(_nppHandle, npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPM_DMMHIDE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(lParam));
	}

/**
 * NPPM_DMMUPDATEDISPINFO
 */
void send_NPPM_DMMUPDATEDISPINFO(core.sys.windows.windef.HWND _nppHandle, core.sys.windows.windef.HWND lParam)

	in
	{
		static import core.sys.windows.windef;

		assert(_nppHandle != core.sys.windows.windef.NULL);
	}

	do
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;

		core.sys.windows.winuser.SendMessageW(_nppHandle, npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPM_DMMUPDATEDISPINFO, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(lParam));
	}

/**
 * NPPM_DMMREGASDCKDLG
 */
void send_NPPM_DMMREGASDCKDLG(core.sys.windows.windef.HWND _nppHandle, npp_api.powereditor.wincontrols.dockingwnd.docking.tTbData* lParam)

	in
	{
		static import core.sys.windows.windef;

		assert(_nppHandle != core.sys.windows.windef.NULL);
	}

	do
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;

		core.sys.windows.winuser.SendMessageW(_nppHandle, npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPM_DMMREGASDCKDLG, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(lParam));
	}

/**
 * NPPM_LOADSESSION
 */
void send_NPPM_LOADSESSION(core.sys.windows.windef.HWND _nppHandle, scope const core.sys.windows.winnt.WCHAR* file_name)

	in
	{
		static import core.sys.windows.windef;

		assert(_nppHandle != core.sys.windows.windef.NULL);
		assert(file_name != null);
	}

	do
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;

		core.sys.windows.winuser.SendMessageW(_nppHandle, npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPM_LOADSESSION, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(file_name));
	}

/**
 * NPPM_DMMVIEWOTHERTAB
 */
void send_NPPM_DMMVIEWOTHERTAB(core.sys.windows.windef.HWND _nppHandle, core.sys.windows.winnt.WCHAR* lParam)

	in
	{
		static import core.sys.windows.windef;

		assert(_nppHandle != core.sys.windows.windef.NULL);
		assert(lParam != null);
	}

	do
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;

		core.sys.windows.winuser.SendMessageW(_nppHandle, npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPM_DMMVIEWOTHERTAB, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(lParam));
	}

/**
 * NPPM_RELOADFILE
 */
bool send_NPPM_RELOADFILE(core.sys.windows.windef.HWND _nppHandle, core.sys.windows.windef.BOOL withAlert, core.sys.windows.winnt.WCHAR* filePathName2Reload)

	in
	{
		static import core.sys.windows.windef;

		assert(_nppHandle != core.sys.windows.windef.NULL);
		assert(filePathName2Reload != null);
	}

	do
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;

		return cast(bool)(core.sys.windows.winuser.SendMessageW(_nppHandle, npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPM_RELOADFILE, cast(core.sys.windows.windef.WPARAM)(withAlert), cast(core.sys.windows.windef.LPARAM)(filePathName2Reload)));
	}

/**
 * NPPM_SWITCHTOFILE
 */
bool send_NPPM_SWITCHTOFILE(core.sys.windows.windef.HWND _nppHandle, core.sys.windows.winnt.WCHAR* filePathName2switch)

	in
	{
		static import core.sys.windows.windef;

		assert(_nppHandle != core.sys.windows.windef.NULL);
		assert(filePathName2switch != null);
	}

	do
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;

		return cast(bool)(core.sys.windows.winuser.SendMessageW(_nppHandle, npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPM_SWITCHTOFILE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(filePathName2switch)));
	}

/**
 * NPPM_SAVECURRENTFILE
 */
bool send_NPPM_SAVECURRENTFILE(core.sys.windows.windef.HWND _nppHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_nppHandle != core.sys.windows.windef.NULL);
	}

	do
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;

		return cast(bool)(core.sys.windows.winuser.SendMessageW(_nppHandle, npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPM_SAVECURRENTFILE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/**
 * NPPM_SAVEALLFILES
 */
bool send_NPPM_SAVEALLFILES(core.sys.windows.windef.HWND _nppHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_nppHandle != core.sys.windows.windef.NULL);
	}

	do
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;

		return cast(bool)(core.sys.windows.winuser.SendMessageW(_nppHandle, npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPM_SAVEALLFILES, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/**
 * NPPM_SETMENUITEMCHECK
 */
void send_NPPM_SETMENUITEMCHECK(core.sys.windows.windef.HWND _nppHandle, core.sys.windows.windef.UINT _cmdID, core.sys.windows.windef.BOOL check)

	in
	{
		static import core.sys.windows.windef;

		assert(_nppHandle != core.sys.windows.windef.NULL);
	}

	do
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;

		core.sys.windows.winuser.SendMessageW(_nppHandle, npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPM_SETMENUITEMCHECK, cast(core.sys.windows.windef.WPARAM)(_cmdID), cast(core.sys.windows.windef.LPARAM)(check));
	}

/**
 * NPPM_ADDTOOLBARICON
 */
bool send_NPPM_ADDTOOLBARICON(core.sys.windows.windef.HWND _nppHandle, core.sys.windows.windef.UINT _cmdID, npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.toolbarIcons* icon)

	in
	{
		static import core.sys.windows.windef;

		assert(_nppHandle != core.sys.windows.windef.NULL);
		assert(icon != null);
	}

	do
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;

		return cast(bool)(core.sys.windows.winuser.SendMessageW(_nppHandle, npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPM_ADDTOOLBARICON, cast(core.sys.windows.windef.WPARAM)(_cmdID), cast(core.sys.windows.windef.LPARAM)(icon)));
	}

/**
 * NPPM_GETWINDOWSVERSION
 */
npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.winVer send_NPPM_GETWINDOWSVERSION(core.sys.windows.windef.HWND _nppHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_nppHandle != core.sys.windows.windef.NULL);
	}

	do
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;

		return cast(npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.winVer)(core.sys.windows.winuser.SendMessageW(_nppHandle, npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPM_GETWINDOWSVERSION, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/**
 * NPPM_DMMGETPLUGINHWNDBYNAME
 */
core.sys.windows.windef.HWND send_NPPM_DMMGETPLUGINHWNDBYNAME(core.sys.windows.windef.HWND _nppHandle, scope const core.sys.windows.winnt.WCHAR* windowName, scope const core.sys.windows.winnt.WCHAR* moduleName)

	in
	{
		static import core.sys.windows.windef;

		assert(_nppHandle != core.sys.windows.windef.NULL);
		assert(windowName != null);
		assert(moduleName != null);
	}

	do
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;

		return cast(core.sys.windows.windef.HWND)(core.sys.windows.winuser.SendMessageW(_nppHandle, npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPM_DMMGETPLUGINHWNDBYNAME, cast(core.sys.windows.windef.WPARAM)(windowName), cast(core.sys.windows.windef.LPARAM)(moduleName)));
	}

/**
 * NPPM_MAKECURRENTBUFFERDIRTY
 */
bool send_NPPM_MAKECURRENTBUFFERDIRTY(core.sys.windows.windef.HWND _nppHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_nppHandle != core.sys.windows.windef.NULL);
	}

	do
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;

		return cast(bool)(core.sys.windows.winuser.SendMessageW(_nppHandle, npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPM_MAKECURRENTBUFFERDIRTY, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/**
 * NPPM_GETENABLETHEMETEXTUREFUNC
 */
bool send_NPPM_GETENABLETHEMETEXTUREFUNC(core.sys.windows.windef.HWND _nppHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_nppHandle != core.sys.windows.windef.NULL);
	}

	do
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;

		return cast(bool)(core.sys.windows.winuser.SendMessageW(_nppHandle, npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPM_GETENABLETHEMETEXTUREFUNC, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/**
 * NPPM_GETPLUGINSCONFIGDIR
 */
bool send_NPPM_GETPLUGINSCONFIGDIR(core.sys.windows.windef.HWND _nppHandle, size_t strLen, core.sys.windows.winnt.WCHAR* str)

	in
	{
		static import core.sys.windows.windef;

		assert(_nppHandle != core.sys.windows.windef.NULL);
		assert(str != null);
	}

	do
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;

		return cast(bool)(core.sys.windows.winuser.SendMessageW(_nppHandle, npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPM_GETPLUGINSCONFIGDIR, cast(core.sys.windows.windef.WPARAM)(strLen), cast(core.sys.windows.windef.LPARAM)(str)));
	}

/**
 * NPPM_MSGTOPLUGIN
 */
bool send_NPPM_MSGTOPLUGIN(core.sys.windows.windef.HWND _nppHandle, core.sys.windows.winnt.WCHAR* destModuleName, ref npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.CommunicationInfo info)

	in
	{
		static import core.sys.windows.windef;

		assert(_nppHandle != core.sys.windows.windef.NULL);
		assert(destModuleName != null);
	}

	do
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;

		return cast(bool)(core.sys.windows.winuser.SendMessageW(_nppHandle, npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPM_MSGTOPLUGIN, cast(core.sys.windows.windef.WPARAM)(destModuleName), cast(core.sys.windows.windef.LPARAM)(&info)));
	}

/**
 * NPPM_MENUCOMMAND
 */
void send_NPPM_MENUCOMMAND(core.sys.windows.windef.HWND _nppHandle, int cmdID)

	in
	{
		static import core.sys.windows.windef;

		assert(_nppHandle != core.sys.windows.windef.NULL);
	}

	do
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;

		core.sys.windows.winuser.SendMessageW(_nppHandle, npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPM_MENUCOMMAND, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(cmdID));
	}

/**
 * NPPM_TRIGGERTABBARCONTEXTMENU
 */
void send_NPPM_TRIGGERTABBARCONTEXTMENU(core.sys.windows.windef.HWND _nppHandle, int view, int index2Activate)

	in
	{
		static import core.sys.windows.windef;

		assert(_nppHandle != core.sys.windows.windef.NULL);
	}

	do
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;

		core.sys.windows.winuser.SendMessageW(_nppHandle, npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPM_TRIGGERTABBARCONTEXTMENU, cast(core.sys.windows.windef.WPARAM)(view), cast(core.sys.windows.windef.LPARAM)(index2Activate));
	}

/**
 * NPPM_GETNPPVERSION
 */
int send_NPPM_GETNPPVERSION(core.sys.windows.windef.HWND _nppHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_nppHandle != core.sys.windows.windef.NULL);
	}

	do
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;

		return cast(int)(core.sys.windows.winuser.SendMessageW(_nppHandle, npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPM_GETNPPVERSION, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/**
 * NPPM_HIDETABBAR
 */
bool send_NPPM_HIDETABBAR(core.sys.windows.windef.HWND _nppHandle, core.sys.windows.windef.BOOL hideOrNot)

	in
	{
		static import core.sys.windows.windef;

		assert(_nppHandle != core.sys.windows.windef.NULL);
	}

	do
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;

		return cast(bool)(core.sys.windows.winuser.SendMessageW(_nppHandle, npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPM_HIDETABBAR, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(hideOrNot)));
	}

/**
 * NPPM_ISTABBARHIDDEN
 */
bool send_NPPM_ISTABBARHIDDEN(core.sys.windows.windef.HWND _nppHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_nppHandle != core.sys.windows.windef.NULL);
	}

	do
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;

		return cast(bool)(core.sys.windows.winuser.SendMessageW(_nppHandle, npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPM_ISTABBARHIDDEN, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/**
 * NPPM_GETPOSFROMBUFFERID
 */
int send_NPPM_GETPOSFROMBUFFERID(core.sys.windows.windef.HWND _nppHandle, core.sys.windows.basetsd.UINT_PTR bufferID, core.sys.windows.windef.INT priorityView)

	in
	{
		static import core.sys.windows.windef;

		assert(_nppHandle != core.sys.windows.windef.NULL);
	}

	do
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;

		return cast(int)(core.sys.windows.winuser.SendMessageW(_nppHandle, npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPM_GETPOSFROMBUFFERID, cast(core.sys.windows.windef.WPARAM)(bufferID), cast(core.sys.windows.windef.LPARAM)(priorityView)));
	}

/**
 * NPPM_GETFULLPATHFROMBUFFERID
 */
int send_NPPM_GETFULLPATHFROMBUFFERID(core.sys.windows.windef.HWND _nppHandle, core.sys.windows.basetsd.UINT_PTR bufferID, core.sys.windows.winnt.WCHAR* fullFilePath)

	in
	{
		static import core.sys.windows.windef;

		assert(_nppHandle != core.sys.windows.windef.NULL);
		assert(fullFilePath != null);
	}

	do
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;

		return cast(int)(core.sys.windows.winuser.SendMessageW(_nppHandle, npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPM_GETFULLPATHFROMBUFFERID, cast(core.sys.windows.windef.WPARAM)(bufferID), cast(core.sys.windows.windef.LPARAM)(fullFilePath)));
	}

/**
 * NPPM_GETBUFFERIDFROMPOS
 */
core.sys.windows.windef.LRESULT send_NPPM_GETBUFFERIDFROMPOS(core.sys.windows.windef.HWND _nppHandle, core.sys.windows.windef.INT index, core.sys.windows.windef.INT iView)

	in
	{
		static import core.sys.windows.windef;

		assert(_nppHandle != core.sys.windows.windef.NULL);
	}

	do
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;

		return cast(core.sys.windows.windef.LRESULT)(core.sys.windows.winuser.SendMessageW(_nppHandle, npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPM_GETBUFFERIDFROMPOS, cast(core.sys.windows.windef.WPARAM)(index), cast(core.sys.windows.windef.LPARAM)(iView)));
	}

/**
 * NPPM_GETCURRENTBUFFERID
 */
core.sys.windows.windef.LRESULT send_NPPM_GETCURRENTBUFFERID(core.sys.windows.windef.HWND _nppHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_nppHandle != core.sys.windows.windef.NULL);
	}

	do
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;

		return cast(core.sys.windows.windef.LRESULT)(core.sys.windows.winuser.SendMessageW(_nppHandle, npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPM_GETCURRENTBUFFERID, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/**
 * NPPM_RELOADBUFFERID
 */
void send_NPPM_RELOADBUFFERID(core.sys.windows.windef.HWND _nppHandle, core.sys.windows.basetsd.UINT_PTR bufferID, core.sys.windows.windef.BOOL alert)

	in
	{
		static import core.sys.windows.windef;

		assert(_nppHandle != core.sys.windows.windef.NULL);
	}

	do
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;

		core.sys.windows.winuser.SendMessageW(_nppHandle, npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPM_RELOADBUFFERID, cast(core.sys.windows.windef.WPARAM)(bufferID), cast(core.sys.windows.windef.LPARAM)(alert));
	}

/**
 * NPPM_GETBUFFERLANGTYPE
 */
npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType send_NPPM_GETBUFFERLANGTYPE(core.sys.windows.windef.HWND _nppHandle, core.sys.windows.basetsd.UINT_PTR bufferID)

	in
	{
		static import core.sys.windows.windef;

		assert(_nppHandle != core.sys.windows.windef.NULL);
	}

	do
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;

		int output_langType;

		output_langType = cast(int)(core.sys.windows.winuser.SendMessageW(_nppHandle, npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPM_GETBUFFERLANGTYPE, cast(core.sys.windows.windef.WPARAM)(bufferID), cast(core.sys.windows.windef.LPARAM)(0)));

		return ((output_langType >= 0) && (cast(int)(npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_EXTERNAL) > output_langType)) ? (cast(npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType)(output_langType)) : (npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_EXTERNAL);
	}

/**
 * NPPM_SETBUFFERLANGTYPE
 */
bool send_NPPM_SETBUFFERLANGTYPE(core.sys.windows.windef.HWND _nppHandle, core.sys.windows.basetsd.UINT_PTR bufferID, npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType langType)

	in
	{
		static import core.sys.windows.windef;

		assert(_nppHandle != core.sys.windows.windef.NULL);
	}

	do
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;

		return cast(bool)(core.sys.windows.winuser.SendMessageW(_nppHandle, npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPM_SETBUFFERLANGTYPE, cast(core.sys.windows.windef.WPARAM)(bufferID), cast(core.sys.windows.windef.LPARAM)(cast(int)(langType))));
	}

/**
 * NPPM_GETBUFFERENCODING
 */
int send_NPPM_GETBUFFERENCODING(core.sys.windows.windef.HWND _nppHandle, core.sys.windows.basetsd.UINT_PTR bufferID)

	in
	{
		static import core.sys.windows.windef;

		assert(_nppHandle != core.sys.windows.windef.NULL);
	}

	do
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;

		return cast(int)(core.sys.windows.winuser.SendMessageW(_nppHandle, npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPM_GETBUFFERENCODING, cast(core.sys.windows.windef.WPARAM)(bufferID), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/**
 * NPPM_SETBUFFERENCODING
 */
bool send_NPPM_SETBUFFERENCODING(core.sys.windows.windef.HWND _nppHandle, core.sys.windows.basetsd.UINT_PTR bufferID, core.sys.windows.windef.INT encoding)

	in
	{
		static import core.sys.windows.windef;

		assert(_nppHandle != core.sys.windows.windef.NULL);
	}

	do
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;

		return cast(bool)(core.sys.windows.winuser.SendMessageW(_nppHandle, npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPM_SETBUFFERENCODING, cast(core.sys.windows.windef.WPARAM)(bufferID), cast(core.sys.windows.windef.LPARAM)(encoding)));
	}

/**
 * NPPM_GETBUFFERFORMAT
 */
int send_NPPM_GETBUFFERFORMAT(core.sys.windows.windef.HWND _nppHandle, core.sys.windows.basetsd.UINT_PTR bufferID)

	in
	{
		static import core.sys.windows.windef;

		assert(_nppHandle != core.sys.windows.windef.NULL);
	}

	do
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;

		return cast(int)(core.sys.windows.winuser.SendMessageW(_nppHandle, npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPM_GETBUFFERFORMAT, cast(core.sys.windows.windef.WPARAM)(bufferID), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/**
 * NPPM_SETBUFFERFORMAT
 */
bool send_NPPM_SETBUFFERFORMAT(core.sys.windows.windef.HWND _nppHandle, core.sys.windows.basetsd.UINT_PTR bufferID, core.sys.windows.windef.INT format)

	in
	{
		static import core.sys.windows.windef;

		assert(_nppHandle != core.sys.windows.windef.NULL);
	}

	do
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;

		return cast(bool)(core.sys.windows.winuser.SendMessageW(_nppHandle, npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPM_SETBUFFERFORMAT, cast(core.sys.windows.windef.WPARAM)(bufferID), cast(core.sys.windows.windef.LPARAM)(format)));
	}

/**
 * NPPM_HIDETOOLBAR
 */
bool send_NPPM_HIDETOOLBAR(core.sys.windows.windef.HWND _nppHandle, core.sys.windows.windef.BOOL hideOrNot)

	in
	{
		static import core.sys.windows.windef;

		assert(_nppHandle != core.sys.windows.windef.NULL);
	}

	do
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;

		return cast(bool)(core.sys.windows.winuser.SendMessageW(_nppHandle, npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPM_HIDETOOLBAR, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(hideOrNot)));
	}

/**
 * NPPM_ISTOOLBARHIDDEN
 */
bool send_NPPM_ISTOOLBARHIDDEN(core.sys.windows.windef.HWND _nppHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_nppHandle != core.sys.windows.windef.NULL);
	}

	do
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;

		return cast(bool)(core.sys.windows.winuser.SendMessageW(_nppHandle, npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPM_ISTOOLBARHIDDEN, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/**
 * NPPM_HIDEMENU
 */
bool send_NPPM_HIDEMENU(core.sys.windows.windef.HWND _nppHandle, core.sys.windows.windef.BOOL hideOrNot)

	in
	{
		static import core.sys.windows.windef;

		assert(_nppHandle != core.sys.windows.windef.NULL);
	}

	do
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;

		return cast(bool)(core.sys.windows.winuser.SendMessageW(_nppHandle, npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPM_HIDEMENU, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(hideOrNot)));
	}

/**
 * NPPM_ISMENUHIDDEN
 */
bool send_NPPM_ISMENUHIDDEN(core.sys.windows.windef.HWND _nppHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_nppHandle != core.sys.windows.windef.NULL);
	}

	do
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;

		return cast(bool)(core.sys.windows.winuser.SendMessageW(_nppHandle, npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPM_ISMENUHIDDEN, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/**
 * NPPM_HIDESTATUSBAR
 */
bool send_NPPM_HIDESTATUSBAR(core.sys.windows.windef.HWND _nppHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_nppHandle != core.sys.windows.windef.NULL);
	}

	do
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;

		return cast(bool)(core.sys.windows.winuser.SendMessageW(_nppHandle, npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPM_HIDESTATUSBAR, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/**
 * NPPM_ISSTATUSBARHIDDEN
 */
bool send_NPPM_ISSTATUSBARHIDDEN(core.sys.windows.windef.HWND _nppHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_nppHandle != core.sys.windows.windef.NULL);
	}

	do
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;

		return cast(bool)(core.sys.windows.winuser.SendMessageW(_nppHandle, npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPM_ISSTATUSBARHIDDEN, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/**
 * NPPM_GETSHORTCUTBYCMDID
 */
bool send_NPPM_GETSHORTCUTBYCMDID(core.sys.windows.windef.HWND _nppHandle, int cmdID, ref npp_api.powereditor.misc.pluginsmanager.plugininterface.ShortcutKey sk)

	in
	{
		static import core.sys.windows.windef;

		assert(_nppHandle != core.sys.windows.windef.NULL);
	}

	do
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;

		return cast(bool)(core.sys.windows.winuser.SendMessageW(_nppHandle, npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPM_GETSHORTCUTBYCMDID, cast(core.sys.windows.windef.WPARAM)(cmdID), cast(core.sys.windows.windef.LPARAM)(&sk)));
	}

/**
 * NPPM_DOOPEN
 */
bool send_NPPM_DOOPEN(core.sys.windows.windef.HWND _nppHandle, scope const core.sys.windows.winnt.WCHAR* fullPathName2Open)

	in
	{
		static import core.sys.windows.windef;

		assert(_nppHandle != core.sys.windows.windef.NULL);
		assert(fullPathName2Open != null);
	}

	do
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;

		return cast(bool)(core.sys.windows.winuser.SendMessageW(_nppHandle, npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPM_DOOPEN, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(fullPathName2Open)));
	}

/**
 * NPPM_SAVECURRENTFILEAS
 */
bool send_NPPM_SAVECURRENTFILEAS(core.sys.windows.windef.HWND _nppHandle, core.sys.windows.windef.BOOL asCopy, scope const core.sys.windows.winnt.WCHAR* filename)

	in
	{
		static import core.sys.windows.windef;

		assert(_nppHandle != core.sys.windows.windef.NULL);
		assert(filename != null);
	}

	do
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;

		return cast(bool)(core.sys.windows.winuser.SendMessageW(_nppHandle, npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPM_SAVECURRENTFILEAS, cast(core.sys.windows.windef.WPARAM)(asCopy), cast(core.sys.windows.windef.LPARAM)(filename)));
	}

/**
 * NPPM_GETCURRENTNATIVELANGENCODING
 */
int send_NPPM_GETCURRENTNATIVELANGENCODING(core.sys.windows.windef.HWND _nppHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_nppHandle != core.sys.windows.windef.NULL);
	}

	do
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;

		return cast(int)(core.sys.windows.winuser.SendMessageW(_nppHandle, npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPM_GETCURRENTNATIVELANGENCODING, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/**
 * NPPM_ALLOCATESUPPORTED
 */
bool send_NPPM_ALLOCATESUPPORTED(core.sys.windows.windef.HWND _nppHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_nppHandle != core.sys.windows.windef.NULL);
	}

	do
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;

		return cast(bool)(core.sys.windows.winuser.SendMessageW(_nppHandle, npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPM_ALLOCATESUPPORTED, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/**
 * NPPM_ALLOCATECMDID
 */
bool send_NPPM_ALLOCATECMDID(core.sys.windows.windef.HWND _nppHandle, int numberRequested, ref int startNumber)

	in
	{
		static import core.sys.windows.windef;

		assert(_nppHandle != core.sys.windows.windef.NULL);
	}

	do
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;

		return cast(bool)(core.sys.windows.winuser.SendMessageW(_nppHandle, npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPM_ALLOCATECMDID, cast(core.sys.windows.windef.WPARAM)(numberRequested), cast(core.sys.windows.windef.LPARAM)(&startNumber)));
	}

/**
 * NPPM_ALLOCATEMARKER
 */
bool send_NPPM_ALLOCATEMARKER(core.sys.windows.windef.HWND _nppHandle, int numberRequested, ref int startNumber)

	in
	{
		static import core.sys.windows.windef;

		assert(_nppHandle != core.sys.windows.windef.NULL);
	}

	do
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;

		return cast(bool)(core.sys.windows.winuser.SendMessageW(_nppHandle, npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPM_ALLOCATEMARKER, cast(core.sys.windows.windef.WPARAM)(numberRequested), cast(core.sys.windows.windef.LPARAM)(&startNumber)));
	}

/**
 * NPPM_GETLANGUAGENAME
 */
int send_NPPM_GETLANGUAGENAME(core.sys.windows.windef.HWND _nppHandle, npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType langType, core.sys.windows.winnt.WCHAR* langName)

	in
	{
		static import core.sys.windows.windef;

		assert(_nppHandle != core.sys.windows.windef.NULL);
		assert(langName != null);
	}

	do
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;

		return cast(int)(core.sys.windows.winuser.SendMessageW(_nppHandle, npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPM_GETLANGUAGENAME, cast(core.sys.windows.windef.WPARAM)(cast(int)(langType)), cast(core.sys.windows.windef.LPARAM)(langName)));
	}

/**
 * NPPM_GETLANGUAGEDESC
 */
int send_NPPM_GETLANGUAGEDESC(core.sys.windows.windef.HWND _nppHandle, npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType langType, core.sys.windows.winnt.WCHAR* langDesc)

	in
	{
		static import core.sys.windows.windef;

		assert(_nppHandle != core.sys.windows.windef.NULL);
		assert(langDesc != null);
	}

	do
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;

		return cast(int)(core.sys.windows.winuser.SendMessageW(_nppHandle, npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPM_GETLANGUAGEDESC, cast(core.sys.windows.windef.WPARAM)(cast(int)(langType)), cast(core.sys.windows.windef.LPARAM)(langDesc)));
	}

/**
 * NPPM_SHOWDOCSWITCHER
 */
void send_NPPM_SHOWDOCSWITCHER(core.sys.windows.windef.HWND _nppHandle, core.sys.windows.windef.BOOL toShowOrNot)

	in
	{
		static import core.sys.windows.windef;

		assert(_nppHandle != core.sys.windows.windef.NULL);
	}

	do
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;

		core.sys.windows.winuser.SendMessageW(_nppHandle, npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPM_SHOWDOCSWITCHER, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(toShowOrNot));
	}

/**
 * NPPM_ISDOCSWITCHERSHOWN
 */
bool send_NPPM_ISDOCSWITCHERSHOWN(core.sys.windows.windef.HWND _nppHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_nppHandle != core.sys.windows.windef.NULL);
	}

	do
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;

		return cast(bool)(core.sys.windows.winuser.SendMessageW(_nppHandle, npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPM_ISDOCSWITCHERSHOWN, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/**
 * NPPM_GETAPPDATAPLUGINSALLOWED
 */
bool send_NPPM_GETAPPDATAPLUGINSALLOWED(core.sys.windows.windef.HWND _nppHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_nppHandle != core.sys.windows.windef.NULL);
	}

	do
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;

		return cast(bool)(core.sys.windows.winuser.SendMessageW(_nppHandle, npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPM_GETAPPDATAPLUGINSALLOWED, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/**
 * NPPM_GETCURRENTVIEW
 */
int send_NPPM_GETCURRENTVIEW(core.sys.windows.windef.HWND _nppHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_nppHandle != core.sys.windows.windef.NULL);
	}

	do
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;

		return cast(int)(core.sys.windows.winuser.SendMessageW(_nppHandle, npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPM_GETCURRENTVIEW, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/**
 * NPPM_DOCSWITCHERDISABLECOLUMN
 */
void send_NPPM_DOCSWITCHERDISABLECOLUMN(core.sys.windows.windef.HWND _nppHandle, core.sys.windows.windef.BOOL disableOrNot)

	in
	{
		static import core.sys.windows.windef;

		assert(_nppHandle != core.sys.windows.windef.NULL);
	}

	do
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;

		core.sys.windows.winuser.SendMessageW(_nppHandle, npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPM_DOCSWITCHERDISABLECOLUMN, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(disableOrNot));
	}

/**
 * NPPM_GETEDITORDEFAULTFOREGROUNDCOLOR
 */
int send_NPPM_GETEDITORDEFAULTFOREGROUNDCOLOR(core.sys.windows.windef.HWND _nppHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_nppHandle != core.sys.windows.windef.NULL);
	}

	do
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;

		return cast(int)(core.sys.windows.winuser.SendMessageW(_nppHandle, npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPM_GETEDITORDEFAULTFOREGROUNDCOLOR, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/**
 * NPPM_GETEDITORDEFAULTBACKGROUNDCOLOR
 */
int send_NPPM_GETEDITORDEFAULTBACKGROUNDCOLOR(core.sys.windows.windef.HWND _nppHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_nppHandle != core.sys.windows.windef.NULL);
	}

	do
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;

		return cast(int)(core.sys.windows.winuser.SendMessageW(_nppHandle, npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPM_GETEDITORDEFAULTBACKGROUNDCOLOR, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/**
 * NPPM_SETSMOOTHFONT
 */
int send_NPPM_SETSMOOTHFONT(core.sys.windows.windef.HWND _nppHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_nppHandle != core.sys.windows.windef.NULL);
	}

	do
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;

		return cast(int)(core.sys.windows.winuser.SendMessageW(_nppHandle, npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPM_SETSMOOTHFONT, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/**
 * NPPM_SETEDITORBORDEREDGE
 */
void send_NPPM_SETEDITORBORDEREDGE(core.sys.windows.windef.HWND _nppHandle, core.sys.windows.windef.BOOL withEditorBorderEdgeOrNot)

	in
	{
		static import core.sys.windows.windef;

		assert(_nppHandle != core.sys.windows.windef.NULL);
	}

	do
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;

		core.sys.windows.winuser.SendMessageW(_nppHandle, npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPM_SETEDITORBORDEREDGE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(withEditorBorderEdgeOrNot));
	}

/**
 * NPPM_SAVEFILE
 */
void send_NPPM_SAVEFILE(core.sys.windows.windef.HWND _nppHandle, scope const core.sys.windows.winnt.WCHAR* fileNameToSave)

	in
	{
		static import core.sys.windows.windef;

		assert(_nppHandle != core.sys.windows.windef.NULL);
		assert(fileNameToSave != null);
	}

	do
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;

		core.sys.windows.winuser.SendMessageW(_nppHandle, npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPM_SAVEFILE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(fileNameToSave));
	}

/**
 * NPPM_DISABLEAUTOUPDATE
 */
void send_NPPM_DISABLEAUTOUPDATE(core.sys.windows.windef.HWND _nppHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_nppHandle != core.sys.windows.windef.NULL);
	}

	do
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;

		core.sys.windows.winuser.SendMessageW(_nppHandle, npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPM_DISABLEAUTOUPDATE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}

/**
 * NPPM_REMOVESHORTCUTBYCMDID
 */
core.stdc.config.c_long send_NPPM_REMOVESHORTCUTBYCMDID(core.sys.windows.windef.HWND _nppHandle, int cmdID)

	in
	{
		static import core.sys.windows.windef;

		assert(_nppHandle != core.sys.windows.windef.NULL);
	}

	do
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;

		return cast(core.stdc.config.c_long)(core.sys.windows.winuser.SendMessageW(_nppHandle, npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPM_REMOVESHORTCUTBYCMDID, cast(core.sys.windows.windef.WPARAM)(cmdID), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/**
 * NPPM_GETPLUGINHOMEPATH
 */
int send_NPPM_GETPLUGINHOMEPATH(core.sys.windows.windef.HWND _nppHandle, size_t strLen, core.sys.windows.winnt.WCHAR* pluginRootPath)

	in
	{
		static import core.sys.windows.windef;

		assert(_nppHandle != core.sys.windows.windef.NULL);
		assert(pluginRootPath != null);
	}

	do
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;

		return cast(int)(core.sys.windows.winuser.SendMessageW(_nppHandle, npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPM_GETPLUGINHOMEPATH, cast(core.sys.windows.windef.WPARAM)(strLen), cast(core.sys.windows.windef.LPARAM)(pluginRootPath)));
	}

/**
 * NPPM_GETFULLCURRENTPATH
 */
bool send_NPPM_GETFULLCURRENTPATH(core.sys.windows.windef.HWND _nppHandle, size_t strLen, core.sys.windows.winnt.WCHAR* str)

	in
	{
		static import core.sys.windows.windef;

		assert(_nppHandle != core.sys.windows.windef.NULL);
		assert(str != null);
	}

	do
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;

		return cast(bool)(core.sys.windows.winuser.SendMessageW(_nppHandle, npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPM_GETFULLCURRENTPATH, cast(core.sys.windows.windef.WPARAM)(strLen), cast(core.sys.windows.windef.LPARAM)(str)));
	}

/**
 * NPPM_GETCURRENTDIRECTORY
 */
bool send_NPPM_GETCURRENTDIRECTORY(core.sys.windows.windef.HWND _nppHandle, size_t strLen, core.sys.windows.winnt.WCHAR* str)

	in
	{
		static import core.sys.windows.windef;

		assert(_nppHandle != core.sys.windows.windef.NULL);
		assert(str != null);
	}

	do
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;

		return cast(bool)(core.sys.windows.winuser.SendMessageW(_nppHandle, npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPM_GETCURRENTDIRECTORY, cast(core.sys.windows.windef.WPARAM)(strLen), cast(core.sys.windows.windef.LPARAM)(str)));
	}

/**
 * NPPM_GETFILENAME
 */
bool send_NPPM_GETFILENAME(core.sys.windows.windef.HWND _nppHandle, size_t strLen, core.sys.windows.winnt.WCHAR* str)

	in
	{
		static import core.sys.windows.windef;

		assert(_nppHandle != core.sys.windows.windef.NULL);
		assert(str != null);
	}

	do
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;

		return cast(bool)(core.sys.windows.winuser.SendMessageW(_nppHandle, npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPM_GETFILENAME, cast(core.sys.windows.windef.WPARAM)(strLen), cast(core.sys.windows.windef.LPARAM)(str)));
	}

/**
 * NPPM_GETNAMEPART
 */
bool send_NPPM_GETNAMEPART(core.sys.windows.windef.HWND _nppHandle, size_t strLen, core.sys.windows.winnt.WCHAR* str)

	in
	{
		static import core.sys.windows.windef;

		assert(_nppHandle != core.sys.windows.windef.NULL);
		assert(str != null);
	}

	do
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;

		return cast(bool)(core.sys.windows.winuser.SendMessageW(_nppHandle, npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPM_GETNAMEPART, cast(core.sys.windows.windef.WPARAM)(strLen), cast(core.sys.windows.windef.LPARAM)(str)));
	}

/**
 * NPPM_GETEXTPART
 */
bool send_NPPM_GETEXTPART(core.sys.windows.windef.HWND _nppHandle, size_t strLen, core.sys.windows.winnt.WCHAR* str)

	in
	{
		static import core.sys.windows.windef;

		assert(_nppHandle != core.sys.windows.windef.NULL);
		assert(str != null);
	}

	do
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;

		return cast(bool)(core.sys.windows.winuser.SendMessageW(_nppHandle, npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPM_GETEXTPART, cast(core.sys.windows.windef.WPARAM)(strLen), cast(core.sys.windows.windef.LPARAM)(str)));
	}

/**
 * NPPM_GETCURRENTWORD
 */
bool send_NPPM_GETCURRENTWORD(core.sys.windows.windef.HWND _nppHandle, size_t strLen, core.sys.windows.winnt.WCHAR* str)

	in
	{
		static import core.sys.windows.windef;

		assert(_nppHandle != core.sys.windows.windef.NULL);
		assert(str != null);
	}

	do
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;

		return cast(bool)(core.sys.windows.winuser.SendMessageW(_nppHandle, npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPM_GETCURRENTWORD, cast(core.sys.windows.windef.WPARAM)(strLen), cast(core.sys.windows.windef.LPARAM)(str)));
	}

/**
 * NPPM_GETNPPDIRECTORY
 */
bool send_NPPM_GETNPPDIRECTORY(core.sys.windows.windef.HWND _nppHandle, size_t strLen, core.sys.windows.winnt.WCHAR* str)

	in
	{
		static import core.sys.windows.windef;

		assert(_nppHandle != core.sys.windows.windef.NULL);
		assert(str != null);
	}

	do
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;

		return cast(bool)(core.sys.windows.winuser.SendMessageW(_nppHandle, npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPM_GETNPPDIRECTORY, cast(core.sys.windows.windef.WPARAM)(strLen), cast(core.sys.windows.windef.LPARAM)(str)));
	}

/**
 * NPPM_GETFILENAMEATCURSOR
 */
bool send_NPPM_GETFILENAMEATCURSOR(core.sys.windows.windef.HWND _nppHandle, size_t strLen, core.sys.windows.winnt.WCHAR* str)

	in
	{
		static import core.sys.windows.windef;

		assert(_nppHandle != core.sys.windows.windef.NULL);
		assert(str != null);
	}

	do
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;

		return cast(bool)(core.sys.windows.winuser.SendMessageW(_nppHandle, npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPM_GETFILENAMEATCURSOR, cast(core.sys.windows.windef.WPARAM)(strLen), cast(core.sys.windows.windef.LPARAM)(str)));
	}

/**
 * NPPM_GETCURRENTLINE
 */
int send_NPPM_GETCURRENTLINE(core.sys.windows.windef.HWND _nppHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_nppHandle != core.sys.windows.windef.NULL);
	}

	do
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;

		return cast(int)(core.sys.windows.winuser.SendMessageW(_nppHandle, npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPM_GETCURRENTLINE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/**
 * NPPM_GETCURRENTCOLUMN
 */
int send_NPPM_GETCURRENTCOLUMN(core.sys.windows.windef.HWND _nppHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_nppHandle != core.sys.windows.windef.NULL);
	}

	do
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;

		return cast(int)(core.sys.windows.winuser.SendMessageW(_nppHandle, npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPM_GETCURRENTCOLUMN, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/**
 * NPPM_GETNPPFULLFILEPATH
 */
bool send_NPPM_GETNPPFULLFILEPATH(core.sys.windows.windef.HWND _nppHandle, size_t strLen, core.sys.windows.winnt.WCHAR* str)

	in
	{
		static import core.sys.windows.windef;

		assert(_nppHandle != core.sys.windows.windef.NULL);
		assert(str != null);
	}

	do
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;

		return cast(bool)(core.sys.windows.winuser.SendMessageW(_nppHandle, npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPM_GETNPPFULLFILEPATH, cast(core.sys.windows.windef.WPARAM)(strLen), cast(core.sys.windows.windef.LPARAM)(str)));
	}
