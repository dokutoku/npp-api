//this file is part of notepad++
//Copyright (C)2003 Don HO ( donho@altern.org )
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
module npp_converter.conversionpanel;


private static import core.stdc.string;
private static import core.stdc.wchar_;
private static import core.sys.windows.basetsd;
private static import core.sys.windows.winbase;
private static import core.sys.windows.windef;
private static import core.sys.windows.wingdi;
private static import core.sys.windows.winnt;
private static import core.sys.windows.winuser;
private static import std.ascii;
private static import std.conv;
private static import npp_api.pluginfunc.scintilla_msg;
private static import npp_api.pluginfunc.string;
private static import npp_api.powereditor.wincontrols.dockingwnd.dockingdlginterface;
private static import npp_converter.plugindefinition;
private static import npp_converter.resource;

enum BCKGRD_COLOR = core.sys.windows.wingdi.RGB(255, 102, 102);
enum TXT_COLOR = core.sys.windows.wingdi.RGB(255, 255, 255);
enum CF_NPPTEXTLEN = npp_api.pluginfunc.string.c_wstring!("Notepad++ Binary Text Length"w);

npp_converter.conversionpanel.ConversionPanel _conversionPanel;

class ConversionPanel : npp_api.powereditor.wincontrols.dockingwnd.dockingdlginterface.DockingDlgInterface
{
public:
	pure nothrow @safe @nogc
	this()

		do
		{
			this.lock = false;
			super(npp_converter.resource.IDD_CONVERSION_PANEL);
		}

	nothrow @nogc
	override void display(bool toShow = true)

		do
		{
			super.display(toShow);

			if (toShow) {
				core.sys.windows.winuser.SetFocus(core.sys.windows.winuser.GetDlgItem(this._hSelf, npp_converter.resource.ID_ASCII_EDIT));
			}
		}

	pure nothrow @safe @nogc
	void setParent(core.sys.windows.windef.HWND parent2set)

		do
		{
			this._hParent = parent2set;
		}

	nothrow @nogc
	void resetExcept(int exceptID)

		do
		{
			if (exceptID != npp_converter.resource.ID_ASCII_EDIT) {
				core.sys.windows.winuser.SendDlgItemMessageW(this._hSelf, npp_converter.resource.ID_ASCII_EDIT, core.sys.windows.winuser.WM_SETTEXT, 0, cast(core.sys.windows.windef.LPARAM)(&("\0"w[0])));
			}

			if (exceptID != npp_converter.resource.ID_DEC_EDIT) {
				core.sys.windows.winuser.SendDlgItemMessageW(this._hSelf, npp_converter.resource.ID_DEC_EDIT, core.sys.windows.winuser.WM_SETTEXT, 0, cast(core.sys.windows.windef.LPARAM)(&("\0"w[0])));
			}

			if (exceptID != npp_converter.resource.ID_HEX_EDIT) {
				core.sys.windows.winuser.SendDlgItemMessageW(this._hSelf, npp_converter.resource.ID_HEX_EDIT, core.sys.windows.winuser.WM_SETTEXT, 0, cast(core.sys.windows.windef.LPARAM)(&("\0"w[0])));
			}

			if (exceptID != npp_converter.resource.ID_OCT_EDIT) {
				core.sys.windows.winuser.SendDlgItemMessageW(this._hSelf, npp_converter.resource.ID_OCT_EDIT, core.sys.windows.winuser.WM_SETTEXT, 0, cast(core.sys.windows.windef.LPARAM)(&("\0"w[0])));
			}

			if (exceptID != npp_converter.resource.ID_BIN_EDIT) {
				core.sys.windows.winuser.SendDlgItemMessageW(this._hSelf, npp_converter.resource.ID_BIN_EDIT, core.sys.windows.winuser.WM_SETTEXT, 0, cast(core.sys.windows.windef.LPARAM)(&("\0"w[0])));
			}
		}

	nothrow @nogc
	void setValueFrom(int id)

