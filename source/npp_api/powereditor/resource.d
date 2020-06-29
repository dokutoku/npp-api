// This file is part of Notepad++ project
// Copyright (C)2020 Don HO <don.h@free.fr>
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
module npp_api.powereditor.resource;


version (Windows):

private static import core.sys.windows.winuser;
private static import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;

enum NOTEPAD_PLUS_VERSION = "Notepad++ v7.8.7";

// should be X.Y : ie. if VERSION_DIGITALVALUE == 4, 7, 1, 0 , then X = 4, Y = 71
// ex : #define VERSION_VALUE TEXT("5.63\0")
enum VERSION_VALUE = "7.87\0";
//#define VERSION_DIGITALVALUE 7, 8, 7, 0

//#ifndef IDC_STATIC
	enum IDC_STATIC = -1;
//#endif

enum IDI_M30ICON = 100;
enum IDI_CHAMELEON = 101;
//enum IDI_JESUISCHARLIE = 102;
//enum IDI_GILETJAUNE = 102;
//enum IDI_SAMESEXMARRIAGE = 102;
enum IDR_RT_MANIFEST = 103;

enum IDI_NEW_OFF_ICON = 201;
enum IDI_OPEN_OFF_ICON = 202;
enum IDI_CLOSE_OFF_ICON = 203;
enum IDI_CLOSEALL_OFF_ICON = 204;
enum IDI_SAVE_OFF_ICON = 205;
enum IDI_SAVEALL_OFF_ICON = 206;
enum IDI_CUT_OFF_ICON = 207;
enum IDI_COPY_OFF_ICON = 208;
enum IDI_PASTE_OFF_ICON = 209;
enum IDI_UNDO_OFF_ICON = 210;
enum IDI_REDO_OFF_ICON = 211;
enum IDI_FIND_OFF_ICON = 212;
enum IDI_REPLACE_OFF_ICON = 213;
enum IDI_ZOOMIN_OFF_ICON = 214;
enum IDI_ZOOMOUT_OFF_ICON = 215;
enum IDI_VIEW_UD_DLG_OFF_ICON = 216;
enum IDI_PRINT_OFF_ICON = 217;
enum IDI_VIEW_ALL_CHAR_ON_ICON = 218;
enum IDI_VIEW_INDENT_ON_ICON = 219;
enum IDI_VIEW_WRAP_ON_ICON = 220;


enum IDI_STARTRECORD_OFF_ICON = 221;
enum IDI_STARTRECORD_ON_ICON = 222;
enum IDI_STARTRECORD_DISABLE_ICON = 223;
enum IDI_STOPRECORD_OFF_ICON = 224;
enum IDI_STOPRECORD_ON_ICON = 225;
enum IDI_STOPRECORD_DISABLE_ICON = 226;
enum IDI_PLAYRECORD_OFF_ICON = 227;
enum IDI_PLAYRECORD_ON_ICON = 228;
enum IDI_PLAYRECORD_DISABLE_ICON = 229;
enum IDI_SAVERECORD_OFF_ICON = 230;
enum IDI_SAVERECORD_ON_ICON = 231;
enum IDI_SAVERECORD_DISABLE_ICON = 232;

// multi run macro
enum IDI_MMPLAY_DIS_ICON = 233;
enum IDI_MMPLAY_OFF_ICON = 234;
enum IDI_MMPLAY_ON_ICON = 235;

enum IDI_NEW_ON_ICON = 301;
enum IDI_OPEN_ON_ICON = 302;
enum IDI_CLOSE_ON_ICON = 303;
enum IDI_CLOSEALL_ON_ICON = 304;
enum IDI_SAVE_ON_ICON = 305;
enum IDI_SAVEALL_ON_ICON = 306;
enum IDI_CUT_ON_ICON = 307;
enum IDI_COPY_ON_ICON = 308;
enum IDI_PASTE_ON_ICON = 309;
enum IDI_UNDO_ON_ICON = 310;
enum IDI_REDO_ON_ICON = 311;
enum IDI_FIND_ON_ICON = 312;
enum IDI_REPLACE_ON_ICON = 313;
enum IDI_ZOOMIN_ON_ICON = 314;
enum IDI_ZOOMOUT_ON_ICON = 315;
enum IDI_VIEW_UD_DLG_ON_ICON = 316;
enum IDI_PRINT_ON_ICON = 317;
enum IDI_VIEW_ALL_CHAR_OFF_ICON = 318;
enum IDI_VIEW_INDENT_OFF_ICON = 319;
enum IDI_VIEW_WRAP_OFF_ICON = 320;

