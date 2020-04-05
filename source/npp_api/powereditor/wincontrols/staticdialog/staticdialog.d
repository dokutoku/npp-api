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
module npp_api.powereditor.wincontrols.staticdialog.staticdialog;


version (Windows):
version (Not_betterC):

//pragma(lib, "kernel32");
//pragma(lib, "user32");

private static import core.sys.windows.basetsd;
private static import core.sys.windows.winbase;
private static import core.sys.windows.windef;
private static import core.sys.windows.winuser;
private static import core.stdc.config;
private static import core.stdc.string;
private static import std.utf;
private static import std.format;
private static import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;
private static import npp_api.powereditor.wincontrols.window;
private static import npp_api.pluginfunc.npp_msgs;

enum PosAlign
{
	left,
	right,
	top,
	bottom,
}

/**
 * The structure has more fields but are variable length
 */
extern (C)
struct DLGTEMPLATEEX
{
	static import core.sys.windows.windef;

	core.sys.windows.windef.WORD dlgVer;
	core.sys.windows.windef.WORD signature;
	core.sys.windows.windef.DWORD helpID;
	core.sys.windows.windef.DWORD exStyle;
	core.sys.windows.windef.DWORD style;
	core.sys.windows.windef.WORD cDlgItems;
	short x;
	short y;
	short cx;
	short cy;
}

abstract class StaticDialog : npp_api.powereditor.wincontrols.window.Window
{
	static import core.sys.windows.basetsd;
	static import core.sys.windows.winbase;
	static import core.sys.windows.windef;
	static import core.sys.windows.winuser;
	static import core.stdc.config;
	static import core.stdc.string;
	static import std.utf;
	static import std.format;
	static import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;
	static import npp_api.pluginfunc.npp_msgs;

public:
	nothrow @nogc
	~this()

		do
		{
			if (this.isCreated()) {
				// Prevent run_dlgProc from doing anything, since its virtual
				core.sys.windows.winuser.SetWindowLongPtrW(this._hSelf, core.sys.windows.winuser.GWLP_USERDATA, 0);

				this.destroy();
			}
		}

	void create(void* dialog_p, int dialogID, bool isRTL = false, bool msgDestParent = true)

		in
		{
			static assert(core.sys.windows.windef.LPARAM.sizeof >= dialog_p.sizeof);
			assert(dialog_p != null);
		}

		do
		{
			if (isRTL) {
				core.sys.windows.winuser.DLGTEMPLATE* pMyDlgTemplate = core.sys.windows.windef.NULL;
				core.sys.windows.windef.HGLOBAL hMyDlgTemplate = this.makeRTLResource(dialogID, &pMyDlgTemplate);
				this._hSelf = core.sys.windows.winuser.CreateDialogIndirectParamW(this._hInst, cast(core.sys.windows.winuser.LPCDLGTEMPLATEW)(pMyDlgTemplate), this._hParent, &this.dlgProc, cast(core.sys.windows.windef.LPARAM)(dialog_p));
				core.sys.windows.winbase.GlobalFree(hMyDlgTemplate);
			} else {
				this._hSelf = core.sys.windows.winuser.CreateDialogParamW(this._hInst, core.sys.windows.winuser.MAKEINTRESOURCEW(dialogID), this._hParent, &this.dlgProc, cast(core.sys.windows.windef.LPARAM)(dialog_p));
			}

			if (this._hSelf == core.sys.windows.windef.NULL) {
				throw new Exception(std.utf.toUTF8(std.format.format!("CreateDialogParamW() return NULL.\rGetLastError(): %d")(core.sys.windows.winbase.GetLastError())));
			}

			// if the destination of message NPPM_MODELESSDIALOG is not its parent, then it's the grand-parent
			core.sys.windows.winuser.SendMessageW(((msgDestParent) ? (this._hParent) : (core.sys.windows.winuser.GetParent(this._hParent))), npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPM_MODELESSDIALOG, npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.MODELESSDIALOGADD, cast(core.sys.windows.windef.WPARAM)(this._hSelf));
		}

	pure nothrow @safe @nogc
	bool isCreated() const

		do
		{
			return (this._hSelf != core.sys.windows.windef.NULL);
		}

	nothrow @nogc
	void goToCenter()

