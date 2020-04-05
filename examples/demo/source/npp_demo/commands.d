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
 * plugin demo
 *
 * License: GPL-2.0 or later
 */
module npp_demo.commands;


private static import core.stdc.stdint;
private static import core.stdc.stdio;
private static import core.stdc.stdlib;
private static import core.stdc.string;
private static import core.stdc.time;
private static import core.sys.windows.basetsd;
private static import core.sys.windows.winbase;
private static import core.sys.windows.windef;
private static import core.sys.windows.winnls;
private static import core.sys.windows.winnt;
private static import core.sys.windows.winuser;
private static import std.path;
private static import std.string;
private static import npp_api.pluginfunc.npp_msgs;
private static import npp_api.pluginfunc.path;
private static import npp_api.pluginfunc.scintilla_msg;
private static import npp_api.pluginfunc.string;
private static import npp_api.powereditor.menucmdid;
private static import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;
private static import npp_api.powereditor.misc.pluginsmanager.plugininterface;
private static import npp_api.powereditor.scitillacomponent.gotolinedlg;
private static import npp_api.powereditor.wincontrols.dockingwnd.docking;
private static import npp_api.scintilla.scintilla;
private static import npp_demo.plugin_dll;

version (Windows):

//pragma(lib, "kernel32");
//pragma(lib, "user32");

enum DOCKABLE_DEMO_INDEX = 15;
enum bool shortDate = true;
enum bool longDate = false;

extern (C)
extern npp_api.powereditor.misc.pluginsmanager.plugininterface.NppData nppData;

extern (C)
extern __gshared npp_api.powereditor.misc.pluginsmanager.plugininterface.NppData gshared_nppData;

/**
 * 
 */
extern (Windows)
nothrow @nogc
package core.sys.windows.windef.DWORD threadZoomer(void*)

	in
	{
	}

	do
	{
		static import core.stdc.stdint;
		static import core.sys.windows.winbase;
		static import core.sys.windows.windef;
		static import npp_api.pluginfunc.npp_msgs;
		static import npp_api.pluginfunc.scintilla_msg;
		static import npp_api.scintilla.scintilla;

		// Get the current scintilla
		int currentEdit = -1;
		npp_api.pluginfunc.npp_msgs.send_NPPM_GETCURRENTSCINTILLA(.gshared_nppData._nppHandle, currentEdit);

		if (currentEdit == -1) {
			return core.sys.windows.windef.FALSE;
		}

		core.sys.windows.windef.HWND curScintilla = (currentEdit == 0) ? (.gshared_nppData._scintillaMainHandle) : (.gshared_nppData._scintillaSecondHandle);

		core.stdc.stdint.intptr_t currentZoomLevel = npp_api.pluginfunc.scintilla_msg.send_SCI_GETZOOM(curScintilla);

		core.stdc.stdint.intptr_t i = currentZoomLevel;

		for (size_t j = 0 ; j < 4 ; ++j) {
			for ( ; i >= -10 ; i--) {
				npp_api.pluginfunc.scintilla_msg.send_SCI_SETZOOM(curScintilla, i);
				core.sys.windows.winbase.Sleep(30);
			}

			core.sys.windows.winbase.Sleep(100);

			for ( ; i <= 20 ; ++i) {
				core.sys.windows.winbase.Sleep(30);
				npp_api.pluginfunc.scintilla_msg.send_SCI_SETZOOM(curScintilla, i);
			}

			core.sys.windows.winbase.Sleep(100);
		}

		core.sys.windows.winbase.Sleep(100);

		for ( ; i >= currentZoomLevel ; i--) {
			core.sys.windows.winbase.Sleep(30);
			npp_api.pluginfunc.scintilla_msg.send_SCI_SETZOOM(curScintilla, i);
		}

		return core.sys.windows.windef.TRUE;
	}

/**
 * 
 */