//enum IDI_NEW_DISABLE_ICON = 401;
//enum IDI_OPEN_ON_ICON = 402;
enum IDI_SAVE_DISABLE_ICON = 403;
enum IDI_SAVEALL_DISABLE_ICON = 404;
//enum IDI_CLOSE_ON_ICON = 405;
//enum IDI_CLOSEALL_ON_ICON = 406;
enum IDI_CUT_DISABLE_ICON = 407;
enum IDI_COPY_DISABLE_ICON = 408;
enum IDI_PASTE_DISABLE_ICON = 409;
enum IDI_UNDO_DISABLE_ICON = 410;
enum IDI_REDO_DISABLE_ICON = 411;
enum IDI_DELETE_ICON = 412;

enum IDI_SYNCV_OFF_ICON = 413;
enum IDI_SYNCV_ON_ICON = 414;
enum IDI_SYNCV_DISABLE_ICON = 415;

enum IDI_SYNCH_OFF_ICON = 416;
enum IDI_SYNCH_ON_ICON = 417;
enum IDI_SYNCH_DISABLE_ICON = 418;

enum IDI_SAVED_ICON = 501;
enum IDI_UNSAVED_ICON = 502;
enum IDI_READONLY_ICON = 503;
enum IDI_FIND_RESULT_ICON = 504;
enum IDI_MONITORING_ICON = 505;

enum IDI_PROJECT_WORKSPACE = 601;
enum IDI_PROJECT_WORKSPACEDIRTY = 602;
enum IDI_PROJECT_PROJECT = 603;
enum IDI_PROJECT_FOLDEROPEN = 604;
enum IDI_PROJECT_FOLDERCLOSE = 605;
enum IDI_PROJECT_FILE = 606;
enum IDI_PROJECT_FILEINVALID = 607;
enum IDI_FB_ROOTOPEN = 608;
enum IDI_FB_ROOTCLOSE = 609;
enum IDI_FB_SELECTCURRENTFILE = 610;
enum IDI_FB_FOLDALL = 611;
enum IDI_FB_EXPANDALL = 612;

enum IDI_FUNCLIST_ROOT = 620;
enum IDI_FUNCLIST_NODE = 621;
enum IDI_FUNCLIST_LEAF = 622;

enum IDI_FUNCLIST_SORTBUTTON = 631;
enum IDI_FUNCLIST_RELOADBUTTON = 632;

enum IDI_VIEW_DOC_MAP_ON_ICON = 633;
enum IDI_VIEW_DOC_MAP_OFF_ICON = 634;
enum IDI_VIEW_FILEBROWSER_ON_ICON = 635;
enum IDI_VIEW_FILEBROWSER_OFF_ICON = 636;
enum IDI_VIEW_FUNCLIST_ON_ICON = 637;
enum IDI_VIEW_FUNCLIST_OFF_ICON = 638;
enum IDI_VIEW_MONITORING_ON_ICON = 639;
enum IDI_VIEW_MONITORING_OFF_ICON = 640;

enum IDC_MY_CUR = 1402;
enum IDC_UP_ARROW = 1403;
enum IDC_DRAG_TAB = 1404;
enum IDC_DRAG_INTERDIT_TAB = 1405;
enum IDC_DRAG_PLUS_TAB = 1406;
enum IDC_DRAG_OUT_TAB = 1407;

enum IDC_MACRO_RECORDING = 1408;

