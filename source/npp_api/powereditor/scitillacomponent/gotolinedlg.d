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
module npp_api.powereditor.scitillacomponent.gotolinedlg;


version (Windows):
version (Not_betterC):

//pragma(lib, "user32");

private static import core.sys.windows.basetsd;
private static import core.sys.windows.windef;
private static import core.sys.windows.winuser;
private static import npp_api.scintilla.scintilla;
private static import npp_api.powereditor.wincontrols.dockingwnd.dockingdlginterface;
private static import npp_api.powereditor.wincontrols.staticdialog.staticdialog;
private static import npp_api.powereditor.resource;
private static import npp_api.powereditor.misc.pluginsmanager.plugininterface;
private static import npp_api.pluginfunc.scintilla_msg;

version (none) {
	extern class ScintillaEditView;
}

class DemoDlg : npp_api.powereditor.wincontrols.dockingwnd.dockingdlginterface.DockingDlgInterface
{
public:
	pure nothrow @safe @nogc
	this()

		do
		{
			super();
		}

	version (none) {
		void initialize(core.sys.windows.windef.HINSTANCE hInst, core.sys.windows.windef.HWND hPere, ScintillaEditView** ppEditView)

			do
			{
				super.initialize(hInst, hPere);

				if (ppEditView == null) {
					throw new Exception(`GoToLineDlg.initialize : ppEditView is null.`);
				}

				this._ppEditView = ppEditView;
			}
	}

	nothrow @nogc
	override void initialize(core.sys.windows.windef.HINSTANCE hInst, core.sys.windows.windef.HWND parent)

		do
		{
			super.initialize(hInst, parent);
		}

	override void create(void* dialog_p, int dialogID, bool isRTL = false, bool msgDestParent = true)

		in
		{
			assert(dialog_p != null);
		}

		do
		{
			super.create(dialog_p, dialogID, isRTL, msgDestParent);
		}

	void doDialog(void* dialog_p, bool isRTL = false)

		do
		{
			if (!super.isCreated()) {
				this.create(dialog_p, npp_api.powereditor.resource.IDD_GOLINE, isRTL);
			}

			this.display();
		}

	nothrow @nogc
	override void display(bool toShow = true, bool enhancedPositioningCheckWhenShowing = false)

		do
		{
			super.display(toShow);

			if (toShow) {
				core.sys.windows.winuser.SetFocus(core.sys.windows.winuser.GetDlgItem(this._hSelf, npp_api.powereditor.resource.ID_GOLINE_EDIT));
			}
		}
protected:
	enum mode
	{
		go2line,
		go2offsset,
	}

	mode _mode = this.mode.go2line;

	extern (Windows)
	nothrow @nogc
	override core.sys.windows.basetsd.INT_PTR run_dlgProc(core.sys.windows.windef.UINT message, core.sys.windows.windef.WPARAM wParam, core.sys.windows.windef.LPARAM lParam)

		do
		{
			switch (message) {
				case core.sys.windows.winuser.WM_INITDIALOG:
					core.sys.windows.winuser.SendDlgItemMessageW(this._hSelf, npp_api.powereditor.resource.IDC_RADIO_GOTOLINE, core.sys.windows.winuser.BM_SETCHECK, core.sys.windows.windef.TRUE, 0);
					this.goToCenter();

					return core.sys.windows.windef.TRUE;

				case core.sys.windows.winuser.WM_COMMAND:
					switch (wParam) {
						case core.sys.windows.winuser.IDCANCEL : // Close
							this.display(false);
							this.cleanLineEdit();

							return core.sys.windows.windef.TRUE;

						case core.sys.windows.winuser.IDOK:
							npp_api.pluginfunc.scintilla_msg.line line = this.getLine();

							if (line != -1) {
								this.display(false);
								this.cleanLineEdit();

								version (none) {
									if (this._mode == this.mode.go2line) {
										(*this._ppEditView).execute(npp_api.scintilla.scintilla.SCI_ENSUREVISIBLE, line - 1);
										(*this._ppEditView).execute(npp_api.scintilla.scintilla.SCI_GOTOLINE, line - 1);
									} else {
										auto sci_line = (*this._ppEditView).execute(npp_api.scintilla.scintilla.SCI_LINEFROMPOSITION, line);
										(*this._ppEditView).execute(npp_api.scintilla.scintilla.SCI_ENSUREVISIBLE, sci_line);
										(*this._ppEditView).execute(npp_api.scintilla.scintilla.SCI_GOTOPOS, line);
									}
								}
							}

							npp_api.scintilla.scintilla.SCNotification notification = {};
							notification.nmhdr.code = npp_api.scintilla.scintilla.SCN_PAINTED;
							notification.nmhdr.hwndFrom = this._hSelf;
							notification.nmhdr.idFrom = core.sys.windows.winuser.GetDlgCtrlID(this._hSelf);

							//common.h
							enum LINKTRIGGERED = core.sys.windows.winuser.WM_USER + 555;

							core.sys.windows.winuser.SendMessageW(this._hParent, core.sys.windows.winuser.WM_NOTIFY, LINKTRIGGERED, cast(core.sys.windows.windef.LPARAM)(&notification));

							version (none) {
								(*this._ppEditView).getFocus();
							}

							return core.sys.windows.windef.TRUE;

						default:
							switch (core.sys.windows.windef.HIWORD(wParam)) {
								case core.sys.windows.winuser.EN_SETFOCUS :
								case core.sys.windows.winuser.BN_SETFOCUS :
									this.updateLinesNumbers();

									return core.sys.windows.windef.TRUE;

								default :
									return core.sys.windows.windef.TRUE;
							}
					}

				default:
					return core.sys.windows.windef.FALSE;
			}
		}

private:
	version (none) {
		ScintillaEditView **_ppEditView = null;
	}

	nothrow @nogc
	void updateLinesNumbers()

		do
		{
			uint current = 0;
			uint limit = 0;

			version (none) {
				if (this._mode == this.mode.go2line) {
					current = cast(uint)((*this._ppEditView).getCurrentLineNumber() + 1);
					limit = cast(uint)((*this._ppEditView).execute(npp_api.scintilla.scintilla.SCI_GETLINECOUNT));
				} else {
					current = cast(uint)((*this._ppEditView).execute(npp_api.scintilla.scintilla.SCI_GETCURRENTPOS));
					limit = cast(uint)((*this._ppEditView).getCurrentDocLen() - 1);
				}
			}

			core.sys.windows.winuser.SetDlgItemInt(this._hSelf, npp_api.powereditor.resource.ID_CURRLINE, current, core.sys.windows.windef.FALSE);
			core.sys.windows.winuser.SetDlgItemInt(this._hSelf, npp_api.powereditor.resource.ID_LASTLINE, limit, core.sys.windows.windef.FALSE);
		}

	nothrow @nogc
	void cleanLineEdit()

		do
		{
			core.sys.windows.winuser.SetDlgItemTextW(this._hSelf, npp_api.powereditor.resource.ID_GOLINE_EDIT, &("\0"w[0]));
		}

	nothrow @nogc
	npp_api.pluginfunc.scintilla_msg.line getLine()

		in
		{
		}

		do
		{
			core.sys.windows.windef.BOOL isSuccessful;
			npp_api.pluginfunc.scintilla_msg.line line = core.sys.windows.winuser.GetDlgItemInt(this._hSelf, npp_api.powereditor.resource.ID_GOLINE_EDIT, &isSuccessful, core.sys.windows.windef.FALSE);

			return (isSuccessful) ? (line) : (-1);
		}
}
