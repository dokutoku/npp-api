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
module npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;


private static import core.stdc.config;
private static import core.sys.windows.windef;
private static import core.sys.windows.winnt;
private static import core.sys.windows.winuser;

enum LangType
{
	L_TEXT,
	L_PHP,
	L_C,
	L_CPP,
	L_CS,
	L_OBJC,
	L_JAVA,
	L_RC,
	L_HTML,
	L_XML,
	L_MAKEFILE,
	L_PASCAL,
	L_BATCH,
	L_INI,
	L_ASCII,
	L_USER,
	L_ASP,
	L_SQL,
	L_VB,
	L_JS,
	L_CSS,
	L_PERL,
	L_PYTHON,
	L_LUA,
	L_TEX,
	L_FORTRAN,
	L_BASH,
	L_FLASH,
	L_NSIS,
	L_TCL,
	L_LISP,
	L_SCHEME,
	L_ASM,
	L_DIFF,
	L_PROPS,
	L_PS,
	L_RUBY,
	L_SMALLTALK,
	L_VHDL,
	L_KIX,
	L_AU3,
	L_CAML,
	L_ADA,
	L_VERILOG,
	L_MATLAB,
	L_HASKELL,
	L_INNO,
	L_SEARCHRESULT,
	L_CMAKE,
	L_YAML,
	L_COBOL,
	L_GUI4CLI,
	L_D,
	L_POWERSHELL,
	L_R,
	L_JSP,
	L_COFFEESCRIPT,
	L_JSON,
	L_JAVASCRIPT,
	L_FORTRAN_77,

	L_BAANC,
	L_SREC,
	L_IHEX,
	L_TEHEX,
	L_SWIFT,
	L_ASN1,
	L_AVS,
	L_BLITZBASIC,
	L_PUREBASIC,
	L_FREEBASIC,
	L_CSOUND,
	L_ERLANG,
	L_ESCRIPT,
	L_FORTH,
	L_LATEX,
	L_MMIXAL,
	L_NIMROD,
	L_NNCRONTAB,
	L_OSCRIPT,
	L_REBOL,
	L_REGISTRY,
	L_RUST,
	L_SPICE,
	L_TXT2TAGS,
	L_VISUALPROLOG,

	// Don't use L_JS, use L_JAVASCRIPT instead
	// The end of enumated language type, so it should be always at the end
	L_EXTERNAL,
}

enum winVer
{
	WV_UNKNOWN,
	WV_WIN32S,
	WV_95,
	WV_98,
	WV_ME,
	WV_NT,
	WV_W2K,
	WV_XP,
	WV_S2003,
	WV_XPX64,
	WV_VISTA,
	WV_WIN7,
	WV_WIN8,
	WV_WIN81,
	WV_WIN10,
}

enum Platform
{
	PF_UNKNOWN,
	PF_X86,
	PF_X64,
	PF_IA64
}

version (Windows):

enum NPPMSG = core.sys.windows.winuser.WM_USER + 1000;

enum NPPM_GETCURRENTSCINTILLA = .NPPMSG + 4;
enum NPPM_GETCURRENTLANGTYPE = .NPPMSG + 5;
enum NPPM_SETCURRENTLANGTYPE = .NPPMSG + 6;

enum NPPM_GETNBOPENFILES = .NPPMSG + 7;
enum ALL_OPEN_FILES = 0;
enum PRIMARY_VIEW = 1;
enum SECOND_VIEW = 2;

enum NPPM_GETOPENFILENAMES = .NPPMSG + 8;

enum NPPM_MODELESSDIALOG = .NPPMSG + 12;
enum MODELESSDIALOGADD = 0;
enum MODELESSDIALOGREMOVE = 1;

enum NPPM_GETNBSESSIONFILES = .NPPMSG + 13;
enum NPPM_GETSESSIONFILES = .NPPMSG + 14;
enum NPPM_SAVESESSION = .NPPMSG + 15;
enum NPPM_SAVECURRENTSESSION = .NPPMSG + 16;

struct sessionInfo
{
	static import core.sys.windows.winnt;

	core.sys.windows.winnt.WCHAR* sessionFilePathName;
	int nbFile;
	core.sys.windows.winnt.WCHAR** files;
}

enum NPPM_GETOPENFILENAMESPRIMARY = .NPPMSG + 17;
enum NPPM_GETOPENFILENAMESSECOND = .NPPMSG + 18;

enum NPPM_CREATESCINTILLAHANDLE = .NPPMSG + 20;
enum NPPM_DESTROYSCINTILLAHANDLE = .NPPMSG + 21;
enum NPPM_GETNBUSERLANG = .NPPMSG + 22;

enum NPPM_GETCURRENTDOCINDEX = .NPPMSG + 23;
enum MAIN_VIEW = 0;
enum SUB_VIEW = 1;

enum NPPM_SETSTATUSBAR = .NPPMSG + 24;
enum STATUSBAR_DOC_TYPE = 0;
enum STATUSBAR_DOC_SIZE = 1;
enum STATUSBAR_CUR_POS = 2;
enum STATUSBAR_EOF_FORMAT = 3;
enum STATUSBAR_UNICODE_TYPE = 4;
enum STATUSBAR_TYPING_MODE = 5;

