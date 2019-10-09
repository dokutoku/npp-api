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
module npp_converter.plugindefinition;


private static import core.stdc.stdio;
private static import core.stdc.wchar_;
private static import core.sys.windows.basetsd;
private static import core.sys.windows.shlwapi;
private static import core.sys.windows.winbase;
private static import core.sys.windows.windef;
private static import core.sys.windows.winnt;
private static import core.sys.windows.winuser;
private static import std.file;
private static import std.path;
private static import std.stdio;
private static import npp_api.scintilla.scintilla;
private static import npp_api.pluginfunc.basic_interface;
private static import npp_api.pluginfunc.npp_msgs;
private static import npp_api.pluginfunc.scintilla_msg;
private static import npp_api.pluginfunc.string;
private static import npp_api.powereditor.misc.pluginsmanager.plugininterface;
private static import npp_api.powereditor.wincontrols.dockingwnd.docking;
private static import npp_converter.conversionpanel;
private static import npp_converter.resource;

enum plugin_name = "Converter sample"w;
enum plugin_cname = npp_api.pluginfunc.string.c_wstring!(plugin_name);

extern (C)
__gshared npp_api.powereditor.misc.pluginsmanager.plugininterface.NppData gshared_nppData;

enum npp_api.powereditor.misc.pluginsmanager.plugininterface.FuncItem[] main_menu_items_def =
[
	{
		_itemName: "ASCII -> HEX"w,
		_pFunc: &.ascii2Hex,
		_init2Check: false,
		_pShKey: null,
	},
	{
		_itemName: "HEX -> ASCII"w,
		_pFunc: &.hex2Ascii,
		_init2Check: false,
		_pShKey: null,
	},
	{
		_pFunc: null,
	},
	{
		_itemName: "Conversion Panel"w,
		_pFunc: &.conversionPanel,
		_init2Check: false,
		_pShKey: null,
	},
	{
		_itemName: "Edit Configuration File"w,
		_pFunc: &.editConf,
		_init2Check: false,
		_pShKey: null,
	},
	{
		_itemName: "About"w,
		_pFunc: &.about,
		_init2Check: false,
		_pShKey: null,
	},
];

enum CONVERSIONPANEL_INDEX = 3;

core.sys.windows.windef.HINSTANCE handle_test;

pragma(inline, true)
nothrow
void pluginInit(core.sys.windows.basetsd.HANDLE hModule)

	do
	{
		static import core.sys.windows.windef;
		static import npp_converter.conversionpanel;

		try {
			npp_converter.conversionpanel._conversionPanel = new npp_converter.conversionpanel.ConversionPanel();
			npp_converter.conversionpanel._conversionPanel.initialize(cast(core.sys.windows.windef.HINSTANCE)(hModule), core.sys.windows.windef.NULL);
			.handle_test = cast(core.sys.windows.windef.HINSTANCE)(hModule);
		} catch (Exception e) {
			//ToDo:
			core.sys.windows.winuser.MessageBoxW(.nppData._nppHandle, &("Exception\0"w[0]), &(plugin_cname[0]), core.sys.windows.winuser.MB_OK);
		}
	}

nothrow @nogc
core.sys.windows.windef.HWND getCurrentScintillaHandle()

	do
	{
		static import npp_api.pluginfunc.npp_msgs;

		int currentEdit;
		npp_api.pluginfunc.npp_msgs.send_NPPM_GETCURRENTSCINTILLA(.nppData._nppHandle, currentEdit);

		return (currentEdit == 0) ? (.nppData._scintillaMainHandle) : (.nppData._scintillaSecondHandle);
	}

class SelectedString
{
public:
	nothrow
	this()