extern (Windows)
nothrow @nogc
package core.sys.windows.windef.DWORD threadTextPlayer(void* text2display)

	in
	{
	}

	do
	{
		static import core.stdc.string;
		static import core.stdc.time;
		static import core.sys.windows.winbase;
		static import core.sys.windows.windef;
		static import npp_api.pluginfunc.npp_msgs;
		static import npp_api.pluginfunc.scintilla_msg;
		static import npp_api.powereditor.menucmdid;
		static import npp_api.scintilla.scintilla;

		enum RAND_MAX = 0x7FFF;

		// Open a new document
		npp_api.pluginfunc.npp_msgs.send_NPPM_MENUCOMMAND(.gshared_nppData._nppHandle, npp_api.powereditor.menucmdid.IDM_FILE_NEW);

		// Get the current scintilla
		int currentEdit = -1;
		npp_api.pluginfunc.npp_msgs.send_NPPM_GETCURRENTSCINTILLA(.gshared_nppData._nppHandle, currentEdit);

		if (currentEdit == -1) {
			return core.sys.windows.windef.FALSE;
		}

		core.sys.windows.windef.HWND curScintilla = (currentEdit == 0) ? (.gshared_nppData._scintillaMainHandle) : (.gshared_nppData._scintillaSecondHandle);
		core.stdc.stdlib.srand(cast(uint)(core.stdc.time.time(core.sys.windows.windef.NULL)));
		int rangeMin = 0;
		int rangeMax = 250;
		size_t length = core.stdc.string.strlen(cast(char*)(text2display));

		for (size_t i = 0 ; i < length; ++i) {
			char[2] charToShow = [*((cast(char*)(text2display)) + i), '\0'];

			version (none) {
				int ranNum = rangeMin + cast(int)(cast(double)(core.stdc.stdlib.rand()) / (cast(double)(RAND_MAX) + 1) * rangeMax);
				core.sys.windows.winbase.Sleep(ranNum + 30);
			}

			npp_api.pluginfunc.scintilla_msg.send_SCI_APPENDTEXT(curScintilla, 1, &(charToShow[0]));
			npp_api.pluginfunc.scintilla_msg.send_SCI_GOTOPOS(curScintilla, npp_api.pluginfunc.scintilla_msg.send_SCI_GETLENGTH(curScintilla));
		}

		return core.sys.windows.windef.TRUE;
	}

/**
 * plugin command
 */
extern (C)
nothrow @nogc
void hello()

	do
	{
		static import core.sys.windows.windef;
		static import npp_api.pluginfunc.npp_msgs;
		static import npp_api.pluginfunc.scintilla_msg;
		static import npp_api.powereditor.menucmdid;

		// Open a new document
		npp_api.pluginfunc.npp_msgs.send_NPPM_MENUCOMMAND(.nppData._nppHandle, npp_api.powereditor.menucmdid.IDM_FILE_NEW);

		// Get the current scintilla
		int currentEdit = -1;
		npp_api.pluginfunc.npp_msgs.send_NPPM_GETCURRENTSCINTILLA(.nppData._nppHandle, currentEdit);

		if (currentEdit == -1) {
			return;
		}

		core.sys.windows.windef.HWND curScintilla = (currentEdit == 0) ? (.nppData._scintillaMainHandle) : (.nppData._scintillaSecondHandle);

		// Say hello now :
		// Scintilla control has no Unicode mode, so we use (char*) here
		enum string msg_text = "Hello, Notepad++!\0";
		npp_api.pluginfunc.scintilla_msg.send_SCI_SETTEXT(curScintilla, &(msg_text[0]));
	}

/**
 * plugin command
 */
extern (C)
nothrow @nogc
void helloFX()

	do
	{
		static import core.sys.windows.basetsd;
		static import core.sys.windows.winbase;
		static import core.sys.windows.windef;

		hello();
		core.sys.windows.basetsd.HANDLE hThread = core.sys.windows.winbase.CreateThread(core.sys.windows.windef.NULL, 0, &threadZoomer, core.sys.windows.windef.NULL, 0, core.sys.windows.windef.NULL);
		core.sys.windows.winbase.CloseHandle(hThread);
	}

