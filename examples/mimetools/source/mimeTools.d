//this file is part of MimeTools (plugin for Notepad++)
//Copyright (C)2019 Don HO <don.h@free.fr>
//
//
// Enhance Base64 features, and rewrite Base64 encode/decode implementation
// Copyright 2019 by Paul Nankervis <paulnank@hotmail.com>
//
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
module npp_mimetools.mimeTools;


private static import core.stdc.string;
private static import core.sys.windows.basetsd;
private static import core.sys.windows.winbase;
private static import core.sys.windows.windef;
private static import core.sys.windows.winnt;
private static import core.sys.windows.winuser;
private static import npp_api.pluginfunc.basic_interface;
private static import npp_api.pluginfunc.npp_msgs;
private static import npp_api.pluginfunc.scintilla_msg;
private static import npp_api.pluginfunc.string;
private static import npp_api.powereditor.misc.pluginsmanager.plugininterface;
private static import npp_mimetools.b64;
private static import npp_mimetools.qp;
private static import npp_mimetools.url;
private static import npp_mimetools.saml;

enum IDD_ABOUTBOX = 250;
enum IDC_STATIC = -1;

enum PLUGIN_NAME = npp_api.pluginfunc.string.c_wstring!(`MIME Tools Sample`);

core.sys.windows.windef.HINSTANCE _hInst;

enum npp_api.powereditor.misc.pluginsmanager.plugininterface.FuncItem[] main_menu_items_def =
[
	{
		_itemName: `Base64 Encode`w,
		_pFunc: &.convertToBase64FromAscii,
		_init2Check: false,
		_pShKey: null,
	},
	{
		_itemName: `Base64 Encode with padding`w,
		_pFunc: &.convertToBase64FromAscii_pad,
		_init2Check: false,
		_pShKey: null,
	},
	{
		_itemName: `Base64 Encode with Unix EOL`w,
		_pFunc: &.convertToBase64FromAscii_B64Format,
		_init2Check: false,
		_pShKey: null,
	},
	{
		_itemName: `Base64 Encode by line`w,
		_pFunc: &.convertToBase64FromAscii_byline,
		_init2Check: false,
		_pShKey: null,
	},
	{
		_itemName: `Base64 Decode`w,
		_pFunc: &.convertToAsciiFromBase64,
		_init2Check: false,
		_pShKey: null,
	},
	{
		_itemName: `Base64 Decode strict`w,
		_pFunc: &.convertToAsciiFromBase64_strict,
		_init2Check: false,
		_pShKey: null,
	},
	{
		_itemName: `Base64 Decode by line`w,
		_pFunc: &.convertToAsciiFromBase64_whitespaceReset,
		_init2Check: false,
		_pShKey: null,
	},
	{
		_pFunc: null,
	},
	{
		_itemName: `Quoted-printable Encode`w,
		_pFunc: &.convertToQuotedPrintable,
		_init2Check: false,
		_pShKey: null,
	},
	{
		_itemName: `Quoted-printable Decode`w,
		_pFunc: &.convertToAsciiFromQuotedPrintable,
		_init2Check: false,
		_pShKey: null,
	},
	{
		_pFunc: null,
	},
	{
		_itemName: `URL Encode`w,
		_pFunc: &.convertURLMinEncode,
		_init2Check: false,
		_pShKey: null,
	},
	{
		_itemName: `Full URL Encode`w,
		_pFunc: &.convertURLFullEncode,
		_init2Check: false,
		_pShKey: null,
	},
	{
		_itemName: `URL Decode`w,
		_pFunc: &.convertURLDecode,
		_init2Check: false,
		_pShKey: null,
	},
	{
		_pFunc: null,
	},
	{
		_itemName: `SAML Decode`w,
		_pFunc: &.convertSamlDecode,
		_init2Check: false,
		_pShKey: null,
	},
	{
		_pFunc: null,
	},
	{
		_itemName: `About`w,
		_pFunc: &.about,
		_init2Check: false,
		_pShKey: null,
	},
];

nothrow @nogc
core.sys.windows.windef.HWND getCurrentScintillaHandle()

	body
	{
		static import npp_api.pluginfunc.npp_msgs;

		int currentEdit;
		npp_api.pluginfunc.npp_msgs.send_NPPM_GETCURRENTSCINTILLA(nppData._nppHandle, currentEdit);

		return (currentEdit == 0) ? (nppData._scintillaMainHandle) : (nppData._scintillaSecondHandle);
	}