enum NPPM_GETMENUHANDLE = .NPPMSG + 25;
enum NPPPLUGINMENU = 0;
enum NPPMAINMENU = 1;
// core.sys.windows.windef.INT NPPM_GETMENUHANDLE(core.sys.windows.windef.INT menuChoice, 0)
// Return: menu handle (core.sys.windows.windef.HMENU) of choice (plugin menu handle or Notepad++ main menu handle)

//ascii file to unicode
//int NPPM_ENCODESCI(.MAIN_VIEW / .SUB_VIEW, 0)
//return new unicodeMode
enum NPPM_ENCODESCI = .NPPMSG + 26;

//unicode file to ascii
//int NPPM_DECODESCI(.MAIN_VIEW / .SUB_VIEW, 0)
//return old unicodeMode
enum NPPM_DECODESCI = .NPPMSG + 27;

//void NPPM_ACTIVATEDOC(int view, int index2Activate)
enum NPPM_ACTIVATEDOC = .NPPMSG + 28;

//void NPPM_LAUNCHFINDINFILESDLG(core.sys.windows.winnt.WCHAR* dir2Search, core.sys.windows.winnt.WCHAR* filtre)
enum NPPM_LAUNCHFINDINFILESDLG = .NPPMSG + 29;

//void NPPM_DMMSHOW(0, (*tTbData).hClient)
enum NPPM_DMMSHOW = .NPPMSG + 30;

//void NPPM_DMMHIDE(0, (*tTbData).hClient)
enum NPPM_DMMHIDE = .NPPMSG + 31;

//void NPPM_DMMUPDATEDISPINFO(0, (*npp_api.powereditor.wincontrols.dockingwnd.docking.tTbData).hClient)
enum NPPM_DMMUPDATEDISPINFO = .NPPMSG + 32;

//void NPPM_DMMREGASDCKDLG(0, &npp_api.powereditor.wincontrols.dockingwnd.docking.tTbData)
enum NPPM_DMMREGASDCKDLG = .NPPMSG + 33;

//void NPPM_LOADSESSION(0, scope const core.sys.windows.winnt.WCHAR* file name)
enum NPPM_LOADSESSION = .NPPMSG + 34;

//void WM_DMM_VIEWOTHERTAB(0, (*npp_api.powereditor.wincontrols.dockingwnd.docking.tTbData).pszName)
enum NPPM_DMMVIEWOTHERTAB = .NPPMSG + 35;

//core.sys.windows.windef.BOOL NPPM_RELOADFILE(core.sys.windows.windef.BOOL withAlert, core.sys.windows.winnt.WCHAR* filePathName2Reload)
enum NPPM_RELOADFILE = .NPPMSG + 36;

//core.sys.windows.windef.BOOL NPPM_SWITCHTOFILE(0, core.sys.windows.winnt.WCHAR* filePathName2switch)
enum NPPM_SWITCHTOFILE = .NPPMSG + 37;

//core.sys.windows.windef.BOOL NPPM_SAVECURRENTFILE(0, 0)
enum NPPM_SAVECURRENTFILE = .NPPMSG + 38;

//core.sys.windows.windef.BOOL NPPM_SAVEALLFILES(0, 0)
enum NPPM_SAVEALLFILES = .NPPMSG + 39;

//void WM_PIMENU_CHECK(core.sys.windows.windef.UINT .funcItem[X]._cmdID, core.sys.windows.windef.TRUE/core.sys.windows.windef.FALSE)
enum NPPM_SETMENUITEMCHECK = .NPPMSG + 40;

//void WM_ADDTOOLBARICON(core.sys.windows.windef.UINT .funcItem[X]._cmdID, .toolbarIcons icon)
enum NPPM_ADDTOOLBARICON = .NPPMSG + 41;

struct toolbarIcons
{
	static import core.sys.windows.windef;

	core.sys.windows.windef.HBITMAP hToolbarBmp;
	core.sys.windows.windef.HICON hToolbarIcon;
}

//.winVer NPPM_GETWINDOWSVERSION(0, 0)
enum NPPM_GETWINDOWSVERSION = .NPPMSG + 42;

//core.sys.windows.windef.HWND WM_DMM_GETPLUGINHWNDBYNAME(scope const core.sys.windows.winnt.WCHAR* windowName, scope const core.sys.windows.winnt.WCHAR* moduleName)
// if moduleName is core.sys.windows.windef.NULL, then return value is core.sys.windows.windef.NULL
// if windowName is core.sys.windows.windef.NULL, then the first found window handle which matches with the moduleName will be returned
enum NPPM_DMMGETPLUGINHWNDBYNAME = .NPPMSG + 43;

//core.sys.windows.windef.BOOL NPPM_MAKECURRENTBUFFERDIRTY(0, 0)
enum NPPM_MAKECURRENTBUFFERDIRTY = .NPPMSG + 44;

