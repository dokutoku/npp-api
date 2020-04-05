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
module npp_api.powereditor.wincontrols.window;


version (Windows):
version (Not_betterC):

//pragma(lib, "user32");

private static import core.sys.windows.windef;
private static import core.sys.windows.winuser;

abstract class Window
{
	static import core.sys.windows.windef;
	static import core.sys.windows.winuser;

protected:
	core.sys.windows.windef.HINSTANCE _hInst = core.sys.windows.windef.NULL;
	core.sys.windows.windef.HWND _hParent = core.sys.windows.windef.NULL;
	core.sys.windows.windef.HWND _hSelf = core.sys.windows.windef.NULL;

public:
	pure nothrow @safe @nogc
	this()

		do
		{
			this._hInst = core.sys.windows.windef.NULL;
			this._hParent = core.sys.windows.windef.NULL;
			this._hSelf = core.sys.windows.windef.NULL;
		}

	/*
	//! \name Constructors & Destructor
	//@{
	this() = default;
	this(const Window &) = delete;
	~this() = default;
	//@}
	*/

	nothrow @nogc
	void initialize(core.sys.windows.windef.HINSTANCE hInst, core.sys.windows.windef.HWND parent)

		in
		{
		}

		do
		{
			this._hInst = hInst;
			this._hParent = parent;
		}

	nothrow @nogc
	void destroy();

	nothrow @nogc
	void display(bool toShow = true, bool enhancedPositioningCheckWhenShowing = false)

		in
		{
		}

		do
		{
			core.sys.windows.winuser.ShowWindow(this._hSelf, (toShow) ? (core.sys.windows.winuser.SW_SHOW) : (core.sys.windows.winuser.SW_HIDE));
		}

	// should NEVER be const !!!
	nothrow @nogc
	void reSizeTo(ref core.sys.windows.windef.RECT rc)

		in
		{
		}

		do
		{
			core.sys.windows.winuser.MoveWindow(this._hSelf, rc.left, rc.top, rc.right, rc.bottom, core.sys.windows.windef.TRUE);
			this.redraw();
		}

	// should NEVER be const !!!
	nothrow @nogc
	void reSizeToWH(ref core.sys.windows.windef.RECT rc)

		in
		{
		}

		do
		{
			core.sys.windows.winuser.MoveWindow(this._hSelf, rc.left, rc.top, rc.right - rc.left, rc.bottom - rc.top, core.sys.windows.windef.TRUE);
			this.redraw();
		}

	nothrow @nogc
	void redraw(bool forceUpdate = false)

		in
		{
		}

		do
		{
			core.sys.windows.winuser.InvalidateRect(this._hSelf, core.sys.windows.windef.NULL, core.sys.windows.windef.TRUE);

			if (forceUpdate) {
				core.sys.windows.winuser.UpdateWindow(this._hSelf);
			}
		}

	nothrow @nogc
	void getClientRect(ref core.sys.windows.windef.RECT rc)

		in
		{
		}

		do
		{
			core.sys.windows.winuser.GetClientRect(this._hSelf, &rc);
		}

	nothrow @nogc
	void getWindowRect(ref core.sys.windows.windef.RECT rc)

		in
		{
		}

		do
		{
			core.sys.windows.winuser.GetWindowRect(this._hSelf, &rc);
		}

	nothrow @nogc
	int getWidth()

		do
		{
			core.sys.windows.windef.RECT rc;
			core.sys.windows.winuser.GetClientRect(this._hSelf, &rc);

			return (rc.right - rc.left);
		}

	nothrow @nogc
	int getHeight()

		do
		{
			core.sys.windows.windef.RECT rc;
			core.sys.windows.winuser.GetClientRect(this._hSelf, &rc);

			if (core.sys.windows.winuser.IsWindowVisible(this._hSelf) == core.sys.windows.windef.TRUE) {
				return (rc.bottom - rc.top);
			}

			return 0;
		}

	nothrow @nogc
	bool isVisible()

		do
		{
			return ((core.sys.windows.winuser.IsWindowVisible(this._hSelf)) ? (true) : (false));
		}

	pure nothrow @safe @nogc
	core.sys.windows.windef.HWND getHSelf()

		do
		{
			return this._hSelf;
		}

	pure nothrow @safe @nogc
	core.sys.windows.windef.HWND getHParent()

		do
		{
			return this._hParent;
		}

	nothrow @nogc
	void getFocus()

		do
		{
			core.sys.windows.winuser.SetFocus(this._hSelf);
		}

	pure nothrow @safe @nogc
	core.sys.windows.windef.HINSTANCE getHinst()

		in
		{
			assert(this._hInst != core.sys.windows.windef.NULL);
		}

		do
		{
			return this._hInst;
		}

	//Window &operator = (const Window &) = delete;
}