		do
		{
			enum int inStrSize = 256;
			this.lock = true;
			core.sys.windows.winnt.WCHAR[inStrSize] intStr;
			core.sys.windows.winuser.SendDlgItemMessageW(this._hSelf, id, core.sys.windows.winuser.WM_GETTEXT, inStrSize, cast(core.sys.windows.windef.LPARAM)(&(intStr[0])));

			this.resetExcept(id);

			if (intStr[0] == '\0') {
				this.lock = false;

				return;
			}

			if (!this.qualified(&(intStr[0]), id)) {
				this.lock = false;
				int len = core.sys.windows.winbase.lstrlenW(&(intStr[0]));
				intStr[len - 1] = '\0';
				core.sys.windows.winuser.SendDlgItemMessageW(this._hSelf, id, core.sys.windows.winuser.WM_SETTEXT, 0, cast(core.sys.windows.windef.LPARAM)(&(intStr[0])));
				core.sys.windows.winuser.SendDlgItemMessageW(this._hSelf, id, core.sys.windows.winuser.EM_SETSEL, len - 1, len - 1);

				return;
			}

			int base = 10;

			switch (id) {
				case npp_converter.resource.ID_ASCII_EDIT:
					base = 0;

					break;

				case npp_converter.resource.ID_DEC_EDIT:
					base = 10;

					break;

				case npp_converter.resource.ID_HEX_EDIT:
					base = 16;

					break;

				case npp_converter.resource.ID_OCT_EDIT:
					base = 8;

					break;

				case npp_converter.resource.ID_BIN_EDIT:
					base = 2;

					break;

				default:
					break;
			}

			ulong v = 0;

			if (!base) {
				v = intStr[0];
			} else {
				v = core.stdc.wchar_.wcstoul(&(intStr[0]), core.sys.windows.windef.NULL, base);
			}

			this.setValueExcept(id, v);
			this.lock = false;
		}

	nothrow @nogc
	void setValueExcept(int exceptID, ulong value)

		do
		{
			enum strLen = 1024;
			core.sys.windows.winnt.WCHAR[strLen] str2Display = '\0';

			if (exceptID != npp_converter.resource.ID_ASCII_EDIT) {
				if (value <= 255) {
					core.sys.windows.winnt.WCHAR[2] ascii2Display;
					ascii2Display[0] = cast(core.sys.windows.winnt.WCHAR)(value);
					ascii2Display[1] = '\0';
					core.sys.windows.winuser.SendDlgItemMessageW(this._hSelf, npp_converter.resource.ID_ASCII_EDIT, core.sys.windows.winuser.WM_SETTEXT, 0, cast(core.sys.windows.windef.LPARAM)(&ascii2Display[0]));
					core.sys.windows.winuser.SendDlgItemMessageW(this._hSelf, npp_converter.resource.ID_ASCII_INFO_STATIC, core.sys.windows.winuser.WM_SETTEXT, 0, cast(core.sys.windows.windef.LPARAM)(&(this.getAsciiInfo(cast(ubyte)(value))[0])));
				} else {
					core.sys.windows.winuser.SendDlgItemMessageW(this._hSelf, npp_converter.resource.ID_ASCII_INFO_STATIC, core.sys.windows.winuser.WM_SETTEXT, 0, cast(core.sys.windows.windef.LPARAM)(&("\0"w[0])));
				}
			} else {
				core.sys.windows.winuser.SendDlgItemMessageW(this._hSelf, npp_converter.resource.ID_ASCII_INFO_STATIC, core.sys.windows.winuser.WM_SETTEXT, 0, cast(core.sys.windows.windef.LPARAM)(&(this.getAsciiInfo(cast(ubyte)(value))[0])));
			}

			if (exceptID != npp_converter.resource.ID_DEC_EDIT) {
				core.stdc.wchar_.swprintf(&(str2Display[0]), strLen, &(npp_api.pluginfunc.string.c_wstring!("%d"w)[0]), cast(size_t)(value));
				core.sys.windows.winuser.SendDlgItemMessageW(this._hSelf, npp_converter.resource.ID_DEC_EDIT, core.sys.windows.winuser.WM_SETTEXT, 0, cast(core.sys.windows.windef.LPARAM)(&(str2Display[0])));
			}

			if (exceptID != npp_converter.resource.ID_HEX_EDIT) {
				core.stdc.wchar_.swprintf(&(str2Display[0]), strLen, &(npp_api.pluginfunc.string.c_wstring!("%X"w)[0]), cast(size_t)(value));
				core.sys.windows.winuser.SendDlgItemMessageW(this._hSelf, npp_converter.resource.ID_HEX_EDIT, core.sys.windows.winuser.WM_SETTEXT, 0, cast(core.sys.windows.windef.LPARAM)(&(str2Display[0])));
			}

			if (exceptID != npp_converter.resource.ID_OCT_EDIT) {
				core.stdc.wchar_.swprintf(&(str2Display[0]), strLen, &(npp_api.pluginfunc.string.c_wstring!("%o"w)[0]), cast(size_t)(value));
				core.sys.windows.winuser.SendDlgItemMessageW(this._hSelf, npp_converter.resource.ID_OCT_EDIT, core.sys.windows.winuser.WM_SETTEXT, 0, cast(core.sys.windows.windef.LPARAM)(&(str2Display[0])));
			}

			if (exceptID != npp_converter.resource.ID_BIN_EDIT) {
				wchar[1234] str2DisplayA = '\0';
				auto temp = std.conv.toChars!(2, wchar, std.ascii.LetterCase.lower)(value);

				for (size_t i = 0; i < temp.length; i++) {
					str2DisplayA[i] = temp[i];
				}

				core.sys.windows.winuser.SendDlgItemMessageW(this._hSelf, npp_converter.resource.ID_BIN_EDIT, core.sys.windows.winuser.WM_SETTEXT, 0, cast(core.sys.windows.windef.LPARAM)(&(str2DisplayA[0])));
			}
		}