enum IDR_SAVEALL = 1500;
enum IDR_CLOSEFILE = 1501;
enum IDR_CLOSEALL = 1502;
enum IDR_FIND = 1503;
enum IDR_REPLACE = 1504;
enum IDR_ZOOMIN = 1505;
enum IDR_ZOOMOUT = 1506;
enum IDR_WRAP = 1507;
enum IDR_INVISIBLECHAR = 1508;
enum IDR_INDENTGUIDE = 1509;
enum IDR_SHOWPANNEL = 1510;
enum IDR_STARTRECORD = 1511;
enum IDR_STOPRECORD = 1512;
enum IDR_PLAYRECORD = 1513;
enum IDR_SAVERECORD = 1514;
enum IDR_SYNCV = 1515;
enum IDR_SYNCH = 1516;
enum IDR_FILENEW = 1517;
enum IDR_FILEOPEN = 1518;
enum IDR_FILESAVE = 1519;
enum IDR_PRINT = 1520;
enum IDR_CUT = 1521;
enum IDR_COPY = 1522;
enum IDR_PASTE = 1523;
enum IDR_UNDO = 1524;
enum IDR_REDO = 1525;
enum IDR_M_PLAYRECORD = 1526;
enum IDR_DOCMAP = 1527;
enum IDR_FUNC_LIST = 1528;
enum IDR_FILEBROWSER = 1529;
enum IDR_CLOSETAB = 1530;
enum IDR_CLOSETAB_INACT = 1531;
enum IDR_CLOSETAB_HOVER = 1532;
enum IDR_CLOSETAB_PUSH = 1533;
enum IDR_FUNC_LIST_ICO = 1534;
enum IDR_DOCMAP_ICO = 1535;
enum IDR_PROJECTPANEL_ICO = 1536;
enum IDR_CLIPBOARDPANEL_ICO = 1537;
enum IDR_ASCIIPANEL_ICO = 1538;
enum IDR_DOCSWITCHER_ICO = 1539;
enum IDR_FILEBROWSER_ICO = 1540;
enum IDR_FILEMONITORING = 1541;

enum ID_MACRO = 20000;
enum ID_MACRO_LIMIT = 20200;

enum ID_USER_CMD = 21000;
enum ID_USER_CMD_LIMIT = 21200;

enum ID_PLUGINS_CMD = 22000;
enum ID_PLUGINS_CMD_LIMIT = 22500;

enum ID_PLUGINS_CMD_DYNAMIC = 23000;
enum ID_PLUGINS_CMD_DYNAMIC_LIMIT = 24999;

enum MARKER_PLUGINS = 3;
enum MARKER_PLUGINS_LIMIT = 19;
/*UNLOAD
enum ID_PLUGINS_REMOVING = 22501;
enum ID_PLUGINS_REMOVING_END = 22600;
*/


//enum IDM = 40000;

enum IDCMD = 50000;
	//enum IDM_EDIT_AUTOCOMPLETE = .IDCMD + 0;
	//enum IDM_EDIT_AUTOCOMPLETE_CURRENTFILE = .IDCMD + 1;

	enum IDC_PREV_DOC = .IDCMD + 3;
	enum IDC_NEXT_DOC = .IDCMD + 4;
	enum IDC_EDIT_TOGGLEMACRORECORDING = .IDCMD + 5;
	//enum IDC_KEY_HOME = .IDCMD + 6;
	//enum IDC_KEY_END = .IDCMD + 7;
	//enum IDC_KEY_SELECT_2_HOME = .IDCMD + 8;
	//enum IDC_KEY_SELECT_2_END = .IDCMD + 9;

enum IDCMD_LIMIT = .IDCMD + 20;

