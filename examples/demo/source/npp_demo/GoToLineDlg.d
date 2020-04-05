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
 * plugin DLL interface
 *
 * License: GPL-2.0 or later
 */
module npp_demo.gotolinedlg;


private static import core.sys.windows.basetsd;
private static import core.sys.windows.windef;
private static import core.sys.windows.winuser;
private static import npp_api.powereditor.misc.pluginsmanager.plugininterface;
private static import npp_api.powereditor.scitillacomponent.gotolinedlg;
private static import npp_api.pluginfunc.scintilla_msg;
private static import npp_api.powereditor.wincontrols.dockingwnd.dockingdlginterface;
private static import npp_api.pluginfunc.npp_msgs;
private static import npp_demo.resource;

extern (C)
extern npp_api.powereditor.misc.pluginsmanager.plugininterface.NppData nppData;

extern (C)
extern __gshared npp_api.powereditor.misc.pluginsmanager.plugininterface.NppData gshared_nppData;

class demo_dlg : npp_api.powereditor.wincontrols.dockingwnd.dockingdlginterface.DockingDlgInterface
{
	pure nothrow @safe @nogc
	this()

		do
		{
			super(npp_demo.resource.IDD_PLUGINGOLINE_DEMO);
		}

	nothrow @nogc
	override void display(bool toShow = true, bool enhancedPositioningCheckWhenShowing = false)

		do
		{
			super.display(toShow);

			if (toShow) {
				core.sys.windows.winuser.SetFocus(core.sys.windows.winuser.GetDlgItem(this._hSelf, npp_demo.resource.ID_GOLINE_EDIT));
			}
		}

	nothrow @nogc
	void setParent(core.sys.windows.windef.HWND parent2set)

		do
		{
			this._hParent = parent2set;
		}

protected:
	extern (Windows)
	nothrow @nogc
	override core.sys.windows.basetsd.INT_PTR run_dlgProc(core.sys.windows.windef.UINT message, core.sys.windows.windef.WPARAM wParam, core.sys.windows.windef.LPARAM lParam)

		do
		{
			switch (message) {
				case core.sys.windows.winuser.WM_COMMAND:
					switch (wParam) {
						case core.sys.windows.winuser.IDOK:
							npp_api.pluginfunc.scintilla_msg.line line = this.getLine();

							if (line != -1) {
								// Get the current scintilla
								int which = -1;
								npp_api.pluginfunc.npp_msgs.send_NPPM_GETCURRENTSCINTILLA(gshared_nppData._nppHandle, which);

								if (which == -1) {
									return core.sys.windows.windef.FALSE;
								}

								core.sys.windows.windef.HWND curScintilla = (which == 0) ? (gshared_nppData._scintillaMainHandle) : (gshared_nppData._scintillaSecondHandle);

								npp_api.pluginfunc.scintilla_msg.send_SCI_ENSUREVISIBLE(curScintilla, line - 1);
								npp_api.pluginfunc.scintilla_msg.send_SCI_GOTOLINE(curScintilla, line - 1);
							}

							return core.sys.windows.windef.TRUE;

						default:
							break;
					}

					return core.sys.windows.windef.FALSE;

				default:
					return super.run_dlgProc(message, wParam, lParam);
			}
		}

private:
	nothrow @nogc
	npp_api.pluginfunc.scintilla_msg.line getLine()

		do
		{
			core.sys.windows.windef.BOOL isSuccessful;
			npp_api.pluginfunc.scintilla_msg.line line = core.sys.windows.winuser.GetDlgItemInt(this._hSelf, npp_demo.resource.ID_GOLINE_EDIT, &isSuccessful, core.sys.windows.windef.FALSE);

			return (isSuccessful) ? (line) : (-1);
		}
}

.demo_dlg _goToLine;