		do
		{
			this._str = null;
			this._selStartPos = 0;
			this._selEndPos = 0;

			core.sys.windows.windef.HWND hCurrScintilla = .getCurrentScintillaHandle();
			size_t start = npp_api.pluginfunc.scintilla_msg.send_SCI_GETSELECTIONSTART(hCurrScintilla);
			size_t end = npp_api.pluginfunc.scintilla_msg.send_SCI_GETSELECTIONEND(hCurrScintilla);

			if (end < start) {
				size_t tmp = start;
				start = end;
				end = tmp;
			}

			this._selStartPos = start;
			this._selEndPos = end;

			size_t textLen = end - start;

			if (textLen == 0) {
				return;
			}

			char[] temp = new char[textLen + 1];

			npp_api.pluginfunc.scintilla_msg.send_SCI_GETSELTEXT(hCurrScintilla, &(temp[0]));
			this._str = npp_api.pluginfunc.string.from_stringz(temp).dup;
		}

	pure nothrow @safe
	string getStr()

		do
		{
			return this._str.idup;
		}

	pure nothrow @safe @nogc
	size_t length()

		do
		{
			if (this._str != null) {
				return (this._selEndPos - this._selStartPos);
			}

			return 0;
		}

	pure nothrow @safe @nogc
	size_t getSelStartPos()

		do
		{
			return this._selStartPos;
		}

	pure nothrow @safe @nogc
	size_t getSelEndPos()

		do
		{
			return this._selEndPos;
		}

	pure nothrow @safe @nogc
	int getChar(size_t i)

		do
		{
			if (i >= (this._selEndPos - this._selStartPos)) {
				return -1;
			}

			return this._str[i];
		}

protected:
	char[] _str;
	size_t _selStartPos;
	size_t _selEndPos;
}

class HexString : SelectedString
{
public:
	/**
	 * rule :
	 * 0. only 0-9 a-f A-F withe space (32) and return (10, 13) are allowed.
	 * 1. 2 char to form 1 byte, so there are alway 2 char w/o space.
	 * 2. if there is a space between the 1st char and the 2nd char, then it should be it in all string, and vice and versa
	 * 3. All the white space (32) \n(10) and \r(13) will be ignored.
	 */
	nothrow @nogc
	bool toAscii()

		do
		{
			size_t l = this.length();
			bool hasWs = false;

			if ((!l) || (l < 2)) {
				return false;
			}

			if (l < 5)	//3 :  "00X" or "X00" where X == \n or " "
				//4 :  "0000"
			{

			}
			// Check 5 first characters
			else { // 5: "00 00" or "00000"
				hasWs = this._str[2] == ' ';
			}

			// Begin conversion
			.hexStat stat = .hexStat.st_init;
			size_t i = 0;
			size_t j = 0;

			for ( ; (i < this._str.length) && (this._str[i] != '\0') ; i++) {
				if (this._str[i] == ' ') {
					if (!hasWs) {
						return false;
					}

					if (stat != .hexStat.st_cc) {
						return false;
					}

					stat = .hexStat.st_init;
				}
				/*
				else if (this._str[i] == '\t')
				{

				}
				*/
				else if ((this._str[i] == '\n') || (this._str[i] == '\r')) {
					if ((stat != .hexStat.st_cc) && (stat != .hexStat.st_init)) {
						return false;
					}

					stat = .hexStat.st_init;
				} else if (((this._str[i] >= 'a') && (this._str[i] <= 'f')) || ((this._str[i] >= 'A') && (this._str[i] <= 'F')) || ((this._str[i] >= '0') && (this._str[i] <= '9'))) {
					if (stat == .hexStat.st_cc) {
						if (hasWs) {
							return false;
						}

						stat = .hexStat.st_c;
					} else if (stat == .hexStat.st_c) {
						// Process

						int hi = .getTrueHexValue(this._str[i - 1]);

						if (hi == -1) {
							return false;
						}

						int lo = .getTrueHexValue(this._str[i]);

						if (lo == -1) {
							return false;
						}

						this._str[j++] = cast(char)((hi * 16) + lo);
						stat = .hexStat.st_cc;
					} else if (stat == .hexStat.st_init) {
						stat = .hexStat.st_c;
					}
				}
				/*
				else if (this._str[i] == ' ')
				{

				}
				*/
				else {
					return false;
				}

			}

			// finalize
			if (stat == .hexStat.st_c) {
				return false;
			}

			this._selEndPos = this._selStartPos + j;

			return true;
		}
}