/**
 * plugin command
 */
extern (C)
nothrow @nogc
void WhatIsNpp()

	do
	{
		static import core.sys.windows.basetsd;
		static import core.sys.windows.winbase;
		static import core.sys.windows.windef;
		static import core.sys.windows.winnt;

		string text2display = `Notepad++ is a free (as in "free speech" and also as in "free beer") source code editor and Notepad replacement that supports several languages.
		Running in the MS Windows environment, its use is governed by GPL License.

Based on a powerful editing component Scintilla, Notepad++ is written in C++ and uses pure Win32 API and STL which ensures a higher execution speed and smaller program size.
By optimizing as many routines as possible without losing user friendliness, Notepad++ is trying to reduce the world carbon dioxide emissions. When using less CPU power, the PC can throttle down and reduce power consumption, resulting in a greener environment.` ~ "\0";
		core.sys.windows.basetsd.HANDLE hThread = core.sys.windows.winbase.CreateThread(core.sys.windows.windef.NULL, 0, &.threadTextPlayer, cast(core.sys.windows.winnt.LPVOID*)(&(text2display[0])), 0, core.sys.windows.windef.NULL);
		core.sys.windows.winbase.CloseHandle(hThread);
	}

/**
 * 
 */
nothrow @nogc
void insertCurrentPath(int which)

	do
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winnls;
		static import core.sys.windows.winnt;
		static import core.sys.windows.winuser;
		static import npp_api.pluginfunc.npp_msgs;
		static import npp_api.pluginfunc.path;
		static import npp_api.pluginfunc.scintilla_msg;
		static import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;
		static import npp_api.scintilla.scintilla;

		int msg;

		switch (which) {
			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.FILE_NAME:
				msg = npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPM_GETFILENAME;

				break;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.CURRENT_DIRECTORY:
				msg = npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPM_GETCURRENTDIRECTORY;

				break;

			default:
				msg = npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPM_GETFULLCURRENTPATH;

				break;
		}

		int currentEdit;
		core.sys.windows.winnt.WCHAR[npp_api.pluginfunc.path.OS_MAX_PATH] path = '\0';

		// A message to Notepad++ to get a multibyte string (if ANSI mode) or a wide char string (if Unicode mode)
		core.sys.windows.winuser.SendMessageW(.nppData._nppHandle, msg, path.length, cast(core.sys.windows.windef.LPARAM)(&(path[0])));

		//
		npp_api.pluginfunc.npp_msgs.send_NPPM_GETCURRENTSCINTILLA(.nppData._nppHandle, currentEdit);
		core.sys.windows.windef.HWND curScint = (currentEdit == 0) ? (.nppData._scintillaMainHandle) : (.nppData._scintillaSecondHandle);

		int encoding = cast(int)(npp_api.pluginfunc.scintilla_msg.send_SCI_GETCODEPAGE(curScint));
		char[core.sys.windows.windef.MAX_PATH] pathA;
		core.sys.windows.winnls.WideCharToMultiByte(encoding, 0, &(path[0]), -1, &(pathA[0]), core.sys.windows.windef.MAX_PATH, core.sys.windows.windef.NULL, core.sys.windows.windef.NULL);
		npp_api.pluginfunc.scintilla_msg.send_SCI_REPLACESEL(curScint, &(pathA[0]));
	}

/**
 * plugin command
 */
extern (C)
nothrow @nogc
void insertCurrentFullPath()

	do
	{
		static import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;

		.insertCurrentPath(npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.FULL_CURRENT_PATH);
	}

/**
 * plugin command
 */