nothrow
void convertAsciiToBase64(size_t wrapLength, bool padFlag, bool byLineFlag)

	body
	{
		static import core.sys.windows.windef;
		static import npp_api.pluginfunc.scintilla_msg;
		static import npp_mimetools.b64;

		core.sys.windows.windef.HWND hCurrScintilla = .getCurrentScintillaHandle();
		size_t selectedLength = npp_api.pluginfunc.scintilla_msg.send_SCI_GETSELTEXT(hCurrScintilla);

		if (selectedLength == 0) {
			return;
		}

		char[] selectedText = new char[selectedLength];
		npp_api.pluginfunc.scintilla_msg.send_SCI_TARGETFROMSELECTION(hCurrScintilla);
		npp_api.pluginfunc.scintilla_msg.send_SCI_GETTARGETTEXT(hCurrScintilla, &(selectedText[0]));

		size_t bufferLength = (selectedLength + 2) / 3 * 4 + 1;

		if (wrapLength > 0) {
			bufferLength += bufferLength / wrapLength;
		}

		char[] encodedText = new char[bufferLength + 1];

		int len = npp_mimetools.b64.base64Encode(encodedText, selectedText, selectedLength - 1, wrapLength, padFlag, byLineFlag);
		encodedText[len] = '\0';

		npp_api.pluginfunc.scintilla_msg.send_SCI_TARGETFROMSELECTION(hCurrScintilla);
		npp_api.pluginfunc.scintilla_msg.send_SCI_REPLACETARGET(hCurrScintilla, len, &(encodedText[0]));
	}

extern (C)
nothrow
void convertToBase64FromAscii()

	body
	{
		.convertAsciiToBase64(0, false, false);
	}

extern (C)
nothrow
void convertToBase64FromAscii_pad()

	body
	{
		.convertAsciiToBase64(0, true, false);
	}

extern (C)
nothrow
void convertToBase64FromAscii_B64Format()

	body
	{
		.convertAsciiToBase64(64, true, false);
	}

extern (C)
nothrow
void convertToBase64FromAscii_byline()

	body
	{
		.convertAsciiToBase64(0, false, true);
	}

nothrow
void convertBase64ToAscii(bool strictFlag, bool whitespaceReset)

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.pluginfunc.scintilla_msg;
		static import npp_api.pluginfunc.string;
		static import npp_mimetools.b64;

		core.sys.windows.windef.HWND hCurrScintilla = .getCurrentScintillaHandle();
		size_t selectedLength = npp_api.pluginfunc.scintilla_msg.send_SCI_GETSELTEXT(hCurrScintilla);

		if (selectedLength == 0) {
			return;
		}

		char[] selectedText = new char[selectedLength];
		npp_api.pluginfunc.scintilla_msg.send_SCI_TARGETFROMSELECTION(hCurrScintilla);
		npp_api.pluginfunc.scintilla_msg.send_SCI_GETTARGETTEXT(hCurrScintilla, &(selectedText[0]));

		char[] decodedText = new char[selectedLength];

		int len = npp_mimetools.b64.base64Decode(decodedText, selectedText, selectedLength - 1, strictFlag, whitespaceReset);

		if (len < 0) {
			core.sys.windows.winuser.MessageBoxW(nppData._nppHandle, &(npp_api.pluginfunc.string.c_wstring!(`Problem!`)[0]), &(npp_api.pluginfunc.string.c_wstring!(`Base64`)[0]), core.sys.windows.winuser.MB_OK);
		} else {
			decodedText[len] = '\0';
			npp_api.pluginfunc.scintilla_msg.send_SCI_TARGETFROMSELECTION(hCurrScintilla);
			npp_api.pluginfunc.scintilla_msg.send_SCI_REPLACETARGET(hCurrScintilla, len, &(decodedText[0]));
		}
	}

extern (C)
nothrow
void convertToAsciiFromBase64()

	body
	{
		.convertBase64ToAscii(false, false);
	}

extern (C)
nothrow
void convertToAsciiFromBase64_strict()

	body
	{
		.convertBase64ToAscii(true, false);
	}

extern (C)
nothrow
void convertToAsciiFromBase64_whitespaceReset()

	body
	{
		.convertBase64ToAscii(false, true);
	}