struct Param
{
	bool _isMaj = true;
	bool _insertSpace = false;
	size_t _nbCharPerLine = 0;
}

Param param;
wstring confPath;
wstring c_confPath;

enum pluginConfName = "converter.ini"w;
enum ascii2HexSectionName = npp_api.pluginfunc.string.c_wstring!("ascii2Hex"w);
enum ascii2HexSpace = npp_api.pluginfunc.string.c_wstring!("insertSpace"w);
enum ascii2HexMaj = npp_api.pluginfunc.string.c_wstring!("uppercase"w);
enum ascii2HexNbCharPerLine = npp_api.pluginfunc.string.c_wstring!("nbCharPerLine"w);

nothrow @nogc
void getCmdsFromConf(const ref core.sys.windows.winnt.WCHAR[] c_confPath, ref Param param)

	in
	{
		assert(c_confPath.length != 0);
		assert(c_confPath[$ - 1] == '\0');
	}

	do
	{
		static import core.sys.windows.winbase;
		static import core.sys.windows.windef;
		static import core.sys.windows.winnt;
		static import core.stdc.wchar_;

		core.sys.windows.winnt.WCHAR[core.sys.windows.windef.MAX_PATH] cmdNames;
		core.sys.windows.winbase.GetPrivateProfileSectionNamesW(&(cmdNames[0]), core.sys.windows.windef.MAX_PATH, &(c_confPath[0]));
		core.sys.windows.winnt.WCHAR* pFn = &(cmdNames[0]);

		if ((*pFn != '\0') && (core.stdc.wchar_.wcscmp(pFn, &(ascii2HexSectionName[0])) == 0)) {
			int val = core.sys.windows.winbase.GetPrivateProfileIntW(pFn, &(ascii2HexSpace[0]), 0, &(c_confPath[0]));
			param._insertSpace = val != 0;
			val = core.sys.windows.winbase.GetPrivateProfileIntW(pFn, &(ascii2HexMaj[0]), 0, &(c_confPath[0]));
			param._isMaj = val != 0;
			val = core.sys.windows.winbase.GetPrivateProfileIntW(pFn, &(ascii2HexNbCharPerLine[0]), 0, &(c_confPath[0]));
			param._nbCharPerLine = val;
		}
	}

//
// if conf file does not exist, then create it and load it.
nothrow
void loadConfFile()

	do
	{
		static import core.stdc.stdio;
		static import core.sys.windows.shlwapi;
		static import core.sys.windows.windef;
		static import core.sys.windows.winnt;
		static import core.sys.windows.winuser;
		static import core.stdc.wchar_;
		static import std.file;
		static import std.path;
		static import std.stdio;
		static import npp_api.pluginfunc.npp_msgs;
		static import npp_api.pluginfunc.string;

		core.sys.windows.winnt.WCHAR[core.sys.windows.windef.MAX_PATH] confDir;
		npp_api.pluginfunc.npp_msgs.send_NPPM_GETPLUGINSCONFIGDIR(.nppData._nppHandle, confDir.length, &(confDir[0]));
		.confPath = std.path.buildPath(npp_api.pluginfunc.string.from_stringz(confDir), pluginConfName);
		.c_confPath = ""w;
		.c_confPath ~= .confPath;
		.c_confPath ~= '\0';

		const char[] confContent = import("confContent.ini");

		if (!std.file.exists(.confPath)) {
			try {
				std.stdio.File f = std.stdio.File(.confPath, "w");
				f.write(confContent);
				f.flush();
				f.close();
			} catch (Exception e) {
				//ToDo:
				core.sys.windows.winuser.MessageBoxW(.nppData._nppHandle, &("Exception\0"w[0]), &(plugin_cname[0]), core.sys.windows.winuser.MB_OK);
			}

			/*
			else {
				wstring msg = .confPath ~ " is absent, and this file cannot be create.\0"w;
				core.sys.windows.winuser.MessageBoxW(.nppData._nppHandle, &(msg[0]), &(npp_api.pluginfunc.string.c_wstring!("Not present"w)[0]), core.sys.windows.winuser.MB_OK);
			}
			*/
		}

		getCmdsFromConf(.c_confPath, .param);
	}