enum IDSCINTILLA = 60000;
	enum IDSCINTILLA_KEY_HOME = .IDSCINTILLA + 0;
	enum IDSCINTILLA_KEY_HOME_WRAP = .IDSCINTILLA + 1;
	enum IDSCINTILLA_KEY_END = .IDSCINTILLA + 2;
	enum IDSCINTILLA_KEY_END_WRAP = .IDSCINTILLA + 3;
	enum IDSCINTILLA_KEY_LINE_DUP = .IDSCINTILLA + 4;
	enum IDSCINTILLA_KEY_LINE_CUT = .IDSCINTILLA + 5;
	enum IDSCINTILLA_KEY_LINE_DEL = .IDSCINTILLA + 6;
	enum IDSCINTILLA_KEY_LINE_TRANS = .IDSCINTILLA + 7;
	enum IDSCINTILLA_KEY_LINE_COPY = .IDSCINTILLA + 8;
	enum IDSCINTILLA_KEY_CUT = .IDSCINTILLA + 9;
	enum IDSCINTILLA_KEY_COPY = .IDSCINTILLA + 10;
	enum IDSCINTILLA_KEY_PASTE = .IDSCINTILLA + 11;
	enum IDSCINTILLA_KEY_DEL = .IDSCINTILLA + 12;
	enum IDSCINTILLA_KEY_SELECTALL = .IDSCINTILLA + 13;
	enum IDSCINTILLA_KEY_OUTDENT = .IDSCINTILLA + 14;
	enum IDSCINTILLA_KEY_UNDO = .IDSCINTILLA + 15;
	enum IDSCINTILLA_KEY_REDO = .IDSCINTILLA + 16;
enum IDSCINTILLA_LIMIT = .IDSCINTILLA + 30;

enum IDD_FILEVIEW_DIALOG = 1000;

enum IDC_MINIMIZED_TRAY = 67001;

enum IDD_CREATE_DIRECTORY = 1100;
enum IDC_STATIC_CURRENT_FOLDER = 1101;
enum IDC_EDIT_NEW_FOLDER = 1102;

enum IDD_INSERT_INPUT_TEXT = 1200;
enum IDC_EDIT_INPUT_VALUE = 1201;
enum IDC_STATIC_INPUT_TITLE = 1202;
enum IDC_ICON_INPUT_ICON = 1203;

enum IDR_M30_MENU = 1500;

enum IDR_SYSTRAYPOPUP_MENU = 1501;

// enum IDD_FIND_REPLACE_DLG = 1600;

enum IDD_ABOUTBOX = 1700;
enum IDC_LICENCE_EDIT = 1701;
enum IDC_HOME_ADDR = 1702;
enum IDC_EMAIL_ADDR = 1703;
enum IDC_ONLINEHELP_ADDR = 1704;
enum IDC_AUTHOR_NAME = 1705;
enum IDC_BUILD_DATETIME = 1706;
enum IDC_VERSION_BIT = 1707;

enum IDD_DEBUGINFOBOX = 1750;
enum IDC_DEBUGINFO_EDIT = 1751;
enum IDC_DEBUGINFO_COPYLINK = 1752;

enum IDD_DOSAVEORNOTBOX = 1760;
enum IDC_DOSAVEORNOTTEX = 1761;

//enum IDD_USER_DEFINE_BOX = 1800;
//enum IDD_RUN_DLG = 1900;
//enum IDD_MD5FROMFILES_DLG = 1920;
//enum IDD_MD5FROMTEXT_DLG = 1930;

enum IDD_GOLINE = 2000;
enum ID_GOLINE_EDIT = .IDD_GOLINE + 1;
enum ID_CURRLINE = .IDD_GOLINE + 2;
enum ID_LASTLINE = .IDD_GOLINE + 3;
enum ID_URHERE_STATIC = .IDD_GOLINE + 4;
enum ID_UGO_STATIC = .IDD_GOLINE + 5;
enum ID_NOMORETHAN_STATIC = .IDD_GOLINE + 6;
enum IDC_RADIO_GOTOLINE = .IDD_GOLINE + 7;
enum IDC_RADIO_GOTOOFFSET = .IDD_GOLINE + 8;

// voir columnEditor_rc.h
//enum IDD_COLUMNEDIT = 2020;


//enum IDD_COLOUR_POPUP = 2100;