extern (C)
nothrow
void convertURLMinEncode()

	body
	{
		.convertURLEncode(false);
	}

extern (C)
nothrow
void convertURLFullEncode()

	body
	{
		.convertURLEncode(true);
	}

nothrow
void convertURLEncode(bool encodeAll)

	body
	{
		static import core.stdc.string;
		static import core.sys.windows.windef;
		static import npp_api.pluginfunc.scintilla_msg;
		static import npp_mimetools.url;

		core.sys.windows.windef.HWND hCurrScintilla = .getCurrentScintillaHandle();
		size_t bufLength = npp_api.pluginfunc.scintilla_msg.send_SCI_GETSELTEXT(hCurrScintilla);

		if (bufLength == 0) {
			return;
		}

		char[] selectedText = new char[bufLength];
		char[] pEncodedText = new char[bufLength * 3];
		npp_api.pluginfunc.scintilla_msg.send_SCI_GETSELTEXT(hCurrScintilla, &(selectedText[0]));

		size_t len = npp_mimetools.url.AsciiToUrl(pEncodedText, selectedText, encodeAll);
		size_t start = npp_api.pluginfunc.scintilla_msg.send_SCI_GETSELECTIONSTART(hCurrScintilla);
		size_t end = npp_api.pluginfunc.scintilla_msg.send_SCI_GETSELECTIONEND(hCurrScintilla);

		if (end < start) {
			size_t tmp = start;
			start = end;
			end = tmp;
		}

		npp_api.pluginfunc.scintilla_msg.send_SCI_SETTARGETSTART(hCurrScintilla, start);
		npp_api.pluginfunc.scintilla_msg.send_SCI_SETTARGETEND(hCurrScintilla, end);
		npp_api.pluginfunc.scintilla_msg.send_SCI_REPLACETARGET(hCurrScintilla, len, &(pEncodedText[0]));
		npp_api.pluginfunc.scintilla_msg.send_SCI_SETSEL(hCurrScintilla, start, start + len);
	}

extern (C)
nothrow
void convertURLDecode()

	body
	{
		static import core.stdc.string;
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.pluginfunc.scintilla_msg;
		static import npp_api.pluginfunc.string;
		static import npp_mimetools.url;

		core.sys.windows.windef.HWND hCurrScintilla = .getCurrentScintillaHandle();
		size_t bufLength = npp_api.pluginfunc.scintilla_msg.send_SCI_GETSELTEXT(hCurrScintilla);

		if (bufLength == 0) {
			return;
		}

		char[] selectedText = new char[bufLength];
		npp_api.pluginfunc.scintilla_msg.send_SCI_GETSELTEXT(hCurrScintilla, &(selectedText[0]));
		char[] pDecodedText = new char[bufLength];

		size_t len = npp_mimetools.url.UrlToAscii(pDecodedText, selectedText);

		if (len == 0) {
			core.sys.windows.winuser.MessageBoxW(nppData._nppHandle, &(npp_api.pluginfunc.string.c_wstring!(`Encoding Invalid!`)[0]), &(npp_api.pluginfunc.string.c_wstring!(`URL Decode`)[0]), core.sys.windows.winuser.MB_OK);
		} else {
			size_t start = npp_api.pluginfunc.scintilla_msg.send_SCI_GETSELECTIONSTART(hCurrScintilla);
			size_t end = npp_api.pluginfunc.scintilla_msg.send_SCI_GETSELECTIONEND(hCurrScintilla);

			if (end < start) {
				size_t tmp = start;
				start = end;
				end = tmp;
			}

			npp_api.pluginfunc.scintilla_msg.send_SCI_SETTARGETSTART(hCurrScintilla, start);
			npp_api.pluginfunc.scintilla_msg.send_SCI_SETTARGETEND(hCurrScintilla, end);
			npp_api.pluginfunc.scintilla_msg.send_SCI_REPLACETARGET(hCurrScintilla, len, &(pDecodedText[0]));
			npp_api.pluginfunc.scintilla_msg.send_SCI_SETSEL(hCurrScintilla, start, start + len);
		}
	}

enum qpOp
{
	qp_encode,
	qp_decode,
}