	nothrow @nogc
	bool qualified(core.sys.windows.winnt.WCHAR* str, int id)

		do
		{
			for (int i = 0 ; i < core.sys.windows.winbase.lstrlenW(str) ; i++) {
				if (id == npp_converter.resource.ID_ASCII_EDIT) {
					//Only one character, Accept all
				} else if (id == npp_converter.resource.ID_HEX_EDIT) {
		  			if (!(((str[i] >= '0') && (str[i] <= '9')) || ((str[i] >= 'A') && (str[i] <= 'F')) || ((str[i] >= 'a') && (str[i] <= 'f')))) {

						return false;
					}
				} else if (id == npp_converter.resource.ID_DEC_EDIT) {
					if (!((str[i] >= '0') && (str[i] <= '9'))) {

						return false;
					}
				} else if (id == npp_converter.resource.ID_OCT_EDIT) {
					if (!((str[i] >= '0') && (str[i] <= '7'))) {

						return false;
					}
				} else if (id == npp_converter.resource.ID_BIN_EDIT) {
					if (!((str[i] == '0') || (str[i] == '1'))) {

						return false;
					}
				}
			}

			return true;
		}

	pure nothrow @safe @nogc
	wstring getAsciiInfo(ubyte value)

		out(result)
		{
			if (result.length != 0) {
				assert(result[$ - 1] == '\0');
			}
		}