//core.sys.windows.windef.BOOL NPPM_GETENABLETHEMETEXTUREFUNC(0, 0)
enum NPPM_GETENABLETHEMETEXTUREFUNC = .NPPMSG + 45;

//core.sys.windows.windef.IN NPPM_GETPLUGINSCONFIGDIR(int strLen, core.sys.windows.winnt.WCHAR* str)
// Get user's plugin config directory path. It's useful if plugins want to save/load parameters for the current user
// Returns the number of TCHAR copied/to copy.
// Users should call it with "str" be NULL to get the required number of TCHAR (not including the terminating nul character),
// allocate "str" buffer with the return value + 1, then call it again to get the path.
enum NPPM_GETPLUGINSCONFIGDIR = .NPPMSG + 46;

//core.sys.windows.windef.BOOL NPPM_MSGTOPLUGIN(core.sys.windows.winnt.WCHAR* destModuleName, CommunicationInfo* info)
// return value is core.sys.windows.windef.TRUE when the message arrive to the destination plugins.
// if destModule or info is core.sys.windows.windef.NULL, then return value is core.sys.windows.windef.FALSE
enum NPPM_MSGTOPLUGIN = .NPPMSG + 47;
struct CommunicationInfo
{
	static import core.sys.windows.winnt;

	core.stdc.config.c_long internalMsg;
	const (core.sys.windows.winnt.WCHAR)* srcModuleName;

	/**
	 * defined by plugin
	 */
	void* info;
}

//void NPPM_MENUCOMMAND(0, int cmdID)
// uncomment //private static import npp_api.powereditor.menucmdid;
// in the beginning of this file then use the command symbols defined in "menuCmdID.h" file
// to access all the Notepad++ menu command items
enum NPPM_MENUCOMMAND = .NPPMSG + 48;

//void NPPM_TRIGGERTABBARCONTEXTMENU(int view, int index2Activate)
enum NPPM_TRIGGERTABBARCONTEXTMENU = .NPPMSG + 49;

// int NPPM_GETNPPVERSION(0, 0)
// return version
// ex : v4.6
// core.sys.windows.windef.HIWORD(version) == 4
// core.sys.windows.windef.LOWORD(version) == 6
enum NPPM_GETNPPVERSION = .NPPMSG + 50;

// core.sys.windows.windef.BOOL NPPM_HIDETABBAR(0, core.sys.windows.windef.BOOL hideOrNot)
// if hideOrNot is set as core.sys.windows.windef.TRUE then tab bar will be hidden
// otherwise it'll be shown.
// return value : the old status value
enum NPPM_HIDETABBAR = .NPPMSG + 51;

// core.sys.windows.windef.BOOL NPPM_ISTABBARHIDDEN(0, 0)
// returned value : core.sys.windows.windef.TRUE if tab bar is hidden, otherwise core.sys.windows.windef.FALSE
enum NPPM_ISTABBARHIDDEN = .NPPMSG + 52;

// core.sys.windows.windef.INT NPPM_GETPOSFROMBUFFERID(core.sys.windows.basetsd.UINT_PTR bufferID, core.sys.windows.windef.INT priorityView)
// Return VIEW|INDEX from a buffer ID. -1 if the bufferID non existing
// if priorityView set to SUB_VIEW, then SUB_VIEW will be search firstly
//
// VIEW takes 2 highest bits and INDEX (0 based) takes the rest (30 bits)
// Here's the values for the view :
//  MAIN_VIEW 0
//  SUB_VIEW  1
enum NPPM_GETPOSFROMBUFFERID = .NPPMSG + 57;

// core.sys.windows.windef.INT NPPM_GETFULLPATHFROMBUFFERID(core.sys.windows.basetsd.UINT_PTR bufferID, core.sys.windows.winnt.WCHAR* fullFilePath)
// Get full path file name from a bufferID.
// Return -1 if the bufferID non existing, otherwise the number of core.sys.windows.winnt.WCHAR copied/to copy
// User should call it with fullFilePath be core.sys.windows.windef.NULL to get the number of core.sys.windows.winnt.WCHAR (not including the nul character),
// allocate fullFilePath with the return values + 1, then call it again to get full path file name
enum NPPM_GETFULLPATHFROMBUFFERID = .NPPMSG + 58;

// core.sys.windows.windef.LRESULT NPPM_GETBUFFERIDFROMPOS(core.sys.windows.windef.INT index, core.sys.windows.windef.INT iView)
// wParam: Position of document
// lParam: View to use, 0 = Main, 1 = Secondary
// Returns 0 if invalid
enum NPPM_GETBUFFERIDFROMPOS = .NPPMSG + 59;

// core.sys.windows.windef.LRESULT NPPM_GETCURRENTBUFFERID(0, 0)
// Returns active Buffer
enum NPPM_GETCURRENTBUFFERID = .NPPMSG + 60;