nothrow
void quotedPrintableConvert(.qpOp op)

	body
	{
		static import core.stdc.string;
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.pluginfunc.scintilla_msg;
		static import npp_api.pluginfunc.string;
		static import npp_mimetools.qp;

		core.sys.windows.windef.HWND hCurrScintilla = .getCurrentScintillaHandle();
		size_t bufLength = npp_api.pluginfunc.scintilla_msg.send_SCI_GETSELTEXT(hCurrScintilla);

		if (bufLength == 0) {
			return;
		}

		char[] selectedText = new char[bufLength];
		npp_api.pluginfunc.scintilla_msg.send_SCI_GETSELTEXT(hCurrScintilla, &(selectedText[0]));

		string qpText;
		npp_mimetools.qp.QuotedPrintable qp;

		if (op == .qpOp.qp_decode) {
			qpText = qp.decode(selectedText);

			if (qpText == null) {
				core.sys.windows.winuser.MessageBoxW(nppData._nppHandle, &(npp_api.pluginfunc.string.c_wstring!(`It's not a valid Quoted-printable text`)[0]), &(npp_api.pluginfunc.string.c_wstring!(`Quoted-printable decode error`)[0]), core.sys.windows.winuser.MB_OK);

				return;
			}
		} else {
			qpText = qp.encode(selectedText);
		}

		if (qpText ==  null) {
			core.sys.windows.winuser.MessageBoxW(nppData._nppHandle, &(npp_api.pluginfunc.string.c_wstring!(`Problem!`)[0]), &(npp_api.pluginfunc.string.c_wstring!(`Quoted-printable encoding`)[0]), core.sys.windows.winuser.MB_OK);
		} else {
			size_t start = npp_api.pluginfunc.scintilla_msg.send_SCI_GETSELECTIONSTART(hCurrScintilla);
			size_t end = npp_api.pluginfunc.scintilla_msg.send_SCI_GETSELECTIONEND(hCurrScintilla);

			if (end < start) {
				size_t tmp = start;
				start = end;
				end = tmp;
			}

			npp_api.pluginfunc.scintilla_msg.send_SCI_SETTARGETSTART(hCurrScintilla, start);
			npp_api.pluginfunc.scintilla_msg.send_SCI_SETTARGETEND(hCurrScintilla, end);
			npp_api.pluginfunc.scintilla_msg.send_SCI_REPLACETARGET(hCurrScintilla, core.stdc.string.strlen(&(qpText[0])), &(qpText[0]));
			npp_api.pluginfunc.scintilla_msg.send_SCI_SETSEL(hCurrScintilla, start, start + core.stdc.string.strlen(&(qpText[0])));
		}
	}

extern (C)
nothrow
void convertToAsciiFromQuotedPrintable()

	body
	{
		.quotedPrintableConvert(.qpOp.qp_decode);
	}

extern (C)
nothrow
void convertToQuotedPrintable()

	body
	{
		.quotedPrintableConvert(.qpOp.qp_encode);
	}

extern (Windows)
nothrow @nogc
core.sys.windows.windef.BOOL dlgProc(core.sys.windows.windef.HWND hwnd, core.sys.windows.windef.UINT message, core.sys.windows.windef.WPARAM wParam, core.sys.windows.windef.LPARAM lParam)

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;

		switch (message) {
			case core.sys.windows.winuser.WM_COMMAND:
				switch (core.sys.windows.windef.LOWORD(wParam)) {
					case core.sys.windows.winuser.IDCLOSE:
						core.sys.windows.winuser.EndDialog(hwnd, 0);

						return core.sys.windows.windef.TRUE;

					default:
						break;
				}

				return core.sys.windows.windef.FALSE;

			default:
				break;
		}

		return core.sys.windows.windef.FALSE;
	}