// See WordStyleDlgRes.h
//enum IDD_STYLER_DLG = 2200;
//enum IDD_GLOBAL_STYLER_DLG = 2300;

enum IDD_VALUE_DLG = 2400;
enum IDC_VALUE_STATIC = 2401;
enum IDC_VALUE_EDIT = 2402;

enum IDD_BUTTON_DLG = 2410;
enum IDC_RESTORE_BUTTON = 2411;

// see TaskListDlg_rc.h
//enum IDD_TASKLIST_DLG = 2450;
enum IDD_SETTING_DLG = 2500;



//See ShortcutMapper_rc.h
//enum IDD_SHORTCUTMAPPER_DLG = 2600;

//See ansiCharPanel_rc.h
//enum IDD_ANSIASCII_PANEL = 2700;

//See clipboardHistoryPanel_rc.h
//enum IDD_CLIPBOARDHISTORY_PANEL = 2800;

//See findCharsInRange_rc.h
//enum IDD_FINDCHARACTERS = 2900;

//See VerticalFileSwitcher_rc.h
//enum IDD_FILESWITCHER_PANEL = 3000;

//See ProjectPanel_rc.h
//enum IDD_PROJECTPANEL = 3100;
//enum IDD_FILERELOCALIZER_DIALOG = 3200;

//See documentMap_rc.h
//enum IDD_DOCUMENTMAP = 3300;

//See functionListPanel_rc.h
//enum IDD_FUNCLIST_PANEL = 3400;

//See fileBrowser_rc.h
//enum IDD_FILEBROWSER = 3500;

//See documentSnapshot_rc.h
//enum IDD_DOCUMENSNAPSHOT = 3600;

// See regExtDlg.h
//enum IDD_REGEXT = 4000;

// See shortcutRc.h
//enum IDD_SHORTCUT_DLG = 5000;

// See pluginsAdminRes.h
//enum IDD_PLUGINSADMIN_DLG = 5500;

// See preference.rc
//enum IDD_PREFERENCE_BOX = 6000;