extern (C)
nothrow @nogc
void insertCurrentFileName()

	do
	{
		static import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;

		.insertCurrentPath(npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.FILE_NAME);
	}

/**
 * plugin command
 */
extern (C)
nothrow
void insertCurrentDirectory()

	do
	{
		static import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;

		.insertCurrentPath(npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.CURRENT_DIRECTORY);
	}

/**
 * 
 */
nothrow @nogc
void insertDateTime(bool format)

	do
	{
		static import core.sys.windows.winbase;
		static import core.sys.windows.windef;
		static import core.sys.windows.winnls;
		static import core.sys.windows.winnt;
		static import core.sys.windows.winuser;
		static import npp_api.pluginfunc.npp_msgs;
		static import npp_api.pluginfunc.scintilla_msg;
		static import npp_api.pluginfunc.string;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winnt.WCHAR[128] date;
		core.sys.windows.winnt.WCHAR[128] time;
		core.sys.windows.winnt.WCHAR[256] dateTime;

		core.sys.windows.winbase.SYSTEMTIME st;
		core.sys.windows.winbase.GetLocalTime(&st);
		core.sys.windows.winnls.GetDateFormatW(core.sys.windows.winnls.LOCALE_USER_DEFAULT, ((format == .shortDate) ? (core.sys.windows.winnls.DATE_SHORTDATE) : (core.sys.windows.winnls.DATE_LONGDATE)), &st, core.sys.windows.windef.NULL, &(date[0]), 128);
		core.sys.windows.winnls.GetTimeFormatW(core.sys.windows.winnls.LOCALE_USER_DEFAULT, core.sys.windows.winnls.TIME_NOSECONDS, &st, core.sys.windows.windef.NULL, &(time[0]), 128);

		core.sys.windows.winuser.wsprintfW(&(dateTime[0]), &(npp_api.pluginfunc.string.c_wstring!("%s %s"w)[0]), &(time[0]), &(date[0]));

		int currentEdit;
		npp_api.pluginfunc.npp_msgs.send_NPPM_GETCURRENTSCINTILLA(.nppData._nppHandle, currentEdit);
		core.sys.windows.windef.HWND curScint = (currentEdit == 0) ? (.nppData._scintillaMainHandle) : (.nppData._scintillaSecondHandle);
		int encoding = cast(int)(npp_api.pluginfunc.scintilla_msg.send_SCI_GETCODEPAGE(curScint));
		char[core.sys.windows.windef.MAX_PATH] dateTimeA;
		core.sys.windows.winnls.WideCharToMultiByte(encoding, 0, &(dateTime[0]), -1, &(dateTimeA[0]), core.sys.windows.windef.MAX_PATH, core.sys.windows.windef.NULL, core.sys.windows.windef.NULL);
		npp_api.pluginfunc.scintilla_msg.send_SCI_REPLACESEL(curScint, &(dateTimeA[0]));
	}

/**
 * plugin command
 */
extern (C)
nothrow @nogc
void insertShortDateTime()

	do
	{
		.insertDateTime(.shortDate);
	}

/**
 * plugin command
 */
extern (C)
nothrow @nogc
void insertLongDateTime()

	do
	{
		.insertDateTime(.longDate);
	}

/**
 * plugin command
 */