		do
		{
			switch (value) {
				case 0:
					return npp_api.pluginfunc.string.c_wstring!("NULL"w);

				case 1:
					return npp_api.pluginfunc.string.c_wstring!("SOH"w);

				case 2:
					return npp_api.pluginfunc.string.c_wstring!("STX"w);

				case 3:
					return npp_api.pluginfunc.string.c_wstring!("ETX"w);

				case 4:
					return npp_api.pluginfunc.string.c_wstring!("EOT"w);

				case 5:
					return npp_api.pluginfunc.string.c_wstring!("ENQ"w);

				case 6:
					return npp_api.pluginfunc.string.c_wstring!("ACK"w);

				case 7:
					return npp_api.pluginfunc.string.c_wstring!("BEL"w);

				case 8:
					return npp_api.pluginfunc.string.c_wstring!("BS"w);

				case 9:
					return npp_api.pluginfunc.string.c_wstring!("TAB"w);

				case 10:
					return npp_api.pluginfunc.string.c_wstring!("LF"w);

				case 11:
					return npp_api.pluginfunc.string.c_wstring!("VT"w);

				case 12:
					return npp_api.pluginfunc.string.c_wstring!("FF"w);

				case 13:
					return npp_api.pluginfunc.string.c_wstring!("CR"w);

				case 14:
					return npp_api.pluginfunc.string.c_wstring!("SO"w);

				case 15:
					return npp_api.pluginfunc.string.c_wstring!("SI"w);

				case 16:
					return npp_api.pluginfunc.string.c_wstring!("DLE"w);

				case 17:
					return npp_api.pluginfunc.string.c_wstring!("DC1"w);

				case 18:
					return npp_api.pluginfunc.string.c_wstring!("DC2"w);

				case 19:
					return npp_api.pluginfunc.string.c_wstring!("DC3"w);

				case 20:
					return npp_api.pluginfunc.string.c_wstring!("DC4"w);

				case 21:
					return npp_api.pluginfunc.string.c_wstring!("NAK"w);

				case 22:
					return npp_api.pluginfunc.string.c_wstring!("SYN"w);

				case 23:
					return npp_api.pluginfunc.string.c_wstring!("ETB"w);

				case 24:
					return npp_api.pluginfunc.string.c_wstring!("CAN"w);

				case 25:
					return npp_api.pluginfunc.string.c_wstring!("EM"w);

				case 26:
					return npp_api.pluginfunc.string.c_wstring!("SUB"w);

				case 27:
					return npp_api.pluginfunc.string.c_wstring!("ESC"w);

				case 28:
					return npp_api.pluginfunc.string.c_wstring!("FS"w);

				case 29:
					return npp_api.pluginfunc.string.c_wstring!("GS"w);

				case 30:
					return npp_api.pluginfunc.string.c_wstring!("RS"w);

				case 31:
					return npp_api.pluginfunc.string.c_wstring!("US"w);

				case 32:
					return npp_api.pluginfunc.string.c_wstring!("Space"w);

				case 127:
					return npp_api.pluginfunc.string.c_wstring!("DEL"w);
					/*
					case 0:
						return npp_api.pluginfunc.string.c_wstring!("NULL"w);
					case 0:
						return npp_api.pluginfunc.string.c_wstring!("NULL"w);
					case 0:
						return npp_api.pluginfunc.string.c_wstring!("NULL"w);
					case 0:
						return npp_api.pluginfunc.string.c_wstring!("NULL"w);
					case 0:
						return npp_api.pluginfunc.string.c_wstring!("NULL"w);
					*/

				default:
					break;
			}

			return "\0"w;
		}

	nothrow @nogc
	void insertToNppFrom(int id)

		do
		{
			enum inStrSize = 256;
			char[inStrSize] intStr;
			core.sys.windows.winuser.SendDlgItemMessageA(this._hSelf, id, core.sys.windows.winuser.WM_GETTEXT, inStrSize, cast(core.sys.windows.windef.LPARAM)(&(intStr[0])));
			core.sys.windows.windef.HWND hCurrScintilla = npp_converter.plugindefinition.getCurrentScintillaHandle();
			npp_api.pluginfunc.scintilla_msg.send_SCI_REPLACESEL(hCurrScintilla, &(intStr[0]));
		}

	nothrow @nogc
	int getAsciiUcharFromDec()

		do
		{
			enum inStrSize = 256;
			core.sys.windows.winnt.WCHAR[inStrSize] intStr;
			core.sys.windows.winuser.SendDlgItemMessageW(this._hSelf, npp_converter.resource.ID_DEC_EDIT, core.sys.windows.winuser.WM_GETTEXT, inStrSize, cast(core.sys.windows.windef.LPARAM)(&(intStr[0])));
			int v = core.stdc.wchar_.wcstoul(&(intStr[0]), core.sys.windows.windef.NULL, 10);

			if (v > 255) {
				return -1;
			}

			return v;
		}