// core.sys.windows.winnt.VOID NPPM_RELOADBUFFERID(core.sys.windows.basetsd.UINT_PTR bufferID, core.sys.windows.windef.BOOL alert)
// Reloads Buffer
// wParam: Buffer to reload
// lParam: 0 if no alert, else alert
enum NPPM_RELOADBUFFERID = .NPPMSG + 61;

// core.sys.windows.windef.INT NPPM_GETBUFFERLANGTYPE(core.sys.windows.basetsd.UINT_PTR bufferID, 0)
// wParam: BufferID to get LangType from
// lParam: 0
// Returns as int, see LangType. -1 on error
enum NPPM_GETBUFFERLANGTYPE = .NPPMSG + 64;

// core.sys.windows.windef.BOOL NPPM_SETBUFFERLANGTYPE(core.sys.windows.basetsd.UINT_PTR bufferID, core.sys.windows.windef.INT langType)
// wParam: BufferID to set LangType of
// lParam: LangType
// Returns core.sys.windows.windef.TRUE on success, core.sys.windows.windef.FALSE otherwise
// use int, see LangType for possible values
// L_USER and L_EXTERNAL are not supported
enum NPPM_SETBUFFERLANGTYPE = .NPPMSG + 65;

// core.sys.windows.windef.INT NPPM_GETBUFFERENCODING(core.sys.windows.basetsd.UINT_PTR bufferID, 0)
// wParam: BufferID to get encoding from
// lParam: 0
// returns as int, see UniMode. -1 on error
enum NPPM_GETBUFFERENCODING = .NPPMSG + 66;

// core.sys.windows.windef.BOOL NPPM_SETBUFFERENCODING(core.sys.windows.basetsd.UINT_PTR bufferID, core.sys.windows.windef.INT encoding)
// wParam: BufferID to set encoding of
// lParam: encoding
// Returns core.sys.windows.windef.TRUE on success, core.sys.windows.windef.FALSE otherwise
// use int, see UniMode
// Can only be done on new, unedited files
enum NPPM_SETBUFFERENCODING = .NPPMSG + 67;

// core.sys.windows.windef.INT NPPM_GETBUFFERFORMAT(core.sys.windows.basetsd.UINT_PTR bufferID, 0)
// wParam: BufferID to get EolType format from
// lParam: 0
// returns as int, see EolType format. -1 on error
enum NPPM_GETBUFFERFORMAT = .NPPMSG + 68;

// core.sys.windows.windef.BOOL NPPM_SETBUFFERFORMAT(core.sys.windows.basetsd.UINT_PTR bufferID, core.sys.windows.windef.INT format)
// wParam: BufferID to set EolType format of
// lParam: format
// Returns core.sys.windows.windef.TRUE on success, core.sys.windows.windef.FALSE otherwise
// use int, see EolType format
enum NPPM_SETBUFFERFORMAT = .NPPMSG + 69;

// core.sys.windows.windef.BOOL NPPM_HIDETOOLBAR(0, core.sys.windows.windef.BOOL hideOrNot)
// if hideOrNot is set as core.sys.windows.windef.TRUE then tool bar will be hidden
// otherwise it'll be shown.
// return value : the old status value
enum NPPM_HIDETOOLBAR = .NPPMSG + 70;

// core.sys.windows.windef.BOOL NPPM_ISTOOLBARHIDDEN(0, 0)
// returned value : core.sys.windows.windef.TRUE if tool bar is hidden, otherwise core.sys.windows.windef.FALSE
enum NPPM_ISTOOLBARHIDDEN = .NPPMSG + 71;

// core.sys.windows.windef.BOOL NPPM_HIDEMENU(0, core.sys.windows.windef.BOOL hideOrNot)
// if hideOrNot is set as core.sys.windows.windef.TRUE then menu will be hidden
// otherwise it'll be shown.
// return value : the old status value
enum NPPM_HIDEMENU = .NPPMSG + 72;

// core.sys.windows.windef.BOOL NPPM_ISMENUHIDDEN(0, 0)
// returned value : core.sys.windows.windef.TRUE if menu is hidden, otherwise core.sys.windows.windef.FALSE
enum NPPM_ISMENUHIDDEN = .NPPMSG + 73;

// core.sys.windows.windef.BOOL NPPM_HIDESTATUSBAR(0, core.sys.windows.windef.BOOL hideOrNot)
// if hideOrNot is set as core.sys.windows.windef.TRUE then STATUSBAR will be hidden
// otherwise it'll be shown.
// return value : the old status value
enum NPPM_HIDESTATUSBAR = .NPPMSG + 74;

// core.sys.windows.windef.BOOL NPPM_ISSTATUSBARHIDDEN(0, 0)
// returned value : core.sys.windows.windef.TRUE if STATUSBAR is hidden, otherwise core.sys.windows.windef.FALSE
enum NPPM_ISSTATUSBARHIDDEN = .NPPMSG + 75;

// core.sys.windows.windef.BOOL NPPM_GETSHORTCUTBYCMDID(int cmdID, ShortcutKey* sk)
// get your plugin command current mapped shortcut into sk via cmdID
// You may need it after getting NPPN_READY notification
// returned value : core.sys.windows.windef.TRUE if this function call is successful and shortcut is enable, otherwise core.sys.windows.windef.FALSE
enum NPPM_GETSHORTCUTBYCMDID = .NPPMSG + 76;