extern (C)
nothrow @nogc
void getFileNamesDemo()

	do
	{
		static import core.stdc.stdio;
		static import core.stdc.stdlib;
		static import core.sys.windows.windef;
		static import core.sys.windows.winnt;
		static import core.sys.windows.winuser;
		static import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;
		static import npp_api.pluginfunc.npp_msgs;

		size_t malloc_count = 0;
		int nbFile = cast(int)(npp_api.pluginfunc.npp_msgs.send_NPPM_GETNBOPENFILES(.nppData._nppHandle, npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.ALL_OPEN_FILES));
		char[16] temp = '\0';

		if (nbFile > 1) {
			nbFile--;
		}

		core.stdc.stdio.snprintf(&(temp[0]), 4, &("%d\0"[0]), nbFile);
		core.sys.windows.winuser.MessageBoxA(.nppData._nppHandle, &(temp[0]), &("Notepad++ opened files\0"[0]), core.sys.windows.winuser.MB_OK);

		core.sys.windows.winnt.WCHAR** fileNames = cast(core.sys.windows.winnt.WCHAR**)(core.stdc.stdlib.malloc((core.sys.windows.winnt.WCHAR*).sizeof * nbFile));

		if (fileNames == null) {
			return;
		}

		scope (exit) {
			core.stdc.stdlib.free(fileNames);
			fileNames = null;
		}

		for (size_t i = 0 ; i < nbFile; ++i) {
			*(fileNames + i) = cast(core.sys.windows.winnt.WCHAR*)(core.stdc.stdlib.malloc(core.sys.windows.winnt.WCHAR.sizeof * core.sys.windows.windef.MAX_PATH));

			if ((*(fileNames + i)) == null) {
				for (size_t j; j < malloc_count; ++j) {
					core.stdc.stdlib.free(*(fileNames + j));
				}

				return;
			}

			++malloc_count;
		}

		scope (exit) {
			for (size_t j; j < malloc_count; ++j) {
				core.stdc.stdlib.free(*(fileNames + j));
				fileNames[j] = null;
			}
		}

		if (npp_api.pluginfunc.npp_msgs.send_NPPM_GETOPENFILENAMES(.nppData._nppHandle, fileNames, nbFile)) {
			for (size_t i = 0 ; i < nbFile; ++i) {
				core.sys.windows.winuser.MessageBoxW(.nppData._nppHandle, *(fileNames + i), &("\0"w[0]), core.sys.windows.winuser.MB_OK);
			}
		}
	}

/**
 * plugin command
 */
extern (C)
nothrow @nogc
void getSessionFileNamesDemo()

	do
	{
		static import core.stdc.stdio;
		static import core.stdc.stdlib;
		static import core.sys.windows.windef;
		static import core.sys.windows.winnt;
		static import core.sys.windows.winuser;
		static import npp_api.pluginfunc.npp_msgs;
		static import npp_api.pluginfunc.string;

		size_t malloc_count = 0;
		const core.sys.windows.winnt.WCHAR[] sessionFullPath = npp_api.pluginfunc.string.c_wstring!("c:\\test.session"w);
		char[16] temp = '\0';
		size_t nbFile = npp_api.pluginfunc.npp_msgs.send_NPPM_GETNBSESSIONFILES(.nppData._nppHandle, &(sessionFullPath[0]));

		if (nbFile == 0) {
			core.sys.windows.winuser.MessageBoxW(.nppData._nppHandle, &(npp_api.pluginfunc.string.c_wstring!("Please modify \"sessionFullPath\" in \"NppInsertPlugin.cpp\" in order to point to a valide session file")[0]), &(npp_api.pluginfunc.string.c_wstring!("Error :"w)[0]), core.sys.windows.winuser.MB_OK);

			return;
		}

		core.stdc.stdio.snprintf(&(temp[0]), 4, &("%d\0"[0]), nbFile);
		core.sys.windows.winuser.MessageBoxA(.nppData._nppHandle, &(temp[0]), &("Notepad++ session files\0"[0]), core.sys.windows.winuser.MB_OK);

		core.sys.windows.winnt.WCHAR** fileNames = cast(core.sys.windows.winnt.WCHAR**)(core.stdc.stdlib.malloc((core.sys.windows.winnt.WCHAR*).sizeof * nbFile));

		if (fileNames == null) {
			return;
		}

		scope (exit) {
			core.stdc.stdlib.free(fileNames);
			fileNames = null;
		}

		for (size_t i = 0 ; i < nbFile; ++i) {
			*(fileNames + i) = cast(core.sys.windows.winnt.WCHAR*)(core.stdc.stdlib.malloc(core.sys.windows.winnt.WCHAR.sizeof * core.sys.windows.windef.MAX_PATH));

			if ((*(fileNames + i)) == null) {
				for (size_t j; j < malloc_count; ++j) {
					core.stdc.stdlib.free(*(fileNames + j));
				}

				return;
			}

			++malloc_count;
		}

		scope (exit) {
			for (size_t j; j < malloc_count; ++j) {
				core.stdc.stdlib.free(*(fileNames + j));
				fileNames[j] = null;
			}
		}

		if (npp_api.pluginfunc.npp_msgs.send_NPPM_GETSESSIONFILES(.nppData._nppHandle, fileNames, &(sessionFullPath[0]))) {
			for (size_t i = 0 ; i < nbFile ; ++i) {
				core.sys.windows.winuser.MessageBoxW(.nppData._nppHandle, *(fileNames + i), &(npp_api.pluginfunc.string.c_wstring!("session file name :"w)[0]), core.sys.windows.winuser.MB_OK);
			}
		}
	}

