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
 * scintilla message wrapper
 *
 * See_Also:
 *      https://www.scintilla.org/ScintillaDoc.html
 *
 * ToDo: recheck
 * Author: dokutoku, https://twitter.com/dokutoku3
 * License: GPL-2.0 or later
 */
module npp_api.pluginfunc.scintilla_msg;


version (Windows):

private static import core.stdc.stdint;
private static import core.sys.windows.windef;
private static import core.sys.windows.winuser;
private static import npp_api.scintilla.scintilla;

alias position = core.stdc.stdint.intptr_t;
alias line = core.stdc.stdint.intptr_t;
alias pointer = void*;

//ToDo:
alias colour = void*;

//alias alpha = ;

pragma(inline, true):
nothrow @nogc:

/+
void send_SCI_START(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_START, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_OPTIONAL_START(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_OPTIONAL_START, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_LEXER_START(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_LEXER_START, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

void send_SCI_ADDTEXT(core.sys.windows.windef.HWND _scintillaHandle, .position length, const char* text)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_ADDTEXT, cast(core.sys.windows.windef.WPARAM)(length), cast(core.sys.windows.windef.LPARAM)(text));
	}

/+
void send_SCI_ADDSTYLEDTEXT(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_ADDSTYLEDTEXT, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

void send_SCI_INSERTTEXT(core.sys.windows.windef.HWND _scintillaHandle, .position pos, const char* text)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_INSERTTEXT, cast(core.sys.windows.windef.WPARAM)(pos), cast(core.sys.windows.windef.LPARAM)(text));
	}

void send_SCI_CHANGEINSERTION(core.sys.windows.windef.HWND _scintillaHandle, .position length, const char* text)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_CHANGEINSERTION, cast(core.sys.windows.windef.WPARAM)(length), cast(core.sys.windows.windef.LPARAM)(text));
	}

void send_SCI_CLEARALL(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_CLEARALL, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}

/+
void send_SCI_DELETERANGE(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_DELETERANGE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_CLEARDOCUMENTSTYLE(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_CLEARDOCUMENTSTYLE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

.position send_SCI_GETLENGTH(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(.position)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETLENGTH, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

core.stdc.stdint.intptr_t send_SCI_GETCHARAT(core.sys.windows.windef.HWND _scintillaHandle, .position pos)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETCHARAT, cast(core.sys.windows.windef.WPARAM)(pos), cast(core.sys.windows.windef.LPARAM)(0)));
	}

.position send_SCI_GETCURRENTPOS(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(.position)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETCURRENTPOS, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

.position send_SCI_GETANCHOR(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(.position)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETANCHOR, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

core.stdc.stdint.intptr_t send_SCI_GETSTYLEAT(core.sys.windows.windef.HWND _scintillaHandle, .position pos)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETSTYLEAT, cast(core.sys.windows.windef.WPARAM)(pos), cast(core.sys.windows.windef.LPARAM)(0)));
	}

void send_SCI_REDO(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_REDO, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}

/+
void send_SCI_SETUNDOCOLLECTION(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETUNDOCOLLECTION, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_SELECTALL(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SELECTALL, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_SETSAVEPOINT(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETSAVEPOINT, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

.position send_SCI_GETSTYLEDTEXT(core.sys.windows.windef.HWND _scintillaHandle, ref npp_api.scintilla.scintilla.Sci_TextRange tr)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(.position)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETSTYLEDTEXT, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(&tr)));
	}

bool send_SCI_CANREDO(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(bool)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_CANREDO, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

core.stdc.stdint.intptr_t send_SCI_MARKERLINEFROMHANDLE(core.sys.windows.windef.HWND _scintillaHandle, core.stdc.stdint.intptr_t markerHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_MARKERLINEFROMHANDLE, cast(core.sys.windows.windef.WPARAM)(markerHandle), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_MARKERDELETEHANDLE(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_MARKERDELETEHANDLE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

bool send_SCI_GETUNDOCOLLECTION(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(bool)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETUNDOCOLLECTION, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

core.stdc.stdint.intptr_t send_SCI_GETVIEWWS(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETVIEWWS, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_SETVIEWWS(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETVIEWWS, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

core.stdc.stdint.intptr_t send_SCI_GETTABDRAWMODE(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETTABDRAWMODE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_SETTABDRAWMODE(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETTABDRAWMODE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

.position send_SCI_POSITIONFROMPOINT(core.sys.windows.windef.HWND _scintillaHandle, core.stdc.stdint.intptr_t x, core.stdc.stdint.intptr_t y)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(.position)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_POSITIONFROMPOINT, cast(core.sys.windows.windef.WPARAM)(x), cast(core.sys.windows.windef.LPARAM)(y)));
	}

.position send_SCI_POSITIONFROMPOINTCLOSE(core.sys.windows.windef.HWND _scintillaHandle, core.stdc.stdint.intptr_t x, core.stdc.stdint.intptr_t y)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(.position)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_POSITIONFROMPOINTCLOSE, cast(core.sys.windows.windef.WPARAM)(x), cast(core.sys.windows.windef.LPARAM)(y)));
	}

void send_SCI_GOTOLINE(core.sys.windows.windef.HWND _scintillaHandle, .line line)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GOTOLINE, cast(core.sys.windows.windef.WPARAM)(line), cast(core.sys.windows.windef.LPARAM)(0));
	}

void send_SCI_GOTOPOS(core.sys.windows.windef.HWND _scintillaHandle, .position caret)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GOTOPOS, cast(core.sys.windows.windef.WPARAM)(caret), cast(core.sys.windows.windef.LPARAM)(0));
	}

/+
void send_SCI_SETANCHOR(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETANCHOR, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

.position send_SCI_GETCURLINE(core.sys.windows.windef.HWND _scintillaHandle, .position length, char* text)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(.position)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETCURLINE, cast(core.sys.windows.windef.WPARAM)(length), cast(core.sys.windows.windef.LPARAM)(text)));
	}

.position send_SCI_GETENDSTYLED(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(.position)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETENDSTYLED, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_CONVERTEOLS(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_CONVERTEOLS, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

core.stdc.stdint.intptr_t send_SCI_GETEOLMODE(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETEOLMODE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_SETEOLMODE(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETEOLMODE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_STARTSTYLING(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_STARTSTYLING, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_SETSTYLING(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETSTYLING, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

bool send_SCI_GETBUFFEREDDRAW(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(bool)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETBUFFEREDDRAW, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_SETBUFFEREDDRAW(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETBUFFEREDDRAW, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_SETTABWIDTH(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETTABWIDTH, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

core.stdc.stdint.intptr_t send_SCI_GETTABWIDTH(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETTABWIDTH, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_CLEARTABSTOPS(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_CLEARTABSTOPS, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_ADDTABSTOP(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_ADDTABSTOP, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

core.stdc.stdint.intptr_t send_SCI_GETNEXTTABSTOP(core.sys.windows.windef.HWND _scintillaHandle, .line line, core.stdc.stdint.intptr_t x)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETNEXTTABSTOP, cast(core.sys.windows.windef.WPARAM)(line), cast(core.sys.windows.windef.LPARAM)(x)));
	}

/+
void send_SCI_SETCODEPAGE(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETCODEPAGE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

core.stdc.stdint.intptr_t send_SCI_GETIMEINTERACTION(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETIMEINTERACTION, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_SETIMEINTERACTION(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETIMEINTERACTION, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_MARKERDEFINE(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_MARKERDEFINE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_MARKERSETFORE(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_MARKERSETFORE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_MARKERSETBACK(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_MARKERSETBACK, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_MARKERSETBACKSELECTED(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_MARKERSETBACKSELECTED, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_MARKERENABLEHIGHLIGHT(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_MARKERENABLEHIGHLIGHT, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

core.stdc.stdint.intptr_t send_SCI_MARKERADD(core.sys.windows.windef.HWND _scintillaHandle, .line line, core.stdc.stdint.intptr_t markerNumber)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_MARKERADD, cast(core.sys.windows.windef.WPARAM)(line), cast(core.sys.windows.windef.LPARAM)(markerNumber)));
	}

/+
void send_SCI_MARKERDELETE(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_MARKERDELETE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_MARKERDELETEALL(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_MARKERDELETEALL, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

core.stdc.stdint.intptr_t send_SCI_MARKERGET(core.sys.windows.windef.HWND _scintillaHandle, .line line)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_MARKERGET, cast(core.sys.windows.windef.WPARAM)(line), cast(core.sys.windows.windef.LPARAM)(0)));
	}

.line send_SCI_MARKERNEXT(core.sys.windows.windef.HWND _scintillaHandle, .line lineStart, core.stdc.stdint.intptr_t markerMask)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(.line)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_MARKERNEXT, cast(core.sys.windows.windef.WPARAM)(lineStart), cast(core.sys.windows.windef.LPARAM)(markerMask)));
	}

.line send_SCI_MARKERPREVIOUS(core.sys.windows.windef.HWND _scintillaHandle, .line lineStart, core.stdc.stdint.intptr_t markerMask)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(.line)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_MARKERPREVIOUS, cast(core.sys.windows.windef.WPARAM)(lineStart), cast(core.sys.windows.windef.LPARAM)(markerMask)));
	}

/+
void send_SCI_MARKERDEFINEPIXMAP(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_MARKERDEFINEPIXMAP, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_MARKERADDSET(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_MARKERADDSET, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_MARKERSETALPHA(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_MARKERSETALPHA, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_SETMARGINTYPEN(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETMARGINTYPEN, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

core.stdc.stdint.intptr_t send_SCI_GETMARGINTYPEN(core.sys.windows.windef.HWND _scintillaHandle, core.stdc.stdint.intptr_t margin)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETMARGINTYPEN, cast(core.sys.windows.windef.WPARAM)(margin), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_SETMARGINWIDTHN(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETMARGINWIDTHN, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

core.stdc.stdint.intptr_t send_SCI_GETMARGINWIDTHN(core.sys.windows.windef.HWND _scintillaHandle, core.stdc.stdint.intptr_t margin)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETMARGINWIDTHN, cast(core.sys.windows.windef.WPARAM)(margin), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_SETMARGINMASKN(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETMARGINMASKN, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

core.stdc.stdint.intptr_t send_SCI_GETMARGINMASKN(core.sys.windows.windef.HWND _scintillaHandle, core.stdc.stdint.intptr_t margin)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETMARGINMASKN, cast(core.sys.windows.windef.WPARAM)(margin), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_SETMARGINSENSITIVEN(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETMARGINSENSITIVEN, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

bool send_SCI_GETMARGINSENSITIVEN(core.sys.windows.windef.HWND _scintillaHandle, core.stdc.stdint.intptr_t margin)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(bool)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETMARGINSENSITIVEN, cast(core.sys.windows.windef.WPARAM)(margin), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_SETMARGINCURSORN(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETMARGINCURSORN, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

core.stdc.stdint.intptr_t send_SCI_GETMARGINCURSORN(core.sys.windows.windef.HWND _scintillaHandle, core.stdc.stdint.intptr_t margin)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETMARGINCURSORN, cast(core.sys.windows.windef.WPARAM)(margin), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_SETMARGINBACKN(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETMARGINBACKN, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

.colour send_SCI_GETMARGINBACKN(core.sys.windows.windef.HWND _scintillaHandle, core.stdc.stdint.intptr_t margin)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(.colour)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETMARGINBACKN, cast(core.sys.windows.windef.WPARAM)(margin), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_SETMARGINS(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETMARGINS, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

core.stdc.stdint.intptr_t send_SCI_GETMARGINS(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETMARGINS, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_STYLECLEARALL(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_STYLECLEARALL, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_STYLESETFORE(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_STYLESETFORE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_STYLESETBACK(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_STYLESETBACK, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_STYLESETBOLD(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_STYLESETBOLD, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_STYLESETITALIC(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_STYLESETITALIC, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_STYLESETSIZE(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_STYLESETSIZE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_STYLESETFONT(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_STYLESETFONT, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_STYLESETEOLFILLED(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_STYLESETEOLFILLED, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_STYLERESETDEFAULT(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_STYLERESETDEFAULT, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_STYLESETUNDERLINE(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_STYLESETUNDERLINE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

.colour send_SCI_STYLEGETFORE(core.sys.windows.windef.HWND _scintillaHandle, core.stdc.stdint.intptr_t style)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(.colour)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_STYLEGETFORE, cast(core.sys.windows.windef.WPARAM)(style), cast(core.sys.windows.windef.LPARAM)(0)));
	}

.colour send_SCI_STYLEGETBACK(core.sys.windows.windef.HWND _scintillaHandle, core.stdc.stdint.intptr_t style)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(.colour)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_STYLEGETBACK, cast(core.sys.windows.windef.WPARAM)(style), cast(core.sys.windows.windef.LPARAM)(0)));
	}

bool send_SCI_STYLEGETBOLD(core.sys.windows.windef.HWND _scintillaHandle, core.stdc.stdint.intptr_t style)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(bool)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_STYLEGETBOLD, cast(core.sys.windows.windef.WPARAM)(style), cast(core.sys.windows.windef.LPARAM)(0)));
	}

bool send_SCI_STYLEGETITALIC(core.sys.windows.windef.HWND _scintillaHandle, core.stdc.stdint.intptr_t style)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(bool)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_STYLEGETITALIC, cast(core.sys.windows.windef.WPARAM)(style), cast(core.sys.windows.windef.LPARAM)(0)));
	}

core.stdc.stdint.intptr_t send_SCI_STYLEGETSIZE(core.sys.windows.windef.HWND _scintillaHandle, core.stdc.stdint.intptr_t style)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_STYLEGETSIZE, cast(core.sys.windows.windef.WPARAM)(style), cast(core.sys.windows.windef.LPARAM)(0)));
	}

core.stdc.stdint.intptr_t send_SCI_STYLEGETFONT(core.sys.windows.windef.HWND _scintillaHandle, core.stdc.stdint.intptr_t style, char* tags)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_STYLEGETFONT, cast(core.sys.windows.windef.WPARAM)(style), cast(core.sys.windows.windef.LPARAM)(tags)));
	}

bool send_SCI_STYLEGETEOLFILLED(core.sys.windows.windef.HWND _scintillaHandle, core.stdc.stdint.intptr_t style)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(bool)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_STYLEGETEOLFILLED, cast(core.sys.windows.windef.WPARAM)(style), cast(core.sys.windows.windef.LPARAM)(0)));
	}

bool send_SCI_STYLEGETUNDERLINE(core.sys.windows.windef.HWND _scintillaHandle, core.stdc.stdint.intptr_t style)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(bool)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_STYLEGETUNDERLINE, cast(core.sys.windows.windef.WPARAM)(style), cast(core.sys.windows.windef.LPARAM)(0)));
	}

core.stdc.stdint.intptr_t send_SCI_STYLEGETCASE(core.sys.windows.windef.HWND _scintillaHandle, core.stdc.stdint.intptr_t style)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_STYLEGETCASE, cast(core.sys.windows.windef.WPARAM)(style), cast(core.sys.windows.windef.LPARAM)(0)));
	}

core.stdc.stdint.intptr_t send_SCI_STYLEGETCHARACTERSET(core.sys.windows.windef.HWND _scintillaHandle, core.stdc.stdint.intptr_t style)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_STYLEGETCHARACTERSET, cast(core.sys.windows.windef.WPARAM)(style), cast(core.sys.windows.windef.LPARAM)(0)));
	}