// core.sys.windows.windef.BOOL NPPM_DOOPEN(0, scope const core.sys.windows.winnt.WCHAR* fullPathName2Open)
// fullPathName2Open indicates the full file path name to be opened.
// The return value is core.sys.windows.windef.TRUE (1) if the operation is successful, otherwise core.sys.windows.windef.FALSE (0).
enum NPPM_DOOPEN = .NPPMSG + 77;

// core.sys.windows.windef.BOOL NPPM_SAVECURRENTFILEAS (core.sys.windows.windef.BOOL asCopy, scope const core.sys.windows.winnt.WCHAR* filename)
enum NPPM_SAVECURRENTFILEAS = .NPPMSG + 78;

// core.sys.windows.windef.INT NPPM_GETCURRENTNATIVELANGENCODING(0, 0)
// returned value : the current native language encoding
enum NPPM_GETCURRENTNATIVELANGENCODING = .NPPMSG + 79;

// returns core.sys.windows.windef.TRUE if NPPM_ALLOCATECMDID is supported
// Use to identify if subclassing is necessary
enum NPPM_ALLOCATESUPPORTED = .NPPMSG + 80;

// core.sys.windows.windef.BOOL NPPM_ALLOCATECMDID(int numberRequested, int* startNumber)
// sets startNumber to the initial command ID if successful
// Returns: core.sys.windows.windef.TRUE if successful, core.sys.windows.windef.FALSE otherwise. startNumber will also be set to 0 if unsuccessful
enum NPPM_ALLOCATECMDID = .NPPMSG + 81;

// core.sys.windows.windef.BOOL NPPM_ALLOCATEMARKER(int numberRequested, int* startNumber)
// sets startNumber to the initial command ID if successful
// Allocates a marker number to a plugin
// Returns: core.sys.windows.windef.TRUE if successful, core.sys.windows.windef.FALSE otherwise. startNumber will also be set to 0 if unsuccessful
enum NPPM_ALLOCATEMARKER = .NPPMSG + 82;

// core.sys.windows.windef.INT NPPM_GETLANGUAGENAME(int langType, core.sys.windows.winnt.WCHAR* langName)
// Get programming language name from the given language type (LangType)
// Return value is the number of copied character / number of character to copy (\0 is not included)
// You should call this function 2 times - the first time you pass langName as core.sys.windows.windef.NULL to get the number of characters to copy.
// You allocate a buffer of the length of (the number of characters + 1) then call NPPM_GETLANGUAGENAME function the 2nd time
// by passing allocated buffer as argument langName
enum NPPM_GETLANGUAGENAME = .NPPMSG + 83;

// core.sys.windows.windef.INT NPPM_GETLANGUAGEDESC(int langType, core.sys.windows.winnt.WCHAR* langDesc)
// Get programming language short description from the given language type (LangType)
// Return value is the number of copied character / number of character to copy (\0 is not included)
// You should call this function 2 times - the first time you pass langDesc as core.sys.windows.windef.NULL to get the number of characters to copy.
// You allocate a buffer of the length of (the number of characters + 1) then call NPPM_GETLANGUAGEDESC function the 2nd time
// by passing allocated buffer as argument langDesc
enum NPPM_GETLANGUAGEDESC = .NPPMSG + 84;

// core.sys.windows.winnt.VOID NPPM_ISDOCSWITCHERSHOWN(0, core.sys.windows.windef.BOOL toShowOrNot)
// Send this message to show or hide doc switcher.
// if toShowOrNot is core.sys.windows.windef.TRUE then show doc switcher, otherwise hide it.
enum NPPM_SHOWDOCSWITCHER = .NPPMSG + 85;

// core.sys.windows.windef.BOOL NPPM_ISDOCSWITCHERSHOWN(0, 0)
// Check to see if doc switcher is shown.
enum NPPM_ISDOCSWITCHERSHOWN = .NPPMSG + 86;

// core.sys.windows.windef.BOOL NPPM_GETAPPDATAPLUGINSALLOWED(0, 0)
// Check to see if loading plugins from "%APPDATA%\..\Local\Notepad++\plugins" is allowed.
enum NPPM_GETAPPDATAPLUGINSALLOWED = .NPPMSG + 87;

// core.sys.windows.windef.INT NPPM_GETCURRENTVIEW(0, 0)
// Return: current edit view of Notepad++. Only 2 possible values: 0 = Main, 1 = Secondary
enum NPPM_GETCURRENTVIEW = .NPPMSG + 88;

// core.sys.windows.winnt.VOID NPPM_DOCSWITCHERDISABLECOLUMN(0, core.sys.windows.windef.BOOL disableOrNot)
// Disable or enable extension column of doc switcher
enum NPPM_DOCSWITCHERDISABLECOLUMN = .NPPMSG + 89;