	nothrow @nogc
	void copyToClipboardFrom(int id)

		do
		{
			enum intStrMaxSize = 256;
			char[intStrMaxSize] intStr;
			size_t intStrLen = 0;

			if (id == npp_converter.resource.ID_ASCII_EDIT) {
				int v = this.getAsciiUcharFromDec();

				if (v == -1) {
					return;
				}

				intStr[0] = cast(char)(v);
				intStr[1] = '\0';
				intStrLen = 1;
			} else {
				core.sys.windows.winuser.SendDlgItemMessageW(this._hSelf, id, core.sys.windows.winuser.WM_GETTEXT, intStrMaxSize, cast(core.sys.windows.windef.LPARAM)(&(intStr[0])));
				intStrLen = core.stdc.string.strlen(&(intStr[0]));
			}

			// Open the clipboard, and empty it.
			if (!core.sys.windows.winuser.OpenClipboard(core.sys.windows.windef.NULL)) {
				return;
			}

			core.sys.windows.winuser.EmptyClipboard();

			// Allocate a global memory object for the text.
			core.sys.windows.windef.HGLOBAL hglbCopy = core.sys.windows.winbase.GlobalAlloc(core.sys.windows.winbase.GMEM_MOVEABLE, (intStrLen + 1) * ubyte.sizeof);

			if (hglbCopy == core.sys.windows.windef.NULL) {
				core.sys.windows.winuser.CloseClipboard();

				return;
			}

			// Lock the handle and copy the text to the buffer.
			ubyte* lpucharCopy = cast(ubyte*)(core.sys.windows.winbase.GlobalLock(hglbCopy));
			core.stdc.string.memcpy(lpucharCopy, &(intStr[0]), intStrLen * ubyte.sizeof);

			// null character
			lpucharCopy[intStrLen] = '\0';

			core.sys.windows.winbase.GlobalUnlock(hglbCopy);

			// Place the handle on the clipboard.
			core.sys.windows.winuser.SetClipboardData(core.sys.windows.winuser.CF_TEXT, hglbCopy);

			// Allocate a global memory object for the text length.
			core.sys.windows.windef.HGLOBAL hglbLenCopy = core.sys.windows.winbase.GlobalAlloc(core.sys.windows.winbase.GMEM_MOVEABLE, ulong.sizeof);

			if (hglbLenCopy == core.sys.windows.windef.NULL) {
				core.sys.windows.winuser.CloseClipboard();

				return;
			}

			// Lock the handle and copy the text to the buffer.
			ulong* lpLenCopy = cast(ulong*)(core.sys.windows.winbase.GlobalLock(hglbLenCopy));
			*lpLenCopy = cast(ulong)(intStrLen);

			core.sys.windows.winbase.GlobalUnlock(hglbLenCopy);

			// Place the handle on the clipboard.
			core.sys.windows.windef.UINT f = core.sys.windows.winuser.RegisterClipboardFormatW(&(CF_NPPTEXTLEN[0]));
			core.sys.windows.winuser.SetClipboardData(f, hglbLenCopy);

			core.sys.windows.winuser.CloseClipboard();

		}

protected:
	extern (Windows)
	nothrow @nogc
	override core.sys.windows.basetsd.INT_PTR run_dlgProc(core.sys.windows.windef.UINT message, core.sys.windows.windef.WPARAM wParam, core.sys.windows.windef.LPARAM lParam)