pragma(inline, true)
nothrow
void pluginSetInfo(ref npp_api.powereditor.misc.pluginsmanager.plugininterface.NppData notpadPlusData)

	do
	{
		.loadConfFile();
	}

nothrow
void ascii2hex(bool insertSpace, bool isMaj, size_t nbCharPerLine)

	do
	{
		static import core.stdc.stdio;
		static import core.sys.windows.windef;
		static import npp_api.scintilla.scintilla;
		static import npp_api.pluginfunc.scintilla_msg;

		.SelectedString selText = new .SelectedString();
		size_t textLen = selText.length();

		if (textLen == 0) {
			return;
		}

		core.sys.windows.windef.HWND hCurrScintilla = .getCurrentScintillaHandle();
		int eolMode = cast(int)(npp_api.pluginfunc.scintilla_msg.send_SCI_GETEOLMODE(hCurrScintilla));
		size_t eolNbCharUnit = (eolMode == npp_api.scintilla.scintilla.SC_EOL_CRLF) ? (2) : (1);
		size_t eolNbChar = 0;

		if (nbCharPerLine) {
			eolNbChar = (textLen / nbCharPerLine) * eolNbCharUnit;
		}

		size_t inc = (insertSpace) ? (3) : (2);
		char[] pDestText = new char[textLen * (inc + eolNbChar) + 1];

		size_t j = 0;

		for (size_t i = 0, k = 1 ; i < textLen ; i++) {
			bool isEOL = false;

			if (nbCharPerLine) {
				if (k >= nbCharPerLine) {
					isEOL = true;
					k = 1;
				} else {
					k++;
				}
			}

			int val = selText.getChar(i);

			if (val == -1) {
				return;
			}

			if (!insertSpace || isEOL) {
				string format = (isMaj) ? ("%02X") : ("%02x");
				core.stdc.stdio.sprintf(&(pDestText[j]), &(format[0]), cast(ubyte)(val));
				j += 2;
			} else {
				string format = (isMaj) ? ("%02X ") : ("%02x ");
				core.stdc.stdio.sprintf(&(pDestText[j]), &(format[0]), cast(ubyte)(val));
				j += 3;
			}

			if (isEOL) {
				if (eolMode == npp_api.scintilla.scintilla.SC_EOL_CRLF) {
					pDestText[j++] = 0x0D;
					pDestText[j++] = 0x0A;
				} else if (eolMode == npp_api.scintilla.scintilla.SC_EOL_CR) {
					pDestText[j++] = 0x0D;
				} else if (eolMode == npp_api.scintilla.scintilla.SC_EOL_LF) {
					pDestText[j++] = 0x0A;
				}
			}
		}

		pDestText[j] = 0x00;
		size_t start = selText.getSelStartPos();
		npp_api.pluginfunc.scintilla_msg.send_SCI_REPLACESEL(hCurrScintilla, &("\0"[0]));
		npp_api.pluginfunc.scintilla_msg.send_SCI_ADDTEXT(hCurrScintilla, j, &(pDestText[0]));
		npp_api.pluginfunc.scintilla_msg.send_SCI_SETSEL(hCurrScintilla, start, start + j);
	}

extern (C)
nothrow
void ascii2Hex()

	do
	{
		.ascii2hex(.param._insertSpace, .param._isMaj, .param._nbCharPerLine);
	}

enum hexStat
{
	st_init,
	st_c,
	st_cc,
}

pure nothrow @safe @nogc
int getTrueHexValue(char c)

	do
	{
		switch (c) {
			case '0': .. case '9':
				return (c - '0');

			case 'a':
			case 'A':
				return 10;

			case 'b':
			case 'B':
				return 11;

			case 'c':
			case 'C':
				return 12;

			case 'd':
			case 'D':
				return 13;

			case 'e':
			case 'E':
				return 14;

			case 'f':
			case 'F':
				return 15;

			default:
				return -1;
		}
	}