// core.sys.windows.windef.INT NPPM_GETEDITORDEFAULTFOREGROUNDCOLOR(0, 0)
// Return: current editor default foreground color. You should convert the returned value in core.sys.windows.windef.COLORREF
enum NPPM_GETEDITORDEFAULTFOREGROUNDCOLOR = .NPPMSG + 90;

// core.sys.windows.windef.INT NPPM_GETEDITORDEFAULTBACKGROUNDCOLOR(0, 0)
// Return: current editor default background color. You should convert the returned value in core.sys.windows.windef.COLORREF
enum NPPM_GETEDITORDEFAULTBACKGROUNDCOLOR = .NPPMSG + 91;

// core.sys.windows.winnt.VOID NPPM_SETSMOOTHFONT(0, core.sys.windows.windef.BOOL setSmoothFontOrNot)
enum NPPM_SETSMOOTHFONT = .NPPMSG + 92;

// core.sys.windows.winnt.VOID NPPM_SETEDITORBORDEREDGE(0, core.sys.windows.windef.BOOL withEditorBorderEdgeOrNot)
enum NPPM_SETEDITORBORDEREDGE = .NPPMSG + 93;

// core.sys.windows.winnt.VOID NPPM_SAVEFILE(0, scope const core.sys.windows.winnt.WCHAR* fileNameToSave)
enum NPPM_SAVEFILE = .NPPMSG + 94;

// 2119 in decimal
// core.sys.windows.winnt.VOID NPPM_DISABLEAUTOUPDATE(0, 0)
enum NPPM_DISABLEAUTOUPDATE = .NPPMSG + 95;

// 2120 in decimal
enum NPPM_REMOVESHORTCUTBYCMDID = .NPPMSG + 96;

// core.sys.windows.windef.BOOL NPPM_REMOVESHORTCUTASSIGNMENT(int cmdID)
// removes the assigned shortcut mapped to cmdID
// returned value : TRUE if function call is successful, otherwise FALSE

// core.sys.windows.windef.INT NPPM_GETPLUGINHOMEPATH(size_t strLen, TCHAR *pluginRootPath)
// Get plugin home root path. It's useful if plugins want to get its own path
// by appending <pluginFolderName> which is the name of plugin without extension part.
// Returns the number of TCHAR copied/to copy.
// Users should call it with pluginRootPath be NULL to get the required number of TCHAR (not including the terminating nul character),
// allocate pluginRootPath buffer with the return value + 1, then call it again to get the path.
enum NPPM_GETPLUGINHOMEPATH = .NPPMSG + 97;

// core.sys.windows.windef.BOOL NPPM_GETXXXXXXXXXXXXXXXX(size_t strLen, core.sys.windows.winnt.WCHAR* str)
// where str is the allocated core.sys.windows.winnt.WCHAR array,
// strLen is the allocated array size
// The return value is core.sys.windows.windef.TRUE when get generic_string operation success
// Otherwise (allocated array size is too core.sys.windows.rpcndr.small) core.sys.windows.windef.FALSE
enum RUNCOMMAND_USER = core.sys.windows.winuser.WM_USER + 3000;
enum NPPM_GETFULLCURRENTPATH = .RUNCOMMAND_USER + .FULL_CURRENT_PATH;
enum NPPM_GETCURRENTDIRECTORY = .RUNCOMMAND_USER + .CURRENT_DIRECTORY;
enum NPPM_GETFILENAME = .RUNCOMMAND_USER + .FILE_NAME;
enum NPPM_GETNAMEPART = .RUNCOMMAND_USER + .NAME_PART;
enum NPPM_GETEXTPART = .RUNCOMMAND_USER + .EXT_PART;
enum NPPM_GETCURRENTWORD = .RUNCOMMAND_USER + .CURRENT_WORD;
enum NPPM_GETNPPDIRECTORY = .RUNCOMMAND_USER + .NPP_DIRECTORY;
enum NPPM_GETFILENAMEATCURSOR = .RUNCOMMAND_USER + .GETFILENAMEATCURSOR;

// core.sys.windows.windef.INT NPPM_GETCURRENTLINE(0, 0)
// return the caret current position line
enum NPPM_GETCURRENTLINE = .RUNCOMMAND_USER + .CURRENT_LINE;

// core.sys.windows.windef.INT NPPM_GETCURRENTCOLUMN(0, 0)
// return the caret current position column
enum NPPM_GETCURRENTCOLUMN = .RUNCOMMAND_USER + .CURRENT_COLUMN;

enum NPPM_GETNPPFULLFILEPATH = .RUNCOMMAND_USER + .NPP_FULL_FILE_PATH;

enum VAR_NOT_RECOGNIZED = 0;
enum FULL_CURRENT_PATH = 1;
enum CURRENT_DIRECTORY = 2;
enum FILE_NAME = 3;
enum NAME_PART = 4;
enum EXT_PART = 5;
enum CURRENT_WORD = 6;
enum NPP_DIRECTORY = 7;
enum CURRENT_LINE = 8;
enum CURRENT_COLUMN = 9;
enum NPP_FULL_FILE_PATH = 10;
enum GETFILENAMEATCURSOR = 11;