		do
		{
			switch (message) {
				case core.sys.windows.winuser.WM_INITDIALOG:
					core.sys.windows.winuser.SendDlgItemMessageW(this._hSelf, npp_converter.resource.ID_ASCII_EDIT, core.sys.windows.winuser.EM_LIMITTEXT, 1, 0);

					return core.sys.windows.windef.TRUE;

				case core.sys.windows.winuser.WM_COMMAND:
					switch (wParam) {
						case npp_converter.resource.ID_ASCII_INSERT_BUTTON:
							int v = this.getAsciiUcharFromDec();

							if (v != -1) {
								char[2] charStr;
								charStr[0] = cast(char)(v);
								charStr[1] = '\0';
								core.sys.windows.windef.HWND hCurrScintilla = npp_converter.plugindefinition.getCurrentScintillaHandle();
								npp_api.pluginfunc.scintilla_msg.send_SCI_REPLACESEL(hCurrScintilla, &("\0"[0]));
								npp_api.pluginfunc.scintilla_msg.send_SCI_ADDTEXT(hCurrScintilla, 1, &(charStr[0]));
							}

							return core.sys.windows.windef.TRUE;

						case npp_converter.resource.ID_DEC_INSERT_BUTTON:
							this.insertToNppFrom(npp_converter.resource.ID_DEC_EDIT);

							return core.sys.windows.windef.TRUE;

						case npp_converter.resource.ID_HEX_INSERT_BUTTON:
							this.insertToNppFrom(npp_converter.resource.ID_HEX_EDIT);

							return core.sys.windows.windef.TRUE;

						case npp_converter.resource.ID_BIN_INSERT_BUTTON:
							this.insertToNppFrom(npp_converter.resource.ID_BIN_EDIT);

							return core.sys.windows.windef.TRUE;

						case npp_converter.resource.ID_OCT_INSERT_BUTTON:
							this.insertToNppFrom(npp_converter.resource.ID_OCT_EDIT);

							return core.sys.windows.windef.TRUE;

						case npp_converter.resource.ID_ASCII_BUTTON:
							this.copyToClipboardFrom(npp_converter.resource.ID_ASCII_EDIT);

							return core.sys.windows.windef.TRUE;

						case npp_converter.resource.ID_DEC_BUTTON:
							this.copyToClipboardFrom(npp_converter.resource.ID_DEC_EDIT);

							return core.sys.windows.windef.TRUE;

						case npp_converter.resource.ID_HEX_BUTTON:
							this.copyToClipboardFrom(npp_converter.resource.ID_HEX_EDIT);

							return core.sys.windows.windef.TRUE;

						case npp_converter.resource.ID_BIN_BUTTON:
							this.copyToClipboardFrom(npp_converter.resource.ID_BIN_EDIT);

							return core.sys.windows.windef.TRUE;

						case npp_converter.resource.ID_OCT_BUTTON:
							this.copyToClipboardFrom(npp_converter.resource.ID_OCT_EDIT);

							return core.sys.windows.windef.TRUE;

						default:
							break;
					}

					if (core.sys.windows.windef.HIWORD(wParam) == core.sys.windows.winuser.EN_CHANGE) {
						switch (core.sys.windows.windef.LOWORD(wParam)) {
							case npp_converter.resource.ID_ASCII_EDIT:
							case npp_converter.resource.ID_DEC_EDIT:
							case npp_converter.resource.ID_HEX_EDIT:
							case npp_converter.resource.ID_BIN_EDIT:
							case npp_converter.resource.ID_OCT_EDIT:
								if (!this.lock) {
									this.setValueFrom(cast(int)(core.sys.windows.windef.LOWORD(wParam)));
								}

								return core.sys.windows.windef.TRUE;

							default:
								break;
						}
					}

					return core.sys.windows.windef.FALSE;

				default:
					return super.run_dlgProc(message, wParam, lParam);
			}
		}

private:
	bool lock;

	nothrow @nogc
	int getLine()

		do
		{
			core.sys.windows.windef.BOOL isSuccessful;
			int line = core.sys.windows.winuser.GetDlgItemInt(this._hSelf, npp_converter.resource.ID_ASCII_EDIT, &isSuccessful, core.sys.windows.windef.FALSE);

			return (isSuccessful) ? (line) : (-1);
		}
}