/**
 * plugin command
 */
extern (C)
nothrow @nogc
void saveCurrentSessionDemo()

	do
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winnt;
		static import core.sys.windows.winuser;
		static import npp_api.pluginfunc.npp_msgs;
		static import npp_api.pluginfunc.string;

		const (core.sys.windows.winnt.WCHAR)* sessionPath = npp_api.pluginfunc.npp_msgs.send_NPPM_SAVECURRENTSESSION(.nppData._nppHandle, core.sys.windows.windef.NULL);

		if (sessionPath != null) {
			core.sys.windows.winuser.MessageBoxW(.nppData._nppHandle, sessionPath, &(npp_api.pluginfunc.string.c_wstring!("Saved Session File :"w)[0]), core.sys.windows.winuser.MB_OK);
		}
	}

/**
 * plugin command
 * Dockable Dialog Demo
 *
 * This demonstration shows you how to do a dockable dialog.
 * You can create your own non dockable dialog - in this case you don't nedd this demonstration.
 * You have to create your dialog by inherented DockingDlgInterface class in order to make your dialog dockable
 * - please see DemoDlg.h and DemoDlg.cpp to have more informations.
 */
extern (C)
nothrow
void DockableDlgDemo()

	do
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.pluginfunc.npp_msgs;
		static import npp_api.powereditor.wincontrols.dockingwnd.docking;
		static import npp_demo.gotolinedlg;
		static import npp_demo.plugin_dll;

		npp_demo.gotolinedlg._goToLine.setParent(.gshared_nppData._nppHandle);
		npp_api.powereditor.wincontrols.dockingwnd.docking.tTbData data;

		try {
			if (!npp_demo.gotolinedlg._goToLine.isCreated()) {
				npp_demo.gotolinedlg._goToLine.create(&npp_demo.gotolinedlg._goToLine, data);

				// define the default docking behaviour
				data.uMask = npp_api.powereditor.wincontrols.dockingwnd.docking.DWS_DF_CONT_RIGHT;

				data.pszModuleName = npp_demo.gotolinedlg._goToLine.getPluginFileName();

				// the dlgDlg should be the index of func_list where the current function pointer is
				// in this case is DOCKABLE_DEMO_INDEX
				data.dlgID = .DOCKABLE_DEMO_INDEX;
				npp_api.pluginfunc.npp_msgs.send_NPPM_DMMREGASDCKDLG(.gshared_nppData._nppHandle, &data);
			}

			npp_demo.gotolinedlg._goToLine.display();
		} catch (Exception e) {
			//ToDo:
			core.sys.windows.winuser.MessageBoxW(.nppData._nppHandle, &("Exception\0"w[0]), &(npp_demo.plugin_dll.plugin_name[0]), core.sys.windows.winuser.MB_OK);
		}
	}