// Notification code
enum NPPN_FIRST = 1000;

// To notify plugins that all the procedures of launchment of notepad++ are done.
//(*scnNotification).nmhdr.code = .NPPN_READY;
//(*scnNotification).nmhdr.hwndFrom = hwndNpp;
//(*scnNotification).nmhdr.idFrom = 0;
enum NPPN_READY = .NPPN_FIRST + 1;

// To notify plugins that toolbar icons can be registered
//(*scnNotification).nmhdr.code = NPPN_TB_MODIFICATION;
//(*scnNotification).nmhdr.hwndFrom = hwndNpp;
//(*scnNotification).nmhdr.idFrom = 0;
enum NPPN_TBMODIFICATION = .NPPN_FIRST + 2;

// To notify plugins that the current file is about to be closed
//(*scnNotification).nmhdr.code = .NPPN_FILEBEFORECLOSE;
//(*scnNotification).nmhdr.hwndFrom = hwndNpp;
//(*scnNotification).nmhdr.idFrom = BufferID;
enum NPPN_FILEBEFORECLOSE = .NPPN_FIRST + 3;

// To notify plugins that the current file is just opened
//(*scnNotification).nmhdr.code = .NPPN_FILEOPENED;
//(*scnNotification).nmhdr.hwndFrom = hwndNpp;
//(*scnNotification).nmhdr.idFrom = BufferID;
enum NPPN_FILEOPENED = .NPPN_FIRST + 4;

// To notify plugins that the current file is just closed
//(*scnNotification).nmhdr.code = .NPPN_FILECLOSED;
//(*scnNotification).nmhdr.hwndFrom = hwndNpp;
//(*scnNotification).nmhdr.idFrom = BufferID;
enum NPPN_FILECLOSED = .NPPN_FIRST + 5;

// To notify plugins that the current file is about to be opened
//(*scnNotification).nmhdr.code = .NPPN_FILEBEFOREOPEN;
//(*scnNotification).nmhdr.hwndFrom = hwndNpp;
//(*scnNotification).nmhdr.idFrom = BufferID;
enum NPPN_FILEBEFOREOPEN = .NPPN_FIRST + 6;

// To notify plugins that the current file is about to be saved
//(*scnNotification).nmhdr.code = .NPPN_FILEBEFOREOPEN;
//(*scnNotification).nmhdr.hwndFrom = hwndNpp;
//(*scnNotification).nmhdr.idFrom = BufferID;
enum NPPN_FILEBEFORESAVE = .NPPN_FIRST + 7;

// To notify plugins that the current file is just saved
//(*scnNotification).nmhdr.code = .NPPN_FILESAVED;
//(*scnNotification).nmhdr.hwndFrom = hwndNpp;
//(*scnNotification).nmhdr.idFrom = BufferID;
enum NPPN_FILESAVED = .NPPN_FIRST + 8;

// To notify plugins that Notepad++ is about to be shutdowned.
//(*scnNotification).nmhdr.code = .NPPN_SHUTDOWN;
//(*scnNotification).nmhdr.hwndFrom = hwndNpp;
//(*scnNotification).nmhdr.idFrom = 0;
enum NPPN_SHUTDOWN = .NPPN_FIRST + 9;

// To notify plugins that a buffer was activated (put to foreground).
//(*scnNotification).nmhdr.code = .NPPN_BUFFERACTIVATED;
//(*scnNotification).nmhdr.hwndFrom = hwndNpp;
//(*scnNotification).nmhdr.idFrom = activatedBufferID;
enum NPPN_BUFFERACTIVATED = .NPPN_FIRST + 10;

// To notify plugins that the language in the current doc is just changed.
//(*scnNotification).nmhdr.code = .NPPN_LANGCHANGED;
//(*scnNotification).nmhdr.hwndFrom = hwndNpp;
//(*scnNotification).nmhdr.idFrom = currentBufferID;
enum NPPN_LANGCHANGED = .NPPN_FIRST + 11;

// To notify plugins that user initiated a WordStyleDlg change.
//(*scnNotification).nmhdr.code = .NPPN_WORDSTYLESUPDATED;
//(*scnNotification).nmhdr.hwndFrom = hwndNpp;
//(*scnNotification).nmhdr.idFrom = currentBufferID;
enum NPPN_WORDSTYLESUPDATED = .NPPN_FIRST + 12;

// To notify plugins that plugin command shortcut is remapped.
//(*scnNotification).nmhdr.code = NPPN_SHORTCUTSREMAPPED;
//(*scnNotification).nmhdr.hwndFrom = ShortcutKeyStructurePointer;
//(*scnNotification).nmhdr.idFrom = cmdID;
//where ShortcutKeyStructurePointer is pointer of struct ShortcutKey:
//struct ShortcutKey {
//	bool _isCtrl;
//	bool _isAlt;
//	bool _isShift;
//	core.sys.windows.winnt.UCHAR _key;
//}
enum NPPN_SHORTCUTREMAPPED = .NPPN_FIRST + 13;