		do
		{
			core.sys.windows.windef.RECT rc;
			core.sys.windows.winuser.GetClientRect(this._hParent, &rc);
			core.sys.windows.windef.POINT center;
			center.x = rc.left + (rc.right - rc.left) / 2;
			center.y = rc.top + (rc.bottom - rc.top) / 2;
			core.sys.windows.winuser.ClientToScreen(this._hParent, &center);

			int x = center.x - (this._rc.right - this._rc.left) / 2;
			int y = center.y - (this._rc.bottom - this._rc.top) / 2;

			core.sys.windows.winuser.SetWindowPos(this._hSelf, core.sys.windows.winuser.HWND_TOP, x, y, this._rc.right - this._rc.left, this._rc.bottom - this._rc.top, core.sys.windows.winuser.SWP_SHOWWINDOW);
		}

	nothrow @nogc
	override void destroy()

		do
		{
			npp_api.pluginfunc.npp_msgs.send_NPPM_MODELESSDIALOG(this._hParent, npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.MODELESSDIALOGREMOVE, this._hSelf);
			core.sys.windows.winuser.DestroyWindow(this._hSelf);
		}

	nothrow @nogc
	override void display(bool toShow)

		do
		{
			if (toShow) {
				// If the user has switched from a dual monitor to a single monitor since we last
				// displayed the dialog, then ensure that it's still visible on the single monitor.
				core.sys.windows.windef.RECT workAreaRect = {0};
				core.sys.windows.windef.RECT rc = {0};
				core.sys.windows.winuser.SystemParametersInfoW(core.sys.windows.winuser.SPI_GETWORKAREA, 0, &workAreaRect, 0);
				core.sys.windows.winuser.GetWindowRect(this._hSelf, &rc);
				int newLeft = rc.left;
				int newTop = rc.top;
				int margin = core.sys.windows.winuser.GetSystemMetrics(core.sys.windows.winuser.SM_CYSMCAPTION);

				if (newLeft > core.sys.windows.winuser.GetSystemMetrics(core.sys.windows.winuser.SM_CXVIRTUALSCREEN) - margin) {
					newLeft -= rc.right - workAreaRect.right;
				}

				if (newLeft + (rc.right - rc.left) < core.sys.windows.winuser.GetSystemMetrics(core.sys.windows.winuser.SM_XVIRTUALSCREEN) + margin) {
					newLeft = workAreaRect.left;
				}

				if (newTop > core.sys.windows.winuser.GetSystemMetrics(core.sys.windows.winuser.SM_CYVIRTUALSCREEN) - margin) {
					newTop -= rc.bottom - workAreaRect.bottom;
				}

				if (newTop + (rc.bottom - rc.top) < core.sys.windows.winuser.GetSystemMetrics(core.sys.windows.winuser.SM_YVIRTUALSCREEN) + margin) {
					newTop = workAreaRect.top;
				}

				if ((newLeft != rc.left) || (newTop != rc.top)) // then the virtual screen size has shrunk
					// Remember that core.sys.windows.winuser.MoveWindow wants width/height.
				{
					core.sys.windows.winuser.MoveWindow(this._hSelf, newLeft, newTop, rc.right - rc.left, rc.bottom - rc.top, core.sys.windows.windef.TRUE);
				}
			}

			super.display(toShow);
		}

	nothrow @nogc
	core.sys.windows.windef.POINT getTopPoint(core.sys.windows.windef.HWND hwnd, bool isLeft)

		do
		{
			core.sys.windows.windef.RECT rc;
			core.sys.windows.winuser.GetWindowRect(hwnd, &rc);

			core.sys.windows.windef.POINT p;

			if (isLeft) {
				p.x = rc.left;
			} else {
				p.x = rc.right;
			}

			p.y = rc.top;
			core.sys.windows.winuser.ScreenToClient(this._hSelf, &p);

			return p;
		}

protected:
	core.sys.windows.windef.RECT _rc;

	extern (Windows)
	nothrow @nogc
	static core.sys.windows.basetsd.INT_PTR dlgProc(core.sys.windows.windef.HWND hwnd, core.sys.windows.windef.UINT message, core.sys.windows.windef.WPARAM wParam, core.sys.windows.windef.LPARAM lParam)

		in
		{
		}

		do
		{
			switch (message) {
				case core.sys.windows.winuser.WM_INITDIALOG:
					StaticDialog* pStaticDlg = cast(StaticDialog*)(lParam);

					(*pStaticDlg)._hSelf = hwnd;
					core.sys.windows.winuser.SetWindowLongPtrW(hwnd, core.sys.windows.winuser.GWLP_USERDATA, cast(core.sys.windows.basetsd.LONG_PTR)(lParam));
					core.sys.windows.winuser.GetWindowRect(hwnd, &((*pStaticDlg)._rc));
					(*pStaticDlg).run_dlgProc(message, wParam, lParam);

					return core.sys.windows.windef.TRUE;

				default:
					StaticDialog* pStaticDlg = cast(StaticDialog*)(core.sys.windows.winuser.GetWindowLongPtrW(hwnd, core.sys.windows.winuser.GWLP_USERDATA));

					if (pStaticDlg == core.sys.windows.windef.NULL) {
						return core.sys.windows.windef.FALSE;
					}

					return (*pStaticDlg).run_dlgProc(message, wParam, lParam);
			}
		}