enum NOTEPADPLUS_USER_INTERNAL = core.sys.windows.winuser.WM_USER + 0000;
	enum NPPM_INTERNAL_USERCMDLIST_MODIFIED = .NOTEPADPLUS_USER_INTERNAL + 1;
	enum NPPM_INTERNAL_CMDLIST_MODIFIED = .NOTEPADPLUS_USER_INTERNAL + 2;
	enum NPPM_INTERNAL_MACROLIST_MODIFIED = .NOTEPADPLUS_USER_INTERNAL + 3;
	enum NPPM_INTERNAL_PLUGINCMDLIST_MODIFIED = .NOTEPADPLUS_USER_INTERNAL + 4;
	enum NPPM_INTERNAL_CLEARSCINTILLAKEY = .NOTEPADPLUS_USER_INTERNAL + 5;
	enum NPPM_INTERNAL_BINDSCINTILLAKEY = .NOTEPADPLUS_USER_INTERNAL + 6;
	enum NPPM_INTERNAL_SCINTILLAKEYMODIFIED = .NOTEPADPLUS_USER_INTERNAL + 7;
	enum NPPM_INTERNAL_SCINTILLAFINFERCOLLAPSE = .NOTEPADPLUS_USER_INTERNAL + 8;
	enum NPPM_INTERNAL_SCINTILLAFINFERUNCOLLAPSE = .NOTEPADPLUS_USER_INTERNAL + 9;
	enum NPPM_INTERNAL_DISABLEAUTOUPDATE = .NOTEPADPLUS_USER_INTERNAL + 10;
	enum NPPM_INTERNAL_SETTING_HISTORY_SIZE = .NOTEPADPLUS_USER_INTERNAL + 11;
	enum NPPM_INTERNAL_ISTABBARREDUCED = .NOTEPADPLUS_USER_INTERNAL + 12;
	enum NPPM_INTERNAL_ISFOCUSEDTAB = .NOTEPADPLUS_USER_INTERNAL + 13;
	enum NPPM_INTERNAL_GETMENU = .NOTEPADPLUS_USER_INTERNAL + 14;
	enum NPPM_INTERNAL_CLEARINDICATOR = .NOTEPADPLUS_USER_INTERNAL + 15;
	enum NPPM_INTERNAL_SCINTILLAFINFERCOPY = .NOTEPADPLUS_USER_INTERNAL + 16;
	enum NPPM_INTERNAL_SCINTILLAFINFERSELECTALL = .NOTEPADPLUS_USER_INTERNAL + 17;
	enum NPPM_INTERNAL_SETCARETWIDTH = .NOTEPADPLUS_USER_INTERNAL + 18;
	enum NPPM_INTERNAL_SETCARETBLINKRATE = .NOTEPADPLUS_USER_INTERNAL + 19;
	enum NPPM_INTERNAL_CLEARINDICATORTAGMATCH = .NOTEPADPLUS_USER_INTERNAL + 20;
	enum NPPM_INTERNAL_CLEARINDICATORTAGATTR = .NOTEPADPLUS_USER_INTERNAL + 21;
	enum NPPM_INTERNAL_SWITCHVIEWFROMHWND = .NOTEPADPLUS_USER_INTERNAL + 22;
	enum NPPM_INTERNAL_UPDATETITLEBAR = .NOTEPADPLUS_USER_INTERNAL + 23;
	enum NPPM_INTERNAL_CANCEL_FIND_IN_FILES = .NOTEPADPLUS_USER_INTERNAL + 24;
	enum NPPM_INTERNAL_RELOADNATIVELANG = .NOTEPADPLUS_USER_INTERNAL + 25;
	enum NPPM_INTERNAL_PLUGINSHORTCUTMOTIFIED = .NOTEPADPLUS_USER_INTERNAL + 26;
	enum NPPM_INTERNAL_SCINTILLAFINFERCLEARALL = .NOTEPADPLUS_USER_INTERNAL + 27;
	//enum NPPM_INTERNAL_ = .NOTEPADPLUS_USER_INTERNAL + 28;
	enum NPPM_INTERNAL_SETTING_TAB_REPLCESPACE = .NOTEPADPLUS_USER_INTERNAL + 29;
	enum NPPM_INTERNAL_SETTING_TAB_SIZE = .NOTEPADPLUS_USER_INTERNAL + 30;
	enum NPPM_INTERNAL_RELOADSTYLERS = .NOTEPADPLUS_USER_INTERNAL + 31;
	enum NPPM_INTERNAL_DOCORDERCHANGED = .NOTEPADPLUS_USER_INTERNAL + 32;
	enum NPPM_INTERNAL_SETMULTISELCTION = .NOTEPADPLUS_USER_INTERNAL + 33;
	enum NPPM_INTERNAL_SCINTILLAFINFEROPENALL = .NOTEPADPLUS_USER_INTERNAL + 34;
	enum NPPM_INTERNAL_RECENTFILELIST_UPDATE = .NOTEPADPLUS_USER_INTERNAL + 35;
	enum NPPM_INTERNAL_RECENTFILELIST_SWITCH = .NOTEPADPLUS_USER_INTERNAL + 36;
	enum NPPM_INTERNAL_GETSCINTEDTVIEW = .NOTEPADPLUS_USER_INTERNAL + 37;
	enum NPPM_INTERNAL_ENABLESNAPSHOT = .NOTEPADPLUS_USER_INTERNAL + 38;
	enum NPPM_INTERNAL_SAVECURRENTSESSION = .NOTEPADPLUS_USER_INTERNAL + 39;
	enum NPPM_INTERNAL_FINDINFINDERDLG = .NOTEPADPLUS_USER_INTERNAL + 40;
	enum NPPM_INTERNAL_REMOVEFINDER = .NOTEPADPLUS_USER_INTERNAL + 41;

	// Used by Monitoring feature
	enum NPPM_INTERNAL_RELOADSCROLLTOEND = .NOTEPADPLUS_USER_INTERNAL + 42;

	enum NPPM_INTERNAL_FINDKEYCONFLICTS = .NOTEPADPLUS_USER_INTERNAL + 43;
	enum NPPM_INTERNAL_SCROLLBEYONDLASTLINE = .NOTEPADPLUS_USER_INTERNAL + 44;
	enum NPPM_INTERNAL_SETWORDCHARS = .NOTEPADPLUS_USER_INTERNAL + 45;
	enum NPPM_INTERNAL_EXPORTFUNCLISTANDQUIT = .NOTEPADPLUS_USER_INTERNAL + 46;
	enum NPPM_INTERNAL_PRNTANDQUIT = .NOTEPADPLUS_USER_INTERNAL + 47;
	enum NPPM_INTERNAL_SAVEBACKUP = .NOTEPADPLUS_USER_INTERNAL + 48;

	// Used by Monitoring feature
	enum NPPM_INTERNAL_STOPMONITORING = .NOTEPADPLUS_USER_INTERNAL + 49;

	enum NPPM_INTERNAL_EDGEBACKGROUND = NOTEPADPLUS_USER_INTERNAL + 50;
	enum NPPM_INTERNAL_EDGEMULTISETSIZE = NOTEPADPLUS_USER_INTERNAL + 51;
	enum NPPM_INTERNAL_UPDATECLICKABLELINKS = NOTEPADPLUS_USER_INTERNAL + 52;