extern (C)
nothrow @nogc
void about()

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;

		core.sys.windows.windef.HWND hSelf = core.sys.windows.winuser.CreateDialogParamW(_hInst, core.sys.windows.winuser.MAKEINTRESOURCEW(.IDD_ABOUTBOX), nppData._nppHandle, cast(core.sys.windows.winuser.DLGPROC)(&.dlgProc), 0);

		// Go to center
		core.sys.windows.windef.RECT rc;
		core.sys.windows.winuser.GetClientRect(nppData._nppHandle, &rc);
		core.sys.windows.windef.POINT center;
		int w = rc.right - rc.left;
		int h = rc.bottom - rc.top;
		center.x = rc.left + w / 2;
		center.y = rc.top + h / 2;
		core.sys.windows.winuser.ClientToScreen(nppData._nppHandle, &center);

		core.sys.windows.windef.RECT dlgRect;
		core.sys.windows.winuser.GetClientRect(hSelf, &dlgRect);
		int x = center.x - (dlgRect.right - dlgRect.left) / 2;
		int y = center.y - (dlgRect.bottom - dlgRect.top) / 2;

		core.sys.windows.winuser.SetWindowPos(hSelf, core.sys.windows.winuser.HWND_TOP, x, y, (dlgRect.right - dlgRect.left), (dlgRect.bottom - dlgRect.top), core.sys.windows.winuser.SWP_SHOWWINDOW);
	}

extern (C)
nothrow
void convertSamlDecode()

	body
	{
		static import core.stdc.string;
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.pluginfunc.scintilla_msg;
		static import npp_api.pluginfunc.string;

		core.sys.windows.windef.HWND hCurrScintilla = .getCurrentScintillaHandle();
		size_t bufLength = npp_api.pluginfunc.scintilla_msg.send_SCI_GETSELTEXT(hCurrScintilla);

		if (bufLength == 0) {
			return;
		}

		char[] selectedText = new char[bufLength];
		char[] samlDecodedText = new char[npp_mimetools.saml.SAML_MESSAGE_MAX_SIZE];
		npp_api.pluginfunc.scintilla_msg.send_SCI_GETSELTEXT(hCurrScintilla, &(selectedText[0]));

		int len = npp_mimetools.saml.samlDecode(samlDecodedText, selectedText);

		switch (len) {
			case 0:
				core.sys.windows.winuser.MessageBoxW(nppData._nppHandle, &(npp_api.pluginfunc.string.c_wstring!(`SAML Decode returned zero size.`)[0]), &(npp_api.pluginfunc.string.c_wstring!(`SAML Decode`)[0]), core.sys.windows.winuser.MB_OK);

				break;

			case npp_mimetools.saml.SAML_DECODE_ERROR_URLDECODE:
				core.sys.windows.winuser.MessageBoxW(nppData._nppHandle, &(npp_api.pluginfunc.string.c_wstring!(`Could not URL Decode text.`)[0]), &(npp_api.pluginfunc.string.c_wstring!(`SAML Decode`)[0]), core.sys.windows.winuser.MB_OK);

				break;

			case npp_mimetools.saml.SAML_DECODE_ERROR_BASE64DECODE:
				core.sys.windows.winuser.MessageBoxW(nppData._nppHandle, &(npp_api.pluginfunc.string.c_wstring!(`Could not BASE64 Decode text after URL Decoding.`)[0]), &(npp_api.pluginfunc.string.c_wstring!(`SAML Decode`)[0]), core.sys.windows.winuser.MB_OK);

				break;

			case npp_mimetools.saml.SAML_DECODE_ERROR_INFLATE:
				core.sys.windows.winuser.MessageBoxW(nppData._nppHandle, &(npp_api.pluginfunc.string.c_wstring!(`Could not inflate text after BASE64 Decoding.`)[0]), &(npp_api.pluginfunc.string.c_wstring!(`SAML Decode`)[0]), core.sys.windows.winuser.MB_OK);

				break;

			default:
				size_t start = npp_api.pluginfunc.scintilla_msg.send_SCI_GETSELECTIONSTART(hCurrScintilla);
				size_t end = npp_api.pluginfunc.scintilla_msg.send_SCI_GETSELECTIONEND(hCurrScintilla);

				if (end < start) {
					size_t tmp = start;
					start = end;
					end = tmp;
				}

				npp_api.pluginfunc.scintilla_msg.send_SCI_SETTARGETSTART(hCurrScintilla, start);
				npp_api.pluginfunc.scintilla_msg.send_SCI_SETTARGETEND(hCurrScintilla, end);
				npp_api.pluginfunc.scintilla_msg.send_SCI_REPLACETARGET(hCurrScintilla, len, &(samlDecodedText[0]));
				npp_api.pluginfunc.scintilla_msg.send_SCI_SETSEL(hCurrScintilla, start, start + len);
		}
	}

mixin npp_api.pluginfunc.basic_interface.npp_plugin_interface!(PLUGIN_NAME, .main_menu_items_def);