	extern (Windows)
	nothrow @nogc
	core.sys.windows.basetsd.INT_PTR run_dlgProc(core.sys.windows.windef.UINT message, core.sys.windows.windef.WPARAM wParam, core.sys.windows.windef.LPARAM lParam);

	nothrow @nogc
	void alignWith(core.sys.windows.windef.HWND handle, core.sys.windows.windef.HWND handle2Align, .PosAlign pos, ref core.sys.windows.windef.POINT point)

		in
		{
		}

		do
		{
			core.sys.windows.windef.RECT rc, rc2;
			core.sys.windows.winuser.GetWindowRect(handle, &rc);

			point.x = rc.left;
			point.y = rc.top;

			switch (pos) {
				case .PosAlign.left:
					core.sys.windows.winuser.GetWindowRect(handle2Align, &rc2);
					point.x -= rc2.right - rc2.left;

					break;

				case .PosAlign.right:
					core.sys.windows.winuser.GetWindowRect(handle, &rc2);
					point.x += rc2.right - rc2.left;

					break;

				case .PosAlign.top:
					core.sys.windows.winuser.GetWindowRect(handle2Align, &rc2);
					point.y -= rc2.bottom - rc2.top;

					break;

				case .PosAlign.bottom:
					core.sys.windows.winuser.GetWindowRect(handle, &rc2);
					point.y += rc2.bottom - rc2.top;

					break;

				default:
					break;
			}

			core.sys.windows.winuser.ScreenToClient(this._hSelf, &point);
		}

	nothrow @nogc
	core.sys.windows.windef.HGLOBAL makeRTLResource(int dialogID, core.sys.windows.winuser.DLGTEMPLATE** ppMyDlgTemplate)

		in
		{
			assert(ppMyDlgTemplate != null);
		}

		do
		{
			// Get Dlg Template resource
			core.sys.windows.windef.HRSRC hDialogRC = core.sys.windows.winbase.FindResourceW(this._hInst, core.sys.windows.winuser.MAKEINTRESOURCEW(dialogID), core.sys.windows.winuser.RT_DIALOG);

			if (hDialogRC == core.sys.windows.windef.NULL) {
				return core.sys.windows.windef.NULL;
			}

			core.sys.windows.windef.HGLOBAL hDlgTemplate = core.sys.windows.winbase.LoadResource(this._hInst, hDialogRC);

			if (hDlgTemplate == core.sys.windows.windef.NULL) {
				return core.sys.windows.windef.NULL;
			}

			core.sys.windows.winuser.DLGTEMPLATE* pDlgTemplate = cast(core.sys.windows.winuser.DLGTEMPLATE*)(core.sys.windows.winbase.LockResource(hDlgTemplate));

			if (pDlgTemplate == core.sys.windows.windef.NULL) {
				return core.sys.windows.windef.NULL;
			}

			// Duplicate Dlg Template resource
			core.stdc.config.c_ulong sizeDlg = core.sys.windows.winbase.SizeofResource(this._hInst, hDialogRC);
			core.sys.windows.windef.HGLOBAL hMyDlgTemplate = core.sys.windows.winbase.GlobalAlloc(core.sys.windows.winbase.GPTR, sizeDlg);
			*ppMyDlgTemplate = cast(core.sys.windows.winuser.DLGTEMPLATE*)(core.sys.windows.winbase.GlobalLock(hMyDlgTemplate));

			core.stdc.string.memcpy(*ppMyDlgTemplate, pDlgTemplate, sizeDlg);

			.DLGTEMPLATEEX* pMyDlgTemplateEx = cast(.DLGTEMPLATEEX*)(*ppMyDlgTemplate);

			if ((*pMyDlgTemplateEx).signature == 0xFFFF) {
				(*pMyDlgTemplateEx).exStyle |= core.sys.windows.winuser.WS_EX_LAYOUTRTL;
			} else {
				(*ppMyDlgTemplate).dwExtendedStyle |= core.sys.windows.winuser.WS_EX_LAYOUTRTL;
			}

			return hMyDlgTemplate;
		}
}