// See Notepad_plus_msgs.h
//enum NOTEPADPLUS_USER = core.sys.windows.winuser.WM_USER + 1000;

	//
	// Used by Doc Monitor plugin
	//
	enum NPPM_INTERNAL_CHECKDOCSTATUS = npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPMSG + 53;
	// VOID NPPM_CHECKDOCSTATUS(0, 0)
	// check all opened documents status.
	// If files are modified, then reloaod (with or without prompt, it depends on settings).
	// if files are deleted, then prompt user to close the documents

	enum NPPM_INTERNAL_ENABLECHECKDOCOPT = npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPMSG + 54;
	// VOID NPPM_ENABLECHECKDOCOPT(OPT, 0)
		// where OPT is :
		enum CHECKDOCOPT_NONE = 0;
		enum CHECKDOCOPT_UPDATESILENTLY = 1;
		enum CHECKDOCOPT_UPDATEGO2END = 2;

	//
	// Used by netnote plugin
	//
	enum NPPM_INTERNAL_SETFILENAME = npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPMSG + 63;
	//wParam: BufferID to rename
	//lParam: name to set (TCHAR*)
	//Buffer must have been previously unnamed (eg "new 1" document types)



enum SCINTILLA_USER = core.sys.windows.winuser.WM_USER + 2000;


enum MACRO_USER = core.sys.windows.winuser.WM_USER + 4000;
	enum WM_GETCURRENTMACROSTATUS = .MACRO_USER + 01;
	enum WM_MACRODLGRUNMACRO = .MACRO_USER + 02;


// See Notepad_plus_msgs.h
//enum RUNCOMMAND_USER = core.sys.windows.winuser.WM_USER + 3000;
enum SPLITTER_USER = core.sys.windows.winuser.WM_USER + 4000;
enum WORDSTYLE_USER = core.sys.windows.winuser.WM_USER + 5000;
enum COLOURPOPUP_USER = core.sys.windows.winuser.WM_USER + 6000;
enum BABYGRID_USER = core.sys.windows.winuser.WM_USER + 7000;

//enum IDD_DOCKING_MNG = IDM + 7000;

enum MENUINDEX_FILE = 0;
enum MENUINDEX_EDIT = 1;
enum MENUINDEX_SEARCH = 2;
enum MENUINDEX_VIEW = 3;
enum MENUINDEX_FORMAT = 4;
enum MENUINDEX_LANGUAGE = 5;
enum MENUINDEX_SETTINGS = 6;
enum MENUINDEX_TOOLS = 7;
enum MENUINDEX_MACRO = 8;
enum MENUINDEX_RUN = 9;
enum MENUINDEX_PLUGINS = 10;