bool send_SCI_STYLEGETVISIBLE(core.sys.windows.windef.HWND _scintillaHandle, core.stdc.stdint.intptr_t style)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(bool)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_STYLEGETVISIBLE, cast(core.sys.windows.windef.WPARAM)(style), cast(core.sys.windows.windef.LPARAM)(0)));
	}

bool send_SCI_STYLEGETCHANGEABLE(core.sys.windows.windef.HWND _scintillaHandle, core.stdc.stdint.intptr_t style)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(bool)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_STYLEGETCHANGEABLE, cast(core.sys.windows.windef.WPARAM)(style), cast(core.sys.windows.windef.LPARAM)(0)));
	}

bool send_SCI_STYLEGETHOTSPOT(core.sys.windows.windef.HWND _scintillaHandle, core.stdc.stdint.intptr_t style)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(bool)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_STYLEGETHOTSPOT, cast(core.sys.windows.windef.WPARAM)(style), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_STYLESETCASE(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_STYLESETCASE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_STYLESETSIZEFRACTIONAL(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_STYLESETSIZEFRACTIONAL, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

core.stdc.stdint.intptr_t send_SCI_STYLEGETSIZEFRACTIONAL(core.sys.windows.windef.HWND _scintillaHandle, core.stdc.stdint.intptr_t style)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_STYLEGETSIZEFRACTIONAL, cast(core.sys.windows.windef.WPARAM)(style), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_STYLESETWEIGHT(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_STYLESETWEIGHT, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

core.stdc.stdint.intptr_t send_SCI_STYLEGETWEIGHT(core.sys.windows.windef.HWND _scintillaHandle, core.stdc.stdint.intptr_t style)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_STYLEGETWEIGHT, cast(core.sys.windows.windef.WPARAM)(style), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_STYLESETCHARACTERSET(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_STYLESETCHARACTERSET, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_STYLESETHOTSPOT(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_STYLESETHOTSPOT, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_SETSELFORE(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETSELFORE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_SETSELBACK(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETSELBACK, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

core.stdc.stdint.intptr_t send_SCI_GETSELALPHA(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETSELALPHA, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_SETSELALPHA(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETSELALPHA, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

bool send_SCI_GETSELEOLFILLED(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(bool)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETSELEOLFILLED, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_SETSELEOLFILLED(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETSELEOLFILLED, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_SETCARETFORE(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETCARETFORE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_ASSIGNCMDKEY(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_ASSIGNCMDKEY, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_CLEARCMDKEY(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_CLEARCMDKEY, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_CLEARALLCMDKEYS(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_CLEARALLCMDKEYS, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_SETSTYLINGEX(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETSTYLINGEX, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_STYLESETVISIBLE(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_STYLESETVISIBLE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

core.stdc.stdint.intptr_t send_SCI_GETCARETPERIOD(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETCARETPERIOD, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_SETCARETPERIOD(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETCARETPERIOD, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_SETWORDCHARS(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETWORDCHARS, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

core.stdc.stdint.intptr_t send_SCI_GETWORDCHARS(core.sys.windows.windef.HWND _scintillaHandle, char* characters)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETWORDCHARS, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(characters)));
	}

void send_SCI_BEGINUNDOACTION(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_BEGINUNDOACTION, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}

void send_SCI_ENDUNDOACTION(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_ENDUNDOACTION, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}

/+
void send_SCI_INDICSETSTYLE(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_INDICSETSTYLE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

core.stdc.stdint.intptr_t send_SCI_INDICGETSTYLE(core.sys.windows.windef.HWND _scintillaHandle, core.stdc.stdint.intptr_t indicator)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_INDICGETSTYLE, cast(core.sys.windows.windef.WPARAM)(indicator), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_INDICSETFORE(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_INDICSETFORE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

.colour send_SCI_INDICGETFORE(core.sys.windows.windef.HWND _scintillaHandle, core.stdc.stdint.intptr_t indicator)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(.colour)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_INDICGETFORE, cast(core.sys.windows.windef.WPARAM)(indicator), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_INDICSETUNDER(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_INDICSETUNDER, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

bool send_SCI_INDICGETUNDER(core.sys.windows.windef.HWND _scintillaHandle, core.stdc.stdint.intptr_t indicator)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(bool)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_INDICGETUNDER, cast(core.sys.windows.windef.WPARAM)(indicator), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_INDICSETHOVERSTYLE(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_INDICSETHOVERSTYLE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

core.stdc.stdint.intptr_t send_SCI_INDICGETHOVERSTYLE(core.sys.windows.windef.HWND _scintillaHandle, core.stdc.stdint.intptr_t indicator)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_INDICGETHOVERSTYLE, cast(core.sys.windows.windef.WPARAM)(indicator), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_INDICSETHOVERFORE(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_INDICSETHOVERFORE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

.colour send_SCI_INDICGETHOVERFORE(core.sys.windows.windef.HWND _scintillaHandle, core.stdc.stdint.intptr_t indicator)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(.colour)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_INDICGETHOVERFORE, cast(core.sys.windows.windef.WPARAM)(indicator), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_INDICSETFLAGS(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_INDICSETFLAGS, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

core.stdc.stdint.intptr_t send_SCI_INDICGETFLAGS(core.sys.windows.windef.HWND _scintillaHandle, core.stdc.stdint.intptr_t indicator)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_INDICGETFLAGS, cast(core.sys.windows.windef.WPARAM)(indicator), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_SETWHITESPACEFORE(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETWHITESPACEFORE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_SETWHITESPACEBACK(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETWHITESPACEBACK, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_SETWHITESPACESIZE(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETWHITESPACESIZE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

core.stdc.stdint.intptr_t send_SCI_GETWHITESPACESIZE(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETWHITESPACESIZE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_SETLINESTATE(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETLINESTATE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

core.stdc.stdint.intptr_t send_SCI_GETLINESTATE(core.sys.windows.windef.HWND _scintillaHandle, .line line)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETLINESTATE, cast(core.sys.windows.windef.WPARAM)(line), cast(core.sys.windows.windef.LPARAM)(0)));
	}

core.stdc.stdint.intptr_t send_SCI_GETMAXLINESTATE(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETMAXLINESTATE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

bool send_SCI_GETCARETLINEVISIBLE(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(bool)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETCARETLINEVISIBLE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_SETCARETLINEVISIBLE(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETCARETLINEVISIBLE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

.colour send_SCI_GETCARETLINEBACK(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(.colour)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETCARETLINEBACK, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_SETCARETLINEBACK(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETCARETLINEBACK, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

core.stdc.stdint.intptr_t send_SCI_GETCARETLINEFRAME(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETCARETLINEFRAME, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_SETCARETLINEFRAME(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETCARETLINEFRAME, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_STYLESETCHANGEABLE(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_STYLESETCHANGEABLE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_AUTOCSHOW(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_AUTOCSHOW, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_AUTOCCANCEL(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_AUTOCCANCEL, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

bool send_SCI_AUTOCACTIVE(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(bool)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_AUTOCACTIVE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

.position send_SCI_AUTOCPOSSTART(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(.position)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_AUTOCPOSSTART, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_AUTOCCOMPLETE(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_AUTOCCOMPLETE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_AUTOCSTOPS(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_AUTOCSTOPS, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_AUTOCSETSEPARATOR(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_AUTOCSETSEPARATOR, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

core.stdc.stdint.intptr_t send_SCI_AUTOCGETSEPARATOR(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_AUTOCGETSEPARATOR, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_AUTOCSELECT(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_AUTOCSELECT, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_AUTOCSETCANCELATSTART(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_AUTOCSETCANCELATSTART, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

bool send_SCI_AUTOCGETCANCELATSTART(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(bool)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_AUTOCGETCANCELATSTART, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_AUTOCSETFILLUPS(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_AUTOCSETFILLUPS, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_AUTOCSETCHOOSESINGLE(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_AUTOCSETCHOOSESINGLE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

bool send_SCI_AUTOCGETCHOOSESINGLE(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(bool)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_AUTOCGETCHOOSESINGLE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_AUTOCSETIGNORECASE(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_AUTOCSETIGNORECASE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

bool send_SCI_AUTOCGETIGNORECASE(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(bool)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_AUTOCGETIGNORECASE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_USERLISTSHOW(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_USERLISTSHOW, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_AUTOCSETAUTOHIDE(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_AUTOCSETAUTOHIDE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

bool send_SCI_AUTOCGETAUTOHIDE(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(bool)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_AUTOCGETAUTOHIDE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_AUTOCSETDROPRESTOFWORD(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_AUTOCSETDROPRESTOFWORD, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

bool send_SCI_AUTOCGETDROPRESTOFWORD(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(bool)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_AUTOCGETDROPRESTOFWORD, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_REGISTERIMAGE(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_REGISTERIMAGE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_CLEARREGISTEREDIMAGES(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_CLEARREGISTEREDIMAGES, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

core.stdc.stdint.intptr_t send_SCI_AUTOCGETTYPESEPARATOR(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_AUTOCGETTYPESEPARATOR, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_AUTOCSETTYPESEPARATOR(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_AUTOCSETTYPESEPARATOR, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_AUTOCSETMAXWIDTH(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_AUTOCSETMAXWIDTH, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

core.stdc.stdint.intptr_t send_SCI_AUTOCGETMAXWIDTH(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_AUTOCGETMAXWIDTH, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_AUTOCSETMAXHEIGHT(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_AUTOCSETMAXHEIGHT, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

core.stdc.stdint.intptr_t send_SCI_AUTOCGETMAXHEIGHT(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_AUTOCGETMAXHEIGHT, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_SETINDENT(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETINDENT, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

core.stdc.stdint.intptr_t send_SCI_GETINDENT(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETINDENT, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_SETUSETABS(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETUSETABS, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

bool send_SCI_GETUSETABS(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(bool)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETUSETABS, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_SETLINEINDENTATION(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETLINEINDENTATION, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

core.stdc.stdint.intptr_t send_SCI_GETLINEINDENTATION(core.sys.windows.windef.HWND _scintillaHandle, .line line)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETLINEINDENTATION, cast(core.sys.windows.windef.WPARAM)(line), cast(core.sys.windows.windef.LPARAM)(0)));
	}

.position send_SCI_GETLINEINDENTPOSITION(core.sys.windows.windef.HWND _scintillaHandle, .line line)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(.position)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETLINEINDENTPOSITION, cast(core.sys.windows.windef.WPARAM)(line), cast(core.sys.windows.windef.LPARAM)(0)));
	}

.position send_SCI_GETCOLUMN(core.sys.windows.windef.HWND _scintillaHandle, .position pos)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(.position)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETCOLUMN, cast(core.sys.windows.windef.WPARAM)(pos), cast(core.sys.windows.windef.LPARAM)(0)));
	}

.position send_SCI_COUNTCHARACTERS(core.sys.windows.windef.HWND _scintillaHandle, .position start, .position end)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(.position)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_COUNTCHARACTERS, cast(core.sys.windows.windef.WPARAM)(start), cast(core.sys.windows.windef.LPARAM)(end)));
	}

.position send_SCI_COUNTCODEUNITS(core.sys.windows.windef.HWND _scintillaHandle, .position start, .position end)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(.position)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_COUNTCODEUNITS, cast(core.sys.windows.windef.WPARAM)(start), cast(core.sys.windows.windef.LPARAM)(end)));
	}

/+
void send_SCI_SETHSCROLLBAR(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETHSCROLLBAR, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

bool send_SCI_GETHSCROLLBAR(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(bool)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETHSCROLLBAR, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_SETINDENTATIONGUIDES(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETINDENTATIONGUIDES, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

core.stdc.stdint.intptr_t send_SCI_GETINDENTATIONGUIDES(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETINDENTATIONGUIDES, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_SETHIGHLIGHTGUIDE(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETHIGHLIGHTGUIDE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

.position send_SCI_GETHIGHLIGHTGUIDE(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(.position)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETHIGHLIGHTGUIDE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

.position send_SCI_GETLINEENDPOSITION(core.sys.windows.windef.HWND _scintillaHandle, .line line)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(.position)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETLINEENDPOSITION, cast(core.sys.windows.windef.WPARAM)(line), cast(core.sys.windows.windef.LPARAM)(0)));
	}

core.stdc.stdint.intptr_t send_SCI_GETCODEPAGE(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETCODEPAGE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

.colour send_SCI_GETCARETFORE(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(.colour)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETCARETFORE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

bool send_SCI_GETREADONLY(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(bool)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETREADONLY, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_SETCURRENTPOS(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETCURRENTPOS, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_SETSELECTIONSTART(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETSELECTIONSTART, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

.position send_SCI_GETSELECTIONSTART(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(.position)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETSELECTIONSTART, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_SETSELECTIONEND(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETSELECTIONEND, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

.position send_SCI_GETSELECTIONEND(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(.position)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETSELECTIONEND, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_SETEMPTYSELECTION(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETEMPTYSELECTION, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_SETPRINTMAGNIFICATION(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETPRINTMAGNIFICATION, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

core.stdc.stdint.intptr_t send_SCI_GETPRINTMAGNIFICATION(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETPRINTMAGNIFICATION, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_SETPRINTCOLOURMODE(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETPRINTCOLOURMODE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

core.stdc.stdint.intptr_t send_SCI_GETPRINTCOLOURMODE(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETPRINTCOLOURMODE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

.position send_SCI_FINDTEXT(core.sys.windows.windef.HWND _scintillaHandle, core.stdc.stdint.intptr_t searchFlags, ref npp_api.scintilla.scintilla.Sci_TextToFind ft)

	in
	{
		static import core.sys.windows.windef;
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(.position)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_FINDTEXT, cast(core.sys.windows.windef.WPARAM)(searchFlags), cast(core.sys.windows.windef.LPARAM)(&ft)));
	}

.position send_SCI_FORMATRANGE(core.sys.windows.windef.HWND _scintillaHandle, bool draw, ref npp_api.scintilla.scintilla.Sci_RangeToFormat fr)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(.position)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_FORMATRANGE, cast(core.sys.windows.windef.WPARAM)(draw), cast(core.sys.windows.windef.LPARAM)(&fr)));
	}

.line send_SCI_GETFIRSTVISIBLELINE(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(.line)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETFIRSTVISIBLELINE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

.position send_SCI_GETLINE(core.sys.windows.windef.HWND _scintillaHandle, .line line, char* text)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(.position)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETLINE, cast(core.sys.windows.windef.WPARAM)(line), cast(core.sys.windows.windef.LPARAM)(text)));
	}

.line send_SCI_GETLINECOUNT(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(.line)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETLINECOUNT, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_SETMARGINLEFT(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETMARGINLEFT, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

core.stdc.stdint.intptr_t send_SCI_GETMARGINLEFT(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETMARGINLEFT, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_SETMARGINRIGHT(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETMARGINRIGHT, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

core.stdc.stdint.intptr_t send_SCI_GETMARGINRIGHT(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETMARGINRIGHT, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

bool send_SCI_GETMODIFY(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(bool)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETMODIFY, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

void send_SCI_SETSEL(core.sys.windows.windef.HWND _scintillaHandle, .position anchor, .position caret)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETSEL, cast(core.sys.windows.windef.WPARAM)(anchor), cast(core.sys.windows.windef.LPARAM)(caret));
	}

.position send_SCI_GETSELTEXT(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(.position)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETSELTEXT, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

.position send_SCI_GETSELTEXT(core.sys.windows.windef.HWND _scintillaHandle, char* text)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(.position)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETSELTEXT, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(text)));
	}

.position send_SCI_GETTEXTRANGE(core.sys.windows.windef.HWND _scintillaHandle, ref npp_api.scintilla.scintilla.Sci_TextRange tr)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(.position)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETTEXTRANGE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(&tr)));
	}

/+
void send_SCI_HIDESELECTION(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_HIDESELECTION, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

core.stdc.stdint.intptr_t send_SCI_POINTXFROMPOSITION(core.sys.windows.windef.HWND _scintillaHandle, .position pos)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_POINTXFROMPOSITION, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(pos)));
	}

core.stdc.stdint.intptr_t send_SCI_POINTYFROMPOSITION(core.sys.windows.windef.HWND _scintillaHandle, .position pos)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_POINTYFROMPOSITION, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(pos)));
	}

.line send_SCI_LINEFROMPOSITION(core.sys.windows.windef.HWND _scintillaHandle, .position pos)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(.line)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_LINEFROMPOSITION, cast(core.sys.windows.windef.WPARAM)(pos), cast(core.sys.windows.windef.LPARAM)(0)));
	}

.position send_SCI_POSITIONFROMLINE(core.sys.windows.windef.HWND _scintillaHandle, .line line)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(.position)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_POSITIONFROMLINE, cast(core.sys.windows.windef.WPARAM)(line), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_LINESCROLL(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_LINESCROLL, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_SCROLLCARET(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SCROLLCARET, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_SCROLLRANGE(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SCROLLRANGE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

void send_SCI_REPLACESEL(core.sys.windows.windef.HWND _scintillaHandle, const char* text)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_REPLACESEL, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(text));
	}

/+
void send_SCI_SETREADONLY(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETREADONLY, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_NULL(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_NULL, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

bool send_SCI_CANPASTE(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(bool)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_CANPASTE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

bool send_SCI_CANUNDO(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(bool)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_CANUNDO, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_EMPTYUNDOBUFFER(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_EMPTYUNDOBUFFER, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

void send_SCI_UNDO(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_UNDO, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}

void send_SCI_CUT(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_CUT, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}

void send_SCI_COPY(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_COPY, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}

void send_SCI_PASTE(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_PASTE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}

void send_SCI_CLEAR(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_CLEAR, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}

void send_SCI_SETTEXT(core.sys.windows.windef.HWND _scintillaHandle, const char* text)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETTEXT, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(text));
	}

.position send_SCI_GETTEXT(core.sys.windows.windef.HWND _scintillaHandle, .position length, char* text)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(.position)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETTEXT, cast(core.sys.windows.windef.WPARAM)(length), cast(core.sys.windows.windef.LPARAM)(text)));
	}

.position send_SCI_GETTEXTLENGTH(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(.position)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETTEXTLENGTH, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

.pointer send_SCI_GETDIRECTFUNCTION(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(.pointer)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETDIRECTFUNCTION, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

.pointer send_SCI_GETDIRECTPOINTER(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(.pointer)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETDIRECTPOINTER, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_SETOVERTYPE(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETOVERTYPE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

bool send_SCI_GETOVERTYPE(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(bool)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETOVERTYPE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_SETCARETWIDTH(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETCARETWIDTH, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

core.stdc.stdint.intptr_t send_SCI_GETCARETWIDTH(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETCARETWIDTH, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

void send_SCI_SETTARGETSTART(core.sys.windows.windef.HWND _scintillaHandle, .position start)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETTARGETSTART, cast(core.sys.windows.windef.WPARAM)(start), cast(core.sys.windows.windef.LPARAM)(0));
	}

.position send_SCI_GETTARGETSTART(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(.position)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETTARGETSTART, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

void send_SCI_SETTARGETEND(core.sys.windows.windef.HWND _scintillaHandle, .position end)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETTARGETEND, cast(core.sys.windows.windef.WPARAM)(end), cast(core.sys.windows.windef.LPARAM)(0));
	}

.position send_SCI_GETTARGETEND(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(.position)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETTARGETEND, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_SETTARGETRANGE(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETTARGETRANGE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

.position send_SCI_GETTARGETTEXT(core.sys.windows.windef.HWND _scintillaHandle, char* text)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(.position)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETTARGETTEXT, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(text)));
	}

void send_SCI_TARGETFROMSELECTION(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_TARGETFROMSELECTION, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}

/+
void send_SCI_TARGETWHOLEDOCUMENT(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_TARGETWHOLEDOCUMENT, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

.position send_SCI_REPLACETARGET(core.sys.windows.windef.HWND _scintillaHandle, .position length, const (char)* text)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(.position)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_REPLACETARGET, cast(core.sys.windows.windef.WPARAM)(length), cast(core.sys.windows.windef.LPARAM)(text)));
	}

.position send_SCI_REPLACETARGETRE(core.sys.windows.windef.HWND _scintillaHandle, .position length, const (char)* text)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(.position)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_REPLACETARGETRE, cast(core.sys.windows.windef.WPARAM)(length), cast(core.sys.windows.windef.LPARAM)(text)));
	}

.position send_SCI_SEARCHINTARGET(core.sys.windows.windef.HWND _scintillaHandle, .position length, const (char)* text)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(.position)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SEARCHINTARGET, cast(core.sys.windows.windef.WPARAM)(length), cast(core.sys.windows.windef.LPARAM)(text)));
	}

/+
void send_SCI_SETSEARCHFLAGS(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETSEARCHFLAGS, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

core.stdc.stdint.intptr_t send_SCI_GETSEARCHFLAGS(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETSEARCHFLAGS, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_CALLTIPSHOW(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_CALLTIPSHOW, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_CALLTIPCANCEL(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_CALLTIPCANCEL, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

bool send_SCI_CALLTIPACTIVE(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(bool)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_CALLTIPACTIVE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

.position send_SCI_CALLTIPPOSSTART(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(.position)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_CALLTIPPOSSTART, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_CALLTIPSETPOSSTART(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_CALLTIPSETPOSSTART, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_CALLTIPSETHLT(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_CALLTIPSETHLT, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_CALLTIPSETBACK(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_CALLTIPSETBACK, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_CALLTIPSETFORE(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_CALLTIPSETFORE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_CALLTIPSETFOREHLT(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_CALLTIPSETFOREHLT, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_CALLTIPUSESTYLE(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_CALLTIPUSESTYLE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_CALLTIPSETPOSITION(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_CALLTIPSETPOSITION, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

.line send_SCI_VISIBLEFROMDOCLINE(core.sys.windows.windef.HWND _scintillaHandle, .line docLine)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(.line)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_VISIBLEFROMDOCLINE, cast(core.sys.windows.windef.WPARAM)(docLine), cast(core.sys.windows.windef.LPARAM)(0)));
	}

.line send_SCI_DOCLINEFROMVISIBLE(core.sys.windows.windef.HWND _scintillaHandle, .line displayLine)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(.line)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_DOCLINEFROMVISIBLE, cast(core.sys.windows.windef.WPARAM)(displayLine), cast(core.sys.windows.windef.LPARAM)(0)));
	}

.line send_SCI_WRAPCOUNT(core.sys.windows.windef.HWND _scintillaHandle, .line docLine)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(.line)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_WRAPCOUNT, cast(core.sys.windows.windef.WPARAM)(docLine), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_SETFOLDLEVEL(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETFOLDLEVEL, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

core.stdc.stdint.intptr_t send_SCI_GETFOLDLEVEL(core.sys.windows.windef.HWND _scintillaHandle, .line line)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETFOLDLEVEL, cast(core.sys.windows.windef.WPARAM)(line), cast(core.sys.windows.windef.LPARAM)(0)));
	}

.line send_SCI_GETLASTCHILD(core.sys.windows.windef.HWND _scintillaHandle, .line line, core.stdc.stdint.intptr_t level)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(.line)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETLASTCHILD, cast(core.sys.windows.windef.WPARAM)(line), cast(core.sys.windows.windef.LPARAM)(level)));
	}

.line send_SCI_GETFOLDPARENT(core.sys.windows.windef.HWND _scintillaHandle, .line line)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(.line)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETFOLDPARENT, cast(core.sys.windows.windef.WPARAM)(line), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_SHOWLINES(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SHOWLINES, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_HIDELINES(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_HIDELINES, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

bool send_SCI_GETLINEVISIBLE(core.sys.windows.windef.HWND _scintillaHandle, core.stdc.stdint.intptr_t line)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(bool)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETLINEVISIBLE, cast(core.sys.windows.windef.WPARAM)(line), cast(core.sys.windows.windef.LPARAM)(0)));
	}

bool send_SCI_GETALLLINESVISIBLE(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(bool)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETALLLINESVISIBLE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_SETFOLDEXPANDED(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETFOLDEXPANDED, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

bool send_SCI_GETFOLDEXPANDED(core.sys.windows.windef.HWND _scintillaHandle, core.stdc.stdint.intptr_t line)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(bool)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETFOLDEXPANDED, cast(core.sys.windows.windef.WPARAM)(line), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_TOGGLEFOLD(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_TOGGLEFOLD, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_TOGGLEFOLDSHOWTEXT(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_TOGGLEFOLDSHOWTEXT, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_FOLDDISPLAYTEXTSETSTYLE(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_FOLDDISPLAYTEXTSETSTYLE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_FOLDLINE(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_FOLDLINE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_FOLDCHILDREN(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_FOLDCHILDREN, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_EXPANDCHILDREN(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_EXPANDCHILDREN, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_FOLDALL(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_FOLDALL, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

void send_SCI_ENSUREVISIBLE(core.sys.windows.windef.HWND _scintillaHandle, .line line)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_ENSUREVISIBLE, cast(core.sys.windows.windef.WPARAM)(line), cast(core.sys.windows.windef.LPARAM)(0));
	}

/+
void send_SCI_SETAUTOMATICFOLD(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETAUTOMATICFOLD, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

core.stdc.stdint.intptr_t send_SCI_GETAUTOMATICFOLD(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETAUTOMATICFOLD, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_SETFOLDFLAGS(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETFOLDFLAGS, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_ENSUREVISIBLEENFORCEPOLICY(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_ENSUREVISIBLEENFORCEPOLICY, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_SETTABINDENTS(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETTABINDENTS, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

bool send_SCI_GETTABINDENTS(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(bool)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETTABINDENTS, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_SETBACKSPACEUNINDENTS(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETBACKSPACEUNINDENTS, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

bool send_SCI_GETBACKSPACEUNINDENTS(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(bool)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETBACKSPACEUNINDENTS, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_SETMOUSEDWELLTIME(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETMOUSEDWELLTIME, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

core.stdc.stdint.intptr_t send_SCI_GETMOUSEDWELLTIME(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETMOUSEDWELLTIME, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

.position send_SCI_WORDSTARTPOSITION(core.sys.windows.windef.HWND _scintillaHandle, .position pos, bool onlyWordCharacters)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(.position)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_WORDSTARTPOSITION, cast(core.sys.windows.windef.WPARAM)(pos), cast(core.sys.windows.windef.LPARAM)(onlyWordCharacters)));
	}

.position send_SCI_WORDENDPOSITION(core.sys.windows.windef.HWND _scintillaHandle, .position pos, bool onlyWordCharacters)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(.position)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_WORDENDPOSITION, cast(core.sys.windows.windef.WPARAM)(pos), cast(core.sys.windows.windef.LPARAM)(onlyWordCharacters)));
	}

bool send_SCI_ISRANGEWORD(core.sys.windows.windef.HWND _scintillaHandle, .position start, .position end)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(bool)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_ISRANGEWORD, cast(core.sys.windows.windef.WPARAM)(start), cast(core.sys.windows.windef.LPARAM)(end)));
	}

/+
void send_SCI_SETIDLESTYLING(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETIDLESTYLING, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

core.stdc.stdint.intptr_t send_SCI_GETIDLESTYLING(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETIDLESTYLING, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_SETWRAPMODE(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETWRAPMODE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

core.stdc.stdint.intptr_t send_SCI_GETWRAPMODE(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETWRAPMODE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_SETWRAPVISUALFLAGS(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETWRAPVISUALFLAGS, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

core.stdc.stdint.intptr_t send_SCI_GETWRAPVISUALFLAGS(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETWRAPVISUALFLAGS, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_SETWRAPVISUALFLAGSLOCATION(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETWRAPVISUALFLAGSLOCATION, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

core.stdc.stdint.intptr_t send_SCI_GETWRAPVISUALFLAGSLOCATION(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETWRAPVISUALFLAGSLOCATION, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_SETWRAPSTARTINDENT(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETWRAPSTARTINDENT, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

core.stdc.stdint.intptr_t send_SCI_GETWRAPSTARTINDENT(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETWRAPSTARTINDENT, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_SETWRAPINDENTMODE(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETWRAPINDENTMODE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

core.stdc.stdint.intptr_t send_SCI_GETWRAPINDENTMODE(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETWRAPINDENTMODE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_SETLAYOUTCACHE(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETLAYOUTCACHE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

core.stdc.stdint.intptr_t send_SCI_GETLAYOUTCACHE(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETLAYOUTCACHE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_SETSCROLLWIDTH(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETSCROLLWIDTH, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

core.stdc.stdint.intptr_t send_SCI_GETSCROLLWIDTH(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETSCROLLWIDTH, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_SETSCROLLWIDTHTRACKING(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETSCROLLWIDTHTRACKING, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

bool send_SCI_GETSCROLLWIDTHTRACKING(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(bool)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETSCROLLWIDTHTRACKING, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

core.stdc.stdint.intptr_t send_SCI_TEXTWIDTH(core.sys.windows.windef.HWND _scintillaHandle, core.stdc.stdint.intptr_t style, const (char)* text)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_TEXTWIDTH, cast(core.sys.windows.windef.WPARAM)(style), cast(core.sys.windows.windef.LPARAM)(text)));
	}

/+
void send_SCI_SETENDATLASTLINE(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETENDATLASTLINE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

bool send_SCI_GETENDATLASTLINE(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(bool)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETENDATLASTLINE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

core.stdc.stdint.intptr_t send_SCI_TEXTHEIGHT(core.sys.windows.windef.HWND _scintillaHandle, .line line)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_TEXTHEIGHT, cast(core.sys.windows.windef.WPARAM)(line), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_SETVSCROLLBAR(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETVSCROLLBAR, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

bool send_SCI_GETVSCROLLBAR(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(bool)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETVSCROLLBAR, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

void send_SCI_APPENDTEXT(core.sys.windows.windef.HWND _scintillaHandle, .position length, const char* text)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_APPENDTEXT, cast(core.sys.windows.windef.WPARAM)(length), cast(core.sys.windows.windef.LPARAM)(text));
	}

core.stdc.stdint.intptr_t send_SCI_GETPHASESDRAW(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETPHASESDRAW, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_SETPHASESDRAW(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETPHASESDRAW, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_SETFONTQUALITY(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETFONTQUALITY, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

core.stdc.stdint.intptr_t send_SCI_GETFONTQUALITY(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETFONTQUALITY, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_SETFIRSTVISIBLELINE(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETFIRSTVISIBLELINE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_SETMULTIPASTE(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETMULTIPASTE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

core.stdc.stdint.intptr_t send_SCI_GETMULTIPASTE(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETMULTIPASTE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

core.stdc.stdint.intptr_t send_SCI_GETTAG(core.sys.windows.windef.HWND _scintillaHandle, core.stdc.stdint.intptr_t tagNumber, char* tagValue)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETTAG, cast(core.sys.windows.windef.WPARAM)(tagNumber), cast(core.sys.windows.windef.LPARAM)(tagValue)));
	}

/+
void send_SCI_LINESJOIN(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_LINESJOIN, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_LINESSPLIT(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_LINESSPLIT, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_SETFOLDMARGINCOLOUR(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETFOLDMARGINCOLOUR, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_SETFOLDMARGINHICOLOUR(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETFOLDMARGINHICOLOUR, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_SETACCESSIBILITY(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETACCESSIBILITY, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

core.stdc.stdint.intptr_t send_SCI_GETACCESSIBILITY(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETACCESSIBILITY, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_LINEDOWN(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_LINEDOWN, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_LINEDOWNEXTEND(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_LINEDOWNEXTEND, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_LINEUP(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_LINEUP, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_LINEUPEXTEND(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_LINEUPEXTEND, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_CHARLEFT(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_CHARLEFT, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_CHARLEFTEXTEND(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_CHARLEFTEXTEND, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_CHARRIGHT(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_CHARRIGHT, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_CHARRIGHTEXTEND(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_CHARRIGHTEXTEND, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_WORDLEFT(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_WORDLEFT, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_WORDLEFTEXTEND(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_WORDLEFTEXTEND, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_WORDRIGHT(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_WORDRIGHT, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_WORDRIGHTEXTEND(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_WORDRIGHTEXTEND, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_HOME(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_HOME, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_HOMEEXTEND(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_HOMEEXTEND, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_LINEEND(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_LINEEND, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_LINEENDEXTEND(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_LINEENDEXTEND, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_DOCUMENTSTART(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_DOCUMENTSTART, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_DOCUMENTSTARTEXTEND(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_DOCUMENTSTARTEXTEND, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_DOCUMENTEND(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_DOCUMENTEND, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_DOCUMENTENDEXTEND(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_DOCUMENTENDEXTEND, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_PAGEUP(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_PAGEUP, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_PAGEUPEXTEND(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_PAGEUPEXTEND, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_PAGEDOWN(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_PAGEDOWN, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_PAGEDOWNEXTEND(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_PAGEDOWNEXTEND, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_EDITTOGGLEOVERTYPE(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_EDITTOGGLEOVERTYPE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_CANCEL(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_CANCEL, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_DELETEBACK(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_DELETEBACK, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_TAB(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_TAB, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_BACKTAB(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_BACKTAB, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_NEWLINE(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_NEWLINE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_FORMFEED(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_FORMFEED, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_VCHOME(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_VCHOME, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_VCHOMEEXTEND(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_VCHOMEEXTEND, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_ZOOMIN(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_ZOOMIN, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_ZOOMOUT(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_ZOOMOUT, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_DELWORDLEFT(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_DELWORDLEFT, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_DELWORDRIGHT(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_DELWORDRIGHT, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_DELWORDRIGHTEND(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_DELWORDRIGHTEND, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_LINECUT(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_LINECUT, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_LINEDELETE(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_LINEDELETE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_LINETRANSPOSE(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_LINETRANSPOSE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_LINEREVERSE(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_LINEREVERSE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_LINEDUPLICATE(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_LINEDUPLICATE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_LOWERCASE(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_LOWERCASE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_UPPERCASE(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_UPPERCASE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_LINESCROLLDOWN(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_LINESCROLLDOWN, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_LINESCROLLUP(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_LINESCROLLUP, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_DELETEBACKNOTLINE(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_DELETEBACKNOTLINE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_HOMEDISPLAY(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_HOMEDISPLAY, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_HOMEDISPLAYEXTEND(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_HOMEDISPLAYEXTEND, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_LINEENDDISPLAY(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_LINEENDDISPLAY, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_LINEENDDISPLAYEXTEND(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_LINEENDDISPLAYEXTEND, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_HOMEWRAP(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_HOMEWRAP, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_HOMEWRAPEXTEND(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_HOMEWRAPEXTEND, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_LINEENDWRAP(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_LINEENDWRAP, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_LINEENDWRAPEXTEND(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_LINEENDWRAPEXTEND, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_VCHOMEWRAP(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_VCHOMEWRAP, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_VCHOMEWRAPEXTEND(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_VCHOMEWRAPEXTEND, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_LINECOPY(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_LINECOPY, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_MOVECARETINSIDEVIEW(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_MOVECARETINSIDEVIEW, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

.position send_SCI_LINELENGTH(core.sys.windows.windef.HWND _scintillaHandle, .line line)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(.position)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_LINELENGTH, cast(core.sys.windows.windef.WPARAM)(line), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_BRACEHIGHLIGHT(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_BRACEHIGHLIGHT, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_BRACEHIGHLIGHTINDICATOR(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_BRACEHIGHLIGHTINDICATOR, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_BRACEBADLIGHT(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_BRACEBADLIGHT, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_BRACEBADLIGHTINDICATOR(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_BRACEBADLIGHTINDICATOR, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

.position send_SCI_BRACEMATCH(core.sys.windows.windef.HWND _scintillaHandle, .position pos, core.stdc.stdint.intptr_t maxReStyle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(.position)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_BRACEMATCH, cast(core.sys.windows.windef.WPARAM)(pos), cast(core.sys.windows.windef.LPARAM)(maxReStyle)));
	}

bool send_SCI_GETVIEWEOL(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(bool)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETVIEWEOL, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_SETVIEWEOL(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETVIEWEOL, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

.pointer send_SCI_GETDOCPOINTER(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(.pointer)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETDOCPOINTER, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_SETDOCPOINTER(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETDOCPOINTER, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_SETMODEVENTMASK(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETMODEVENTMASK, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

.position send_SCI_GETEDGECOLUMN(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(.position)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETEDGECOLUMN, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_SETEDGECOLUMN(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETEDGECOLUMN, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

core.stdc.stdint.intptr_t send_SCI_GETEDGEMODE(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETEDGEMODE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_SETEDGEMODE(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETEDGEMODE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

.colour send_SCI_GETEDGECOLOUR(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(.colour)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETEDGECOLOUR, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_SETEDGECOLOUR(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETEDGECOLOUR, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_MULTIEDGEADDLINE(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_MULTIEDGEADDLINE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_MULTIEDGECLEARALL(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_MULTIEDGECLEARALL, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_SEARCHANCHOR(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SEARCHANCHOR, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

.position send_SCI_SEARCHNEXT(core.sys.windows.windef.HWND _scintillaHandle, core.stdc.stdint.intptr_t searchFlags, const (char)* text)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(.position)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SEARCHNEXT, cast(core.sys.windows.windef.WPARAM)(searchFlags), cast(core.sys.windows.windef.LPARAM)(text)));
	}

.position send_SCI_SEARCHPREV(core.sys.windows.windef.HWND _scintillaHandle, core.stdc.stdint.intptr_t searchFlags, const (char)* text)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(.position)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SEARCHPREV, cast(core.sys.windows.windef.WPARAM)(searchFlags), cast(core.sys.windows.windef.LPARAM)(text)));
	}

.line send_SCI_LINESONSCREEN(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(.line)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_LINESONSCREEN, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_USEPOPUP(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_USEPOPUP, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

bool send_SCI_SELECTIONISRECTANGLE(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(bool)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SELECTIONISRECTANGLE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

void send_SCI_SETZOOM(core.sys.windows.windef.HWND _scintillaHandle, core.stdc.stdint.intptr_t zoomInPoints)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETZOOM, cast(core.sys.windows.windef.WPARAM)(zoomInPoints), cast(core.sys.windows.windef.LPARAM)(0));
	}

core.stdc.stdint.intptr_t send_SCI_GETZOOM(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETZOOM, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

.pointer send_SCI_CREATEDOCUMENT(core.sys.windows.windef.HWND _scintillaHandle, .position bytes, core.stdc.stdint.intptr_t documentOptions)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(.pointer)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_CREATEDOCUMENT, cast(core.sys.windows.windef.WPARAM)(bytes), cast(core.sys.windows.windef.LPARAM)(documentOptions)));
	}

/+
void send_SCI_ADDREFDOCUMENT(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_ADDREFDOCUMENT, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_RELEASEDOCUMENT(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_RELEASEDOCUMENT, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

core.stdc.stdint.intptr_t send_SCI_GETDOCUMENTOPTIONS(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETDOCUMENTOPTIONS, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

core.stdc.stdint.intptr_t send_SCI_GETMODEVENTMASK(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETMODEVENTMASK, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_SETCOMMANDEVENTS(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETCOMMANDEVENTS, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

bool send_SCI_GETCOMMANDEVENTS(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(bool)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETCOMMANDEVENTS, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_SETFOCUS(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETFOCUS, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

bool send_SCI_GETFOCUS(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(bool)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETFOCUS, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_SETSTATUS(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETSTATUS, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

core.stdc.stdint.intptr_t send_SCI_GETSTATUS(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETSTATUS, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_SETMOUSEDOWNCAPTURES(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETMOUSEDOWNCAPTURES, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

bool send_SCI_GETMOUSEDOWNCAPTURES(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(bool)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETMOUSEDOWNCAPTURES, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_SETMOUSEWHEELCAPTURES(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETMOUSEWHEELCAPTURES, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

bool send_SCI_GETMOUSEWHEELCAPTURES(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(bool)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETMOUSEWHEELCAPTURES, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_SETCURSOR(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETCURSOR, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

core.stdc.stdint.intptr_t send_SCI_GETCURSOR(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETCURSOR, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_SETCONTROLCHARSYMBOL(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETCONTROLCHARSYMBOL, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

core.stdc.stdint.intptr_t send_SCI_GETCONTROLCHARSYMBOL(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETCONTROLCHARSYMBOL, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_WORDPARTLEFT(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_WORDPARTLEFT, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_WORDPARTLEFTEXTEND(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_WORDPARTLEFTEXTEND, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_WORDPARTRIGHT(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_WORDPARTRIGHT, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_WORDPARTRIGHTEXTEND(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_WORDPARTRIGHTEXTEND, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_SETVISIBLEPOLICY(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETVISIBLEPOLICY, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_DELLINELEFT(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_DELLINELEFT, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_DELLINERIGHT(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_DELLINERIGHT, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_SETXOFFSET(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETXOFFSET, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

core.stdc.stdint.intptr_t send_SCI_GETXOFFSET(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETXOFFSET, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_CHOOSECARETX(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_CHOOSECARETX, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_GRABFOCUS(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GRABFOCUS, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_SETXCARETPOLICY(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETXCARETPOLICY, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_SETYCARETPOLICY(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETYCARETPOLICY, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_SETPRINTWRAPMODE(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETPRINTWRAPMODE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

core.stdc.stdint.intptr_t send_SCI_GETPRINTWRAPMODE(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETPRINTWRAPMODE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_SETHOTSPOTACTIVEFORE(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETHOTSPOTACTIVEFORE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

.colour send_SCI_GETHOTSPOTACTIVEFORE(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(.colour)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETHOTSPOTACTIVEFORE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_SETHOTSPOTACTIVEBACK(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETHOTSPOTACTIVEBACK, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

.colour send_SCI_GETHOTSPOTACTIVEBACK(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(.colour)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETHOTSPOTACTIVEBACK, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_SETHOTSPOTACTIVEUNDERLINE(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETHOTSPOTACTIVEUNDERLINE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

bool send_SCI_GETHOTSPOTACTIVEUNDERLINE(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(bool)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETHOTSPOTACTIVEUNDERLINE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_SETHOTSPOTSINGLELINE(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETHOTSPOTSINGLELINE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

bool send_SCI_GETHOTSPOTSINGLELINE(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(bool)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETHOTSPOTSINGLELINE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_PARADOWN(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_PARADOWN, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_PARADOWNEXTEND(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_PARADOWNEXTEND, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_PARAUP(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_PARAUP, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_PARAUPEXTEND(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_PARAUPEXTEND, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

.position send_SCI_POSITIONBEFORE(core.sys.windows.windef.HWND _scintillaHandle, .position pos)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(.position)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_POSITIONBEFORE, cast(core.sys.windows.windef.WPARAM)(pos), cast(core.sys.windows.windef.LPARAM)(0)));
	}

.position send_SCI_POSITIONAFTER(core.sys.windows.windef.HWND _scintillaHandle, .position pos)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(.position)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_POSITIONAFTER, cast(core.sys.windows.windef.WPARAM)(pos), cast(core.sys.windows.windef.LPARAM)(0)));
	}

.position send_SCI_POSITIONRELATIVE(core.sys.windows.windef.HWND _scintillaHandle, .position pos, .position relative)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(.position)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_POSITIONRELATIVE, cast(core.sys.windows.windef.WPARAM)(pos), cast(core.sys.windows.windef.LPARAM)(relative)));
	}

.position send_SCI_POSITIONRELATIVECODEUNITS(core.sys.windows.windef.HWND _scintillaHandle, .position pos, .position relative)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(.position)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_POSITIONRELATIVECODEUNITS, cast(core.sys.windows.windef.WPARAM)(pos), cast(core.sys.windows.windef.LPARAM)(relative)));
	}

/+
void send_SCI_COPYRANGE(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_COPYRANGE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_COPYTEXT(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_COPYTEXT, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_SETSELECTIONMODE(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETSELECTIONMODE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

core.stdc.stdint.intptr_t send_SCI_GETSELECTIONMODE(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETSELECTIONMODE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

bool send_SCI_GETMOVEEXTENDSSELECTION(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(bool)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETMOVEEXTENDSSELECTION, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

.position send_SCI_GETLINESELSTARTPOSITION(core.sys.windows.windef.HWND _scintillaHandle, .line line)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(.position)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETLINESELSTARTPOSITION, cast(core.sys.windows.windef.WPARAM)(line), cast(core.sys.windows.windef.LPARAM)(0)));
	}

.position send_SCI_GETLINESELENDPOSITION(core.sys.windows.windef.HWND _scintillaHandle, .line line)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(.position)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETLINESELENDPOSITION, cast(core.sys.windows.windef.WPARAM)(line), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_LINEDOWNRECTEXTEND(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_LINEDOWNRECTEXTEND, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_LINEUPRECTEXTEND(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_LINEUPRECTEXTEND, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_CHARLEFTRECTEXTEND(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_CHARLEFTRECTEXTEND, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_CHARRIGHTRECTEXTEND(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_CHARRIGHTRECTEXTEND, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_HOMERECTEXTEND(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_HOMERECTEXTEND, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_VCHOMERECTEXTEND(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_VCHOMERECTEXTEND, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_LINEENDRECTEXTEND(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_LINEENDRECTEXTEND, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_PAGEUPRECTEXTEND(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_PAGEUPRECTEXTEND, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_PAGEDOWNRECTEXTEND(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_PAGEDOWNRECTEXTEND, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_STUTTEREDPAGEUP(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_STUTTEREDPAGEUP, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_STUTTEREDPAGEUPEXTEND(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_STUTTEREDPAGEUPEXTEND, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_STUTTEREDPAGEDOWN(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_STUTTEREDPAGEDOWN, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_STUTTEREDPAGEDOWNEXTEND(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_STUTTEREDPAGEDOWNEXTEND, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_WORDLEFTEND(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_WORDLEFTEND, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_WORDLEFTENDEXTEND(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_WORDLEFTENDEXTEND, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_WORDRIGHTEND(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_WORDRIGHTEND, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_WORDRIGHTENDEXTEND(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_WORDRIGHTENDEXTEND, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_SETWHITESPACECHARS(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETWHITESPACECHARS, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

core.stdc.stdint.intptr_t send_SCI_GETWHITESPACECHARS(core.sys.windows.windef.HWND _scintillaHandle, char* characters)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETWHITESPACECHARS, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(characters)));
	}

/+
void send_SCI_SETPUNCTUATIONCHARS(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETPUNCTUATIONCHARS, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

core.stdc.stdint.intptr_t send_SCI_GETPUNCTUATIONCHARS(core.sys.windows.windef.HWND _scintillaHandle, char* characters)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETPUNCTUATIONCHARS, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(characters)));
	}

/+
void send_SCI_SETCHARSDEFAULT(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETCHARSDEFAULT, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

core.stdc.stdint.intptr_t send_SCI_AUTOCGETCURRENT(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_AUTOCGETCURRENT, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

core.stdc.stdint.intptr_t send_SCI_AUTOCGETCURRENTTEXT(core.sys.windows.windef.HWND _scintillaHandle, char* text)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_AUTOCGETCURRENTTEXT, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(text)));
	}

/+
void send_SCI_AUTOCSETCASEINSENSITIVEBEHAVIOUR(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_AUTOCSETCASEINSENSITIVEBEHAVIOUR, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

core.stdc.stdint.intptr_t send_SCI_AUTOCGETCASEINSENSITIVEBEHAVIOUR(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_AUTOCGETCASEINSENSITIVEBEHAVIOUR, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_AUTOCSETMULTI(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_AUTOCSETMULTI, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

core.stdc.stdint.intptr_t send_SCI_AUTOCGETMULTI(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_AUTOCGETMULTI, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_AUTOCSETORDER(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_AUTOCSETORDER, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

core.stdc.stdint.intptr_t send_SCI_AUTOCGETORDER(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_AUTOCGETORDER, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_ALLOCATE(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_ALLOCATE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

.position send_SCI_TARGETASUTF8(core.sys.windows.windef.HWND _scintillaHandle, char* s)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(.position)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_TARGETASUTF8, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(s)));
	}

/+
void send_SCI_SETLENGTHFORENCODE(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETLENGTHFORENCODE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

.position send_SCI_ENCODEDFROMUTF8(core.sys.windows.windef.HWND _scintillaHandle, const (char)* utf8, char* encoded)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(.position)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_ENCODEDFROMUTF8, cast(core.sys.windows.windef.WPARAM)(utf8), cast(core.sys.windows.windef.LPARAM)(encoded)));
	}

.position send_SCI_FINDCOLUMN(core.sys.windows.windef.HWND _scintillaHandle, .line line, .position column)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(.position)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_FINDCOLUMN, cast(core.sys.windows.windef.WPARAM)(line), cast(core.sys.windows.windef.LPARAM)(column)));
	}

core.stdc.stdint.intptr_t send_SCI_GETCARETSTICKY(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETCARETSTICKY, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_SETCARETSTICKY(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETCARETSTICKY, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_TOGGLECARETSTICKY(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_TOGGLECARETSTICKY, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_SETPASTECONVERTENDINGS(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETPASTECONVERTENDINGS, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

bool send_SCI_GETPASTECONVERTENDINGS(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(bool)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETPASTECONVERTENDINGS, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_SELECTIONDUPLICATE(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SELECTIONDUPLICATE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_SETCARETLINEBACKALPHA(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETCARETLINEBACKALPHA, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

core.stdc.stdint.intptr_t send_SCI_GETCARETLINEBACKALPHA(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETCARETLINEBACKALPHA, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_SETCARETSTYLE(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETCARETSTYLE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

core.stdc.stdint.intptr_t send_SCI_GETCARETSTYLE(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETCARETSTYLE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_SETINDICATORCURRENT(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETINDICATORCURRENT, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

core.stdc.stdint.intptr_t send_SCI_GETINDICATORCURRENT(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETINDICATORCURRENT, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_SETINDICATORVALUE(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETINDICATORVALUE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

core.stdc.stdint.intptr_t send_SCI_GETINDICATORVALUE(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETINDICATORVALUE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_INDICATORFILLRANGE(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_INDICATORFILLRANGE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_INDICATORCLEARRANGE(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_INDICATORCLEARRANGE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

core.stdc.stdint.intptr_t send_SCI_INDICATORALLONFOR(core.sys.windows.windef.HWND _scintillaHandle, .position pos)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_INDICATORALLONFOR, cast(core.sys.windows.windef.WPARAM)(pos), cast(core.sys.windows.windef.LPARAM)(0)));
	}

core.stdc.stdint.intptr_t send_SCI_INDICATORVALUEAT(core.sys.windows.windef.HWND _scintillaHandle, core.stdc.stdint.intptr_t indicator, .position pos)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_INDICATORVALUEAT, cast(core.sys.windows.windef.WPARAM)(indicator), cast(core.sys.windows.windef.LPARAM)(pos)));
	}

core.stdc.stdint.intptr_t send_SCI_INDICATORSTART(core.sys.windows.windef.HWND _scintillaHandle, core.stdc.stdint.intptr_t indicator, .position pos)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_INDICATORSTART, cast(core.sys.windows.windef.WPARAM)(indicator), cast(core.sys.windows.windef.LPARAM)(pos)));
	}

core.stdc.stdint.intptr_t send_SCI_INDICATOREND(core.sys.windows.windef.HWND _scintillaHandle, core.stdc.stdint.intptr_t indicator, .position pos)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_INDICATOREND, cast(core.sys.windows.windef.WPARAM)(indicator), cast(core.sys.windows.windef.LPARAM)(pos)));
	}

/+
void send_SCI_SETPOSITIONCACHE(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETPOSITIONCACHE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

core.stdc.stdint.intptr_t send_SCI_GETPOSITIONCACHE(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETPOSITIONCACHE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_COPYALLOWLINE(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_COPYALLOWLINE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

.pointer send_SCI_GETCHARACTERPOINTER(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(.pointer)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETCHARACTERPOINTER, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

.pointer send_SCI_GETRANGEPOINTER(core.sys.windows.windef.HWND _scintillaHandle, .position start, .position lengthRange)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(.pointer)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETRANGEPOINTER, cast(core.sys.windows.windef.WPARAM)(start), cast(core.sys.windows.windef.LPARAM)(lengthRange)));
	}

.position send_SCI_GETGAPPOSITION(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(.position)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETGAPPOSITION, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_INDICSETALPHA(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_INDICSETALPHA, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

core.stdc.stdint.intptr_t send_SCI_INDICGETALPHA(core.sys.windows.windef.HWND _scintillaHandle, core.stdc.stdint.intptr_t indicator)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_INDICGETALPHA, cast(core.sys.windows.windef.WPARAM)(indicator), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_INDICSETOUTLINEALPHA(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_INDICSETOUTLINEALPHA, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

core.stdc.stdint.intptr_t send_SCI_INDICGETOUTLINEALPHA(core.sys.windows.windef.HWND _scintillaHandle, core.stdc.stdint.intptr_t indicator)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_INDICGETOUTLINEALPHA, cast(core.sys.windows.windef.WPARAM)(indicator), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_SETEXTRAASCENT(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETEXTRAASCENT, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

core.stdc.stdint.intptr_t send_SCI_GETEXTRAASCENT(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETEXTRAASCENT, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_SETEXTRADESCENT(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETEXTRADESCENT, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

core.stdc.stdint.intptr_t send_SCI_GETEXTRADESCENT(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETEXTRADESCENT, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

core.stdc.stdint.intptr_t send_SCI_MARKERSYMBOLDEFINED(core.sys.windows.windef.HWND _scintillaHandle, core.stdc.stdint.intptr_t markerNumber)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_MARKERSYMBOLDEFINED, cast(core.sys.windows.windef.WPARAM)(markerNumber), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_MARGINSETTEXT(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_MARGINSETTEXT, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

core.stdc.stdint.intptr_t send_SCI_MARGINGETTEXT(core.sys.windows.windef.HWND _scintillaHandle, .line line, char* text)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_MARGINGETTEXT, cast(core.sys.windows.windef.WPARAM)(line), cast(core.sys.windows.windef.LPARAM)(text)));
	}

/+
void send_SCI_MARGINSETSTYLE(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_MARGINSETSTYLE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

core.stdc.stdint.intptr_t send_SCI_MARGINGETSTYLE(core.sys.windows.windef.HWND _scintillaHandle, .line line)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_MARGINGETSTYLE, cast(core.sys.windows.windef.WPARAM)(line), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_MARGINSETSTYLES(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_MARGINSETSTYLES, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

core.stdc.stdint.intptr_t send_SCI_MARGINGETSTYLES(core.sys.windows.windef.HWND _scintillaHandle, .line line, char* styles)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_MARGINGETSTYLES, cast(core.sys.windows.windef.WPARAM)(line), cast(core.sys.windows.windef.LPARAM)(styles)));
	}

/+
void send_SCI_MARGINTEXTCLEARALL(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_MARGINTEXTCLEARALL, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_MARGINSETSTYLEOFFSET(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_MARGINSETSTYLEOFFSET, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

core.stdc.stdint.intptr_t send_SCI_MARGINGETSTYLEOFFSET(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_MARGINGETSTYLEOFFSET, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_SETMARGINOPTIONS(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETMARGINOPTIONS, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

core.stdc.stdint.intptr_t send_SCI_GETMARGINOPTIONS(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETMARGINOPTIONS, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_ANNOTATIONSETTEXT(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_ANNOTATIONSETTEXT, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

core.stdc.stdint.intptr_t send_SCI_ANNOTATIONGETTEXT(core.sys.windows.windef.HWND _scintillaHandle, .line line, char* text)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_ANNOTATIONGETTEXT, cast(core.sys.windows.windef.WPARAM)(line), cast(core.sys.windows.windef.LPARAM)(text)));
	}

/+
void send_SCI_ANNOTATIONSETSTYLE(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_ANNOTATIONSETSTYLE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

core.stdc.stdint.intptr_t send_SCI_ANNOTATIONGETSTYLE(core.sys.windows.windef.HWND _scintillaHandle, .line line)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_ANNOTATIONGETSTYLE, cast(core.sys.windows.windef.WPARAM)(line), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_ANNOTATIONSETSTYLES(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_ANNOTATIONSETSTYLES, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

core.stdc.stdint.intptr_t send_SCI_ANNOTATIONGETSTYLES(core.sys.windows.windef.HWND _scintillaHandle, core.stdc.stdint.intptr_t line, char* styles)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_ANNOTATIONGETSTYLES, cast(core.sys.windows.windef.WPARAM)(line), cast(core.sys.windows.windef.LPARAM)(styles)));
	}

core.stdc.stdint.intptr_t send_SCI_ANNOTATIONGETLINES(core.sys.windows.windef.HWND _scintillaHandle, .line line)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_ANNOTATIONGETLINES, cast(core.sys.windows.windef.WPARAM)(line), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_ANNOTATIONCLEARALL(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_ANNOTATIONCLEARALL, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_ANNOTATIONSETVISIBLE(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_ANNOTATIONSETVISIBLE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

core.stdc.stdint.intptr_t send_SCI_ANNOTATIONGETVISIBLE(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_ANNOTATIONGETVISIBLE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_ANNOTATIONSETSTYLEOFFSET(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_ANNOTATIONSETSTYLEOFFSET, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

core.stdc.stdint.intptr_t send_SCI_ANNOTATIONGETSTYLEOFFSET(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_ANNOTATIONGETSTYLEOFFSET, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_RELEASEALLEXTENDEDSTYLES(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_RELEASEALLEXTENDEDSTYLES, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

core.stdc.stdint.intptr_t send_SCI_ALLOCATEEXTENDEDSTYLES(core.sys.windows.windef.HWND _scintillaHandle, core.stdc.stdint.intptr_t numberStyles)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_ALLOCATEEXTENDEDSTYLES, cast(core.sys.windows.windef.WPARAM)(numberStyles), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_ADDUNDOACTION(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_ADDUNDOACTION, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

.position send_SCI_CHARPOSITIONFROMPOINT(core.sys.windows.windef.HWND _scintillaHandle, core.stdc.stdint.intptr_t x, core.stdc.stdint.intptr_t y)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(.position)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_CHARPOSITIONFROMPOINT, cast(core.sys.windows.windef.WPARAM)(x), cast(core.sys.windows.windef.LPARAM)(y)));
	}

.position send_SCI_CHARPOSITIONFROMPOINTCLOSE(core.sys.windows.windef.HWND _scintillaHandle, core.stdc.stdint.intptr_t x, core.stdc.stdint.intptr_t y)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(.position)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_CHARPOSITIONFROMPOINTCLOSE, cast(core.sys.windows.windef.WPARAM)(x), cast(core.sys.windows.windef.LPARAM)(y)));
	}

/+
void send_SCI_SETMOUSESELECTIONRECTANGULARSWITCH(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETMOUSESELECTIONRECTANGULARSWITCH, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

bool send_SCI_GETMOUSESELECTIONRECTANGULARSWITCH(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(bool)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETMOUSESELECTIONRECTANGULARSWITCH, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_SETMULTIPLESELECTION(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETMULTIPLESELECTION, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

bool send_SCI_GETMULTIPLESELECTION(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(bool)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETMULTIPLESELECTION, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_SETADDITIONALSELECTIONTYPING(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETADDITIONALSELECTIONTYPING, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

bool send_SCI_GETADDITIONALSELECTIONTYPING(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(bool)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETADDITIONALSELECTIONTYPING, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_SETADDITIONALCARETSBLINK(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETADDITIONALCARETSBLINK, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

bool send_SCI_GETADDITIONALCARETSBLINK(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(bool)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETADDITIONALCARETSBLINK, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_SETADDITIONALCARETSVISIBLE(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETADDITIONALCARETSVISIBLE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

bool send_SCI_GETADDITIONALCARETSVISIBLE(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(bool)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETADDITIONALCARETSVISIBLE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

core.stdc.stdint.intptr_t send_SCI_GETSELECTIONS(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETSELECTIONS, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

bool send_SCI_GETSELECTIONEMPTY(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(bool)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETSELECTIONEMPTY, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_CLEARSELECTIONS(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_CLEARSELECTIONS, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_SETSELECTION(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETSELECTION, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_ADDSELECTION(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_ADDSELECTION, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_DROPSELECTIONN(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_DROPSELECTIONN, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_SETMAINSELECTION(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETMAINSELECTION, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

core.stdc.stdint.intptr_t send_SCI_GETMAINSELECTION(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETMAINSELECTION, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_SETSELECTIONNCARET(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETSELECTIONNCARET, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

.position send_SCI_GETSELECTIONNCARET(core.sys.windows.windef.HWND _scintillaHandle, core.stdc.stdint.intptr_t selection)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(.position)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETSELECTIONNCARET, cast(core.sys.windows.windef.WPARAM)(selection), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_SETSELECTIONNANCHOR(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETSELECTIONNANCHOR, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

.position send_SCI_GETSELECTIONNANCHOR(core.sys.windows.windef.HWND _scintillaHandle, core.stdc.stdint.intptr_t selection)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(.position)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETSELECTIONNANCHOR, cast(core.sys.windows.windef.WPARAM)(selection), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_SETSELECTIONNCARETVIRTUALSPACE(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETSELECTIONNCARETVIRTUALSPACE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

.position send_SCI_GETSELECTIONNCARETVIRTUALSPACE(core.sys.windows.windef.HWND _scintillaHandle, core.stdc.stdint.intptr_t selection)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(.position)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETSELECTIONNCARETVIRTUALSPACE, cast(core.sys.windows.windef.WPARAM)(selection), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_SETSELECTIONNANCHORVIRTUALSPACE(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETSELECTIONNANCHORVIRTUALSPACE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

.position send_SCI_GETSELECTIONNANCHORVIRTUALSPACE(core.sys.windows.windef.HWND _scintillaHandle, core.stdc.stdint.intptr_t selection)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(.position)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETSELECTIONNANCHORVIRTUALSPACE, cast(core.sys.windows.windef.WPARAM)(selection), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_SETSELECTIONNSTART(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETSELECTIONNSTART, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

.position send_SCI_GETSELECTIONNSTART(core.sys.windows.windef.HWND _scintillaHandle, core.stdc.stdint.intptr_t selection)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(.position)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETSELECTIONNSTART, cast(core.sys.windows.windef.WPARAM)(selection), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_SETSELECTIONNEND(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETSELECTIONNEND, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

.position send_SCI_GETSELECTIONNEND(core.sys.windows.windef.HWND _scintillaHandle, core.stdc.stdint.intptr_t selection)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(.position)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETSELECTIONNEND, cast(core.sys.windows.windef.WPARAM)(selection), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_SETRECTANGULARSELECTIONCARET(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETRECTANGULARSELECTIONCARET, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

.position send_SCI_GETRECTANGULARSELECTIONCARET(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(.position)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETRECTANGULARSELECTIONCARET, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_SETRECTANGULARSELECTIONANCHOR(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETRECTANGULARSELECTIONANCHOR, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

.position send_SCI_GETRECTANGULARSELECTIONANCHOR(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(.position)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETRECTANGULARSELECTIONANCHOR, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_SETRECTANGULARSELECTIONCARETVIRTUALSPACE(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETRECTANGULARSELECTIONCARETVIRTUALSPACE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

.position send_SCI_GETRECTANGULARSELECTIONCARETVIRTUALSPACE(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(.position)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETRECTANGULARSELECTIONCARETVIRTUALSPACE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_SETRECTANGULARSELECTIONANCHORVIRTUALSPACE(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETRECTANGULARSELECTIONANCHORVIRTUALSPACE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

.position send_SCI_GETRECTANGULARSELECTIONANCHORVIRTUALSPACE(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(.position)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETRECTANGULARSELECTIONANCHORVIRTUALSPACE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_SETVIRTUALSPACEOPTIONS(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETVIRTUALSPACEOPTIONS, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

core.stdc.stdint.intptr_t send_SCI_GETVIRTUALSPACEOPTIONS(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETVIRTUALSPACEOPTIONS, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_SETRECTANGULARSELECTIONMODIFIER(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETRECTANGULARSELECTIONMODIFIER, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

core.stdc.stdint.intptr_t send_SCI_GETRECTANGULARSELECTIONMODIFIER(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETRECTANGULARSELECTIONMODIFIER, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_SETADDITIONALSELFORE(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETADDITIONALSELFORE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_SETADDITIONALSELBACK(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETADDITIONALSELBACK, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_SETADDITIONALSELALPHA(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETADDITIONALSELALPHA, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

core.stdc.stdint.intptr_t send_SCI_GETADDITIONALSELALPHA(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETADDITIONALSELALPHA, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_SETADDITIONALCARETFORE(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETADDITIONALCARETFORE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

.colour send_SCI_GETADDITIONALCARETFORE(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(.colour)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETADDITIONALCARETFORE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_ROTATESELECTION(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_ROTATESELECTION, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_SWAPMAINANCHORCARET(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SWAPMAINANCHORCARET, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_MULTIPLESELECTADDNEXT(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_MULTIPLESELECTADDNEXT, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_MULTIPLESELECTADDEACH(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_MULTIPLESELECTADDEACH, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

core.stdc.stdint.intptr_t send_SCI_CHANGELEXERSTATE(core.sys.windows.windef.HWND _scintillaHandle, .position start, .position end)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_CHANGELEXERSTATE, cast(core.sys.windows.windef.WPARAM)(start), cast(core.sys.windows.windef.LPARAM)(end)));
	}

.line send_SCI_CONTRACTEDFOLDNEXT(core.sys.windows.windef.HWND _scintillaHandle, .line lineStart)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(.line)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_CONTRACTEDFOLDNEXT, cast(core.sys.windows.windef.WPARAM)(lineStart), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_VERTICALCENTRECARET(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_VERTICALCENTRECARET, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_MOVESELECTEDLINESUP(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_MOVESELECTEDLINESUP, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_MOVESELECTEDLINESDOWN(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_MOVESELECTEDLINESDOWN, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_SETIDENTIFIER(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETIDENTIFIER, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

core.stdc.stdint.intptr_t send_SCI_GETIDENTIFIER(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETIDENTIFIER, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_RGBAIMAGESETWIDTH(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_RGBAIMAGESETWIDTH, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_RGBAIMAGESETHEIGHT(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_RGBAIMAGESETHEIGHT, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_RGBAIMAGESETSCALE(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_RGBAIMAGESETSCALE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_MARKERDEFINERGBAIMAGE(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_MARKERDEFINERGBAIMAGE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_REGISTERRGBAIMAGE(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_REGISTERRGBAIMAGE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_SCROLLTOSTART(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SCROLLTOSTART, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_SCROLLTOEND(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SCROLLTOEND, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_SETTECHNOLOGY(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETTECHNOLOGY, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

core.stdc.stdint.intptr_t send_SCI_GETTECHNOLOGY(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETTECHNOLOGY, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

.pointer send_SCI_CREATELOADER(core.sys.windows.windef.HWND _scintillaHandle, .position bytes, core.stdc.stdint.intptr_t documentOptions)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(.pointer)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_CREATELOADER, cast(core.sys.windows.windef.WPARAM)(bytes), cast(core.sys.windows.windef.LPARAM)(documentOptions)));
	}

/+
void send_SCI_FINDINDICATORSHOW(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_FINDINDICATORSHOW, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_FINDINDICATORFLASH(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_FINDINDICATORFLASH, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_FINDINDICATORHIDE(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_FINDINDICATORHIDE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_VCHOMEDISPLAY(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_VCHOMEDISPLAY, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_VCHOMEDISPLAYEXTEND(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_VCHOMEDISPLAYEXTEND, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

bool send_SCI_GETCARETLINEVISIBLEALWAYS(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(bool)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETCARETLINEVISIBLEALWAYS, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_SETCARETLINEVISIBLEALWAYS(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETCARETLINEVISIBLEALWAYS, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_SETLINEENDTYPESALLOWED(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETLINEENDTYPESALLOWED, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

core.stdc.stdint.intptr_t send_SCI_GETLINEENDTYPESALLOWED(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETLINEENDTYPESALLOWED, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

core.stdc.stdint.intptr_t send_SCI_GETLINEENDTYPESACTIVE(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETLINEENDTYPESACTIVE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_SETREPRESENTATION(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETREPRESENTATION, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

core.stdc.stdint.intptr_t send_SCI_GETREPRESENTATION(core.sys.windows.windef.HWND _scintillaHandle, const (char)* encodedCharacter, char* representation)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETREPRESENTATION, cast(core.sys.windows.windef.WPARAM)(encodedCharacter), cast(core.sys.windows.windef.LPARAM)(representation)));
	}

/+
void send_SCI_CLEARREPRESENTATION(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_CLEARREPRESENTATION, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_STARTRECORD(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_STARTRECORD, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_STOPRECORD(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_STOPRECORD, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_SETLEXER(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETLEXER, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

core.stdc.stdint.intptr_t send_SCI_GETLEXER(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETLEXER, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_COLOURISE(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_COLOURISE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_SETPROPERTY(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETPROPERTY, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

//KEYWORDSET_MAX
/+
void send_SCI_SETKEYWORDS(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETKEYWORDS, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_SETLEXERLANGUAGE(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETLEXERLANGUAGE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_LOADLEXERLIBRARY(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_LOADLEXERLIBRARY, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

core.stdc.stdint.intptr_t send_SCI_GETPROPERTY(core.sys.windows.windef.HWND _scintillaHandle, const (char)* key, char* value)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETPROPERTY, cast(core.sys.windows.windef.WPARAM)(key), cast(core.sys.windows.windef.LPARAM)(value)));
	}

core.stdc.stdint.intptr_t send_SCI_GETPROPERTYEXPANDED(core.sys.windows.windef.HWND _scintillaHandle, const (char)* key, char* value)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETPROPERTYEXPANDED, cast(core.sys.windows.windef.WPARAM)(key), cast(core.sys.windows.windef.LPARAM)(value)));
	}

core.stdc.stdint.intptr_t send_SCI_GETPROPERTYINT(core.sys.windows.windef.HWND _scintillaHandle, const (char)* key, char* value)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETPROPERTYINT, cast(core.sys.windows.windef.WPARAM)(key), cast(core.sys.windows.windef.LPARAM)(value)));
	}

core.stdc.stdint.intptr_t send_SCI_GETLEXERLANGUAGE(core.sys.windows.windef.HWND _scintillaHandle, char* language)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETLEXERLANGUAGE, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(language)));
	}

.pointer send_SCI_PRIVATELEXERCALL(core.sys.windows.windef.HWND _scintillaHandle, core.stdc.stdint.intptr_t operation, .pointer pointer)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(.pointer)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_PRIVATELEXERCALL, cast(core.sys.windows.windef.WPARAM)(operation), cast(core.sys.windows.windef.LPARAM)(pointer)));
	}

core.stdc.stdint.intptr_t send_SCI_PROPERTYNAMES(core.sys.windows.windef.HWND _scintillaHandle, char* names)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_PROPERTYNAMES, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(names)));
	}

core.stdc.stdint.intptr_t send_SCI_PROPERTYTYPE(core.sys.windows.windef.HWND _scintillaHandle, const (char)* name)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_PROPERTYTYPE, cast(core.sys.windows.windef.WPARAM)(name), cast(core.sys.windows.windef.LPARAM)(0)));
	}

core.stdc.stdint.intptr_t send_SCI_DESCRIBEPROPERTY(core.sys.windows.windef.HWND _scintillaHandle, const (char)* name, char* description)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_DESCRIBEPROPERTY, cast(core.sys.windows.windef.WPARAM)(name), cast(core.sys.windows.windef.LPARAM)(description)));
	}

core.stdc.stdint.intptr_t send_SCI_DESCRIBEKEYWORDSETS(core.sys.windows.windef.HWND _scintillaHandle, char* description)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_DESCRIBEKEYWORDSETS, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(description)));
	}

core.stdc.stdint.intptr_t send_SCI_GETLINEENDTYPESSUPPORTED(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETLINEENDTYPESSUPPORTED, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

core.stdc.stdint.intptr_t send_SCI_ALLOCATESUBSTYLES(core.sys.windows.windef.HWND _scintillaHandle, core.stdc.stdint.intptr_t styleBase, core.stdc.stdint.intptr_t numberStyles)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_ALLOCATESUBSTYLES, cast(core.sys.windows.windef.WPARAM)(styleBase), cast(core.sys.windows.windef.LPARAM)(numberStyles)));
	}

core.stdc.stdint.intptr_t send_SCI_GETSUBSTYLESSTART(core.sys.windows.windef.HWND _scintillaHandle, core.stdc.stdint.intptr_t styleBase)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETSUBSTYLESSTART, cast(core.sys.windows.windef.WPARAM)(styleBase), cast(core.sys.windows.windef.LPARAM)(0)));
	}

core.stdc.stdint.intptr_t send_SCI_GETSUBSTYLESLENGTH(core.sys.windows.windef.HWND _scintillaHandle, core.stdc.stdint.intptr_t styleBase)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETSUBSTYLESLENGTH, cast(core.sys.windows.windef.WPARAM)(styleBase), cast(core.sys.windows.windef.LPARAM)(0)));
	}

core.stdc.stdint.intptr_t send_SCI_GETSTYLEFROMSUBSTYLE(core.sys.windows.windef.HWND _scintillaHandle, core.stdc.stdint.intptr_t subStyle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETSTYLEFROMSUBSTYLE, cast(core.sys.windows.windef.WPARAM)(subStyle), cast(core.sys.windows.windef.LPARAM)(0)));
	}

core.stdc.stdint.intptr_t send_SCI_GETPRIMARYSTYLEFROMSTYLE(core.sys.windows.windef.HWND _scintillaHandle, core.stdc.stdint.intptr_t style)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETPRIMARYSTYLEFROMSTYLE, cast(core.sys.windows.windef.WPARAM)(style), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_FREESUBSTYLES(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_FREESUBSTYLES, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_SETIDENTIFIERS(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETIDENTIFIERS, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

core.stdc.stdint.intptr_t send_SCI_DISTANCETOSECONDARYSTYLES(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_DISTANCETOSECONDARYSTYLES, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

core.stdc.stdint.intptr_t send_SCI_GETSUBSTYLEBASES(core.sys.windows.windef.HWND _scintillaHandle, char* styles)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETSUBSTYLEBASES, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(styles)));
	}

core.stdc.stdint.intptr_t send_SCI_GETNAMEDSTYLES(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETNAMEDSTYLES, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

core.stdc.stdint.intptr_t send_SCI_NAMEOFSTYLE(core.sys.windows.windef.HWND _scintillaHandle, core.stdc.stdint.intptr_t style, char* name)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_NAMEOFSTYLE, cast(core.sys.windows.windef.WPARAM)(style), cast(core.sys.windows.windef.LPARAM)(name)));
	}

core.stdc.stdint.intptr_t send_SCI_TAGSOFSTYLE(core.sys.windows.windef.HWND _scintillaHandle, core.stdc.stdint.intptr_t style, char* tags)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_TAGSOFSTYLE, cast(core.sys.windows.windef.WPARAM)(style), cast(core.sys.windows.windef.LPARAM)(tags)));
	}

core.stdc.stdint.intptr_t send_SCI_DESCRIPTIONOFSTYLE(core.sys.windows.windef.HWND _scintillaHandle, core.stdc.stdint.intptr_t style, char* description)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_DESCRIPTIONOFSTYLE, cast(core.sys.windows.windef.WPARAM)(style), cast(core.sys.windows.windef.LPARAM)(description)));
	}

//static if (!__traits(compiles, .SCI_DISABLE_PROVISIONAL)) {
core.stdc.stdint.intptr_t send_SCI_GETBIDIRECTIONAL(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETBIDIRECTIONAL, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_SETBIDIRECTIONAL(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_SETBIDIRECTIONAL, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

core.stdc.stdint.intptr_t send_SCI_GETLINECHARACTERINDEX(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(core.stdc.stdint.intptr_t)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_GETLINECHARACTERINDEX, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0)));
	}

/+
void send_SCI_ALLOCATELINECHARACTERINDEX(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_ALLOCATELINECHARACTERINDEX, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

/+
void send_SCI_RELEASELINECHARACTERINDEX(core.sys.windows.windef.HWND _scintillaHandle)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_RELEASELINECHARACTERINDEX, cast(core.sys.windows.windef.WPARAM)(0), cast(core.sys.windows.windef.LPARAM)(0));
	}
+/

.line send_SCI_LINEFROMINDEXPOSITION(core.sys.windows.windef.HWND _scintillaHandle, .position pos, core.stdc.stdint.intptr_t lineCharacterIndex)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(.line)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_LINEFROMINDEXPOSITION, cast(core.sys.windows.windef.WPARAM)(pos), cast(core.sys.windows.windef.LPARAM)(lineCharacterIndex)));
	}

.position send_SCI_INDEXPOSITIONFROMLINE(core.sys.windows.windef.HWND _scintillaHandle, .line line, core.stdc.stdint.intptr_t lineCharacterIndex)

	in
	{
		static import core.sys.windows.windef;

		assert(_scintillaHandle != core.sys.windows.windef.NULL);
	}

	body
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.scintilla.scintilla;

		return cast(.position)(core.sys.windows.winuser.SendMessageA(_scintillaHandle, npp_api.scintilla.scintilla.SCI_INDEXPOSITIONFROMLINE, cast(core.sys.windows.windef.WPARAM)(line), cast(core.sys.windows.windef.LPARAM)(lineCharacterIndex)));
	}
//}