extern (C)
nothrow
void hex2Ascii()

	do
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.pluginfunc.scintilla_msg;

		.HexString transformer = new .HexString();

		if (transformer.length() == 0) {
			return;
		}

		if (transformer.toAscii()) {
			string hexStr = transformer.getStr();
			core.sys.windows.windef.HWND hCurrScintilla = .getCurrentScintillaHandle();
			size_t start = transformer.getSelStartPos();
			size_t len = transformer.length();
			npp_api.pluginfunc.scintilla_msg.send_SCI_REPLACESEL(hCurrScintilla, &("\0"[0]));
			npp_api.pluginfunc.scintilla_msg.send_SCI_ADDTEXT(hCurrScintilla, len, &(hexStr[0]));
			npp_api.pluginfunc.scintilla_msg.send_SCI_SETSEL(hCurrScintilla, start, start + len);
		} else {
			core.sys.windows.winuser.MessageBoxW(core.sys.windows.windef.NULL, "Hex format is not conformed", &(plugin_cname[0]), core.sys.windows.winuser.MB_OK);
		}
	}

enum aboutMsg = npp_api.pluginfunc.string.c_wstring!("Npp API Converter plugin sample\r\rVersion: "w ~ npp_converter.resource.VERSION_VALUE ~ "\r\rLicense: GPL\r\rAuthor: Don Ho <don.h@free.fr>\r"w);

extern (C)
nothrow @nogc
void about()

	do
	{
		static import core.sys.windows.winuser;
		static import npp_api.pluginfunc.string;

		core.sys.windows.winuser.MessageBoxW(.nppData._nppHandle, &(aboutMsg[0]), &(plugin_cname[0]), core.sys.windows.winuser.MB_OK);
	}

extern (C)
nothrow
void editConf()

	do
	{
		static import core.sys.windows.winnt;
		static import core.sys.windows.winuser;
		static import std.file;
		static import npp_api.pluginfunc.npp_msgs;
		static import npp_api.pluginfunc.string;

		if (!std.file.exists(.confPath)) {
			const core.sys.windows.winnt.WCHAR[] msg = (.confPath ~ " is not present.\rPlease create this file manually.\0"w).idup;
			core.sys.windows.winuser.MessageBoxW(.nppData._nppHandle, &(msg[0]), &(npp_api.pluginfunc.string.c_wstring!("Configuration file is absent"w)[0]), core.sys.windows.winuser.MB_OK);

			return;
		}

		npp_api.pluginfunc.npp_msgs.send_NPPM_DOOPEN(.nppData._nppHandle, &(.c_confPath[0]));
	}

extern (C)
nothrow
void conversionPanel()

	do
	{
		static import npp_api.pluginfunc.npp_msgs;
		static import npp_converter.conversionpanel;
		static import npp_api.powereditor.wincontrols.dockingwnd.docking;

		npp_converter.conversionpanel._conversionPanel.setParent(.gshared_nppData._nppHandle);
		npp_api.powereditor.wincontrols.dockingwnd.docking.tTbData data;

		try {
			if (!npp_converter.conversionpanel._conversionPanel.isCreated()) {
				npp_converter.conversionpanel._conversionPanel.create(&npp_converter.conversionpanel._conversionPanel, data);

				// define the default docking behaviour
				data.uMask = npp_api.powereditor.wincontrols.dockingwnd.docking.DWS_DF_FLOATING;

				data.pszModuleName = npp_converter.conversionpanel._conversionPanel.getPluginFileName();

				// the dlgDlg should be the index of funcItem where the current function pointer is
				// in this case is DOCKABLE_DEMO_INDEX
				data.dlgID = .CONVERSIONPANEL_INDEX;

				npp_api.pluginfunc.npp_msgs.send_NPPM_DMMREGASDCKDLG(.gshared_nppData._nppHandle, &data);
			}

			npp_converter.conversionpanel._conversionPanel.display();
		} catch (Exception e) {
			core.sys.windows.winuser.MessageBoxW(core.sys.windows.windef.NULL, &("Exception\0"w[0]), &("In StaticDialog.create()\0"w[0]), core.sys.windows.winuser.MB_OK);
		}
	}

mixin npp_api.pluginfunc.basic_interface.npp_plugin_interface!(plugin_name, main_menu_items_def);