// To notify plugins that the current file is about to be loaded
//(*scnNotification).nmhdr.code = .NPPN_FILEBEFOREOPEN;
//(*scnNotification).nmhdr.hwndFrom = hwndNpp;
//(*scnNotification).nmhdr.idFrom = core.sys.windows.windef.NULL;
enum NPPN_FILEBEFORELOAD = .NPPN_FIRST + 14;

// To notify plugins that file open operation failed
//(*scnNotification).nmhdr.code = NPPN_FILEOPENFAILED;
//(*scnNotification).nmhdr.hwndFrom = hwndNpp;
//(*scnNotification).nmhdr.idFrom = BufferID;
enum NPPN_FILELOADFAILED = .NPPN_FIRST + 15;

// To notify plugins that current document change the readonly status,
//(*scnNotification).nmhdr.code = .NPPN_READONLYCHANGED;
//(*scnNotification).nmhdr.hwndFrom = bufferID;
//(*scnNotification).nmhdr.idFrom = docStatus;
// where bufferID is BufferID
//       docStatus can be combined by DOCSTATUS_READONLY and DOCSTATUS_BUFFERDIRTY
enum NPPN_READONLYCHANGED = .NPPN_FIRST + 16;

enum DOCSTATUS_READONLY = 1;
enum DOCSTATUS_BUFFERDIRTY = 2;

// To notify plugins that document order is changed
//(*scnNotification).nmhdr.code = .NPPN_DOCORDERCHANGED;
//(*scnNotification).nmhdr.hwndFrom = newIndex;
//(*scnNotification).nmhdr.idFrom = BufferID;
enum NPPN_DOCORDERCHANGED = .NPPN_FIRST + 17;

// To notify plugins that a snapshot dirty file is loaded on startup
//(*scnNotification).nmhdr.code = NPPN_SNAPSHOTDIRTYFILELOADED;
//(*scnNotification).nmhdr.hwndFrom = core.sys.windows.windef.NULL;
//(*scnNotification).nmhdr.idFrom = BufferID;
enum NPPN_SNAPSHOTDIRTYFILELOADED = .NPPN_FIRST + 18;

// To notify plugins that Npp shutdown has been triggered, files have not been closed yet
//(*scnNotification).nmhdr.code = NPPN_BEFORESHUTDOWN;
//(*scnNotification).nmhdr.hwndFrom = hwndNpp;
//(*scnNotification).nmhdr.idFrom = 0;
enum NPPN_BEFORESHUTDOWN = .NPPN_FIRST + 19;

// To notify plugins that Npp shutdown has been cancelled
//(*scnNotification).nmhdr.code = NPPN_CANCELSHUTDOWN;
//(*scnNotification).nmhdr.hwndFrom = hwndNpp;
//(*scnNotification).nmhdr.idFrom = 0;
enum NPPN_CANCELSHUTDOWN = .NPPN_FIRST + 20;

// To notify plugins that file is to be renamed
//(*scnNotification).nmhdr.code = NPPN_FILEBEFORERENAME;
//(*scnNotification).nmhdr.hwndFrom = hwndNpp;
//(*scnNotification).nmhdr.idFrom = BufferID;
enum NPPN_FILEBEFORERENAME = .NPPN_FIRST + 21;

// To notify plugins that file rename has been cancelled
//(*scnNotification).nmhdr.code = NPPN_FILERENAMECANCEL;
//(*scnNotification).nmhdr.hwndFrom = hwndNpp;
//(*scnNotification).nmhdr.idFrom = BufferID;
enum NPPN_FILERENAMECANCEL = .NPPN_FIRST + 22;

// To notify plugins that file has been renamed
//(*scnNotification).nmhdr.code = NPPN_FILERENAMED;
//(*scnNotification).nmhdr.hwndFrom = hwndNpp;
//(*scnNotification).nmhdr.idFrom = BufferID;
enum NPPN_FILERENAMED = .NPPN_FIRST + 23;

// To notify plugins that file is to be deleted
//(*scnNotification).nmhdr.code = NPPN_FILEBEFOREDELETE;
//(*scnNotification).nmhdr.hwndFrom = hwndNpp;
//(*scnNotification).nmhdr.idFrom = BufferID;
enum NPPN_FILEBEFOREDELETE = .NPPN_FIRST + 24;

// To notify plugins that file deletion has failed
//(*scnNotification).nmhdr.code = NPPN_FILEDELETEFAILED;
//(*scnNotification).nmhdr.hwndFrom = hwndNpp;
//(*scnNotification).nmhdr.idFrom = BufferID;
enum NPPN_FILEDELETEFAILED = .NPPN_FIRST + 25;

// To notify plugins that file has been deleted
//(*scnNotification).nmhdr.code = NPPN_FILEDELETED;
//(*scnNotification).nmhdr.hwndFrom = hwndNpp;
//(*scnNotification).nmhdr.idFrom = BufferID;
enum NPPN_FILEDELETED = .NPPN_FIRST + 26;
