// this file is part of Function List Plugin for Notepad++
// Copyright (C)2005 Jens Lorenz <jens.plugin.npp@gmx.de>
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
/**
 *
 *
 * License: GPL-2.0 or later
 */
module npp_api.powereditor.wincontrols.dockingwnd.dockingdlginterface;


version (Windows):
version (Not_betterC):

//pragma(lib, "kernel32");
//pragma(lib, "user32");

private static import core.sys.windows.basetsd;
private static import core.sys.windows.winbase;
private static import core.sys.windows.windef;
private static import core.sys.windows.winuser;
private static import core.sys.windows.winnt;
private static import std.path;
private static import std.string;
private static import std.utf;
private static import npp_api.powereditor.wincontrols.staticdialog.staticdialog;
private static import npp_api.powereditor.wincontrols.dockingwnd.dockingresource;
private static import npp_api.powereditor.wincontrols.dockingwnd.docking;
private static import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;
private static import npp_api.pluginfunc.npp_msgs;

class DockingDlgInterface : npp_api.powereditor.wincontrols.staticdialog.staticdialog.StaticDialog
{
	static import core.sys.windows.basetsd;
	static import core.sys.windows.shlwapi;
	static import core.sys.windows.winbase;
	static import core.sys.windows.windef;
	static import core.sys.windows.winuser;
	static import core.sys.windows.winnt;
	static import npp_api.powereditor.wincontrols.staticdialog.staticdialog;
	static import npp_api.powereditor.wincontrols.dockingwnd.dockingresource;
	static import npp_api.powereditor.wincontrols.dockingwnd.docking;
	static import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;
	static import std.string;
	static import npp_api.pluginfunc.npp_msgs;

protected:
	// Handles
	core.sys.windows.windef.HWND _HSource = core.sys.windows.windef.NULL;
	int _dlgID = -1;
	bool _isFloating = true;
	int _iDockedPos = 0;
	core.sys.windows.winnt.WCHAR[core.sys.windows.windef.MAX_PATH] _moduleName;
	core.sys.windows.winnt.WCHAR[core.sys.windows.windef.MAX_PATH] _pluginName;
	bool _isClosed = false;

public:
	pure nothrow @safe @nogc
	this()

		do
		{
			super();
		}

	pure nothrow @safe @nogc
	this(int dlgID)

		do
		{
			super();
			this._dlgID = dlgID;
		}

	nothrow @nogc
	override void initialize(core.sys.windows.windef.HINSTANCE hInst, core.sys.windows.windef.HWND parent)

		do
		{
			static import std.path;

			super.initialize(hInst, parent);
			core.sys.windows.winbase.GetModuleFileNameW(cast(core.sys.windows.windef.HMODULE)(hInst), &(this._moduleName[0]), core.sys.windows.windef.MAX_PATH);

			core.sys.windows.winbase.lstrcpyW(&(this._moduleName[0]), &((std.path.baseName(this._moduleName)[0])));

			super.initialize(hInst, parent);
			core.sys.windows.winnt.WCHAR[core.sys.windows.windef.MAX_PATH] temp;
			core.sys.windows.winbase.GetModuleFileNameW(cast(core.sys.windows.windef.HMODULE)(hInst), &(temp[0]), core.sys.windows.windef.MAX_PATH);

			//this._moduleName = core.sys.windows.shlwapi.PathFindFileNameW(temp);
			core.sys.windows.winbase.lstrcpyW(&(this._moduleName[0]), &((std.path.baseName(this._moduleName)[0])));
		}

	void create(void* dialog_p, ref npp_api.powereditor.wincontrols.dockingwnd.docking.tTbData data, bool isRTL = false)

		in
		{
			assert(dialog_p != null);
		}

		do
		{
			super.create(dialog_p, this._dlgID, isRTL);
			core.sys.windows.winnt.WCHAR[core.sys.windows.windef.MAX_PATH] temp;
			core.sys.windows.winuser.GetWindowTextW(this._hSelf, &(temp[0]), core.sys.windows.windef.MAX_PATH);
			static assert(this._pluginName.length == temp.length);
			static assert(this._pluginName.length == core.sys.windows.windef.MAX_PATH);
			this._pluginName[0 .. core.sys.windows.windef.MAX_PATH] = temp[0 .. core.sys.windows.windef.MAX_PATH];

			// user information
			data.hClient = this._hSelf;
			data.pszName = &(this._pluginName[0]);

			// supported features by plugin
			data.uMask = 0;

			// additional info
			data.pszAddInfo = null;
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

	nothrow @nogc
	void updateDockingDlg()

		do
		{
			npp_api.pluginfunc.npp_msgs.send_NPPM_DMMUPDATEDISPINFO(this._hParent, this._hSelf);
		}

	pure nothrow @safe @nogc
	override void destroy()

		do
		{
		}

	void setBackgroundColor(core.sys.windows.windef.COLORREF bgColour) = 0;
	void setForegroundColor(core.sys.windows.windef.COLORREF bgColour) = 0;

	nothrow @nogc
	override void display(bool toShow = true)

		do
		{
			core.sys.windows.winuser.SendMessageW(this._hParent, (toShow) ? (npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPM_DMMSHOW) : (npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPM_DMMHIDE), 0, cast(core.sys.windows.windef.LPARAM)(this._hSelf));
		}

	pure nothrow @safe @nogc
	bool isClosed() const

		do
		{
			return this._isClosed;
		}

	pure nothrow @safe @nogc
	void setClosed(bool toClose)

		do
		{
			this._isClosed = toClose;
		}

	pure nothrow @safe @nogc
	const (core.sys.windows.winnt.WCHAR)* getPluginFileName() const

		do
		{
			return &(this._moduleName[0]);
		}

protected:
	extern (Windows)
	nothrow @nogc
	override core.sys.windows.basetsd.INT_PTR run_dlgProc(core.sys.windows.windef.UINT message, core.sys.windows.windef.WPARAM wParam, core.sys.windows.windef.LPARAM lParam)

		do
		{
			switch (message) {
				case core.sys.windows.winuser.WM_NOTIFY:
					core.sys.windows.winuser.LPNMHDR pnmh = cast(core.sys.windows.winuser.LPNMHDR)(lParam);

					if ((*pnmh).hwndFrom == this._hParent) {
						switch (core.sys.windows.windef.LOWORD((*pnmh).code)) {
							case npp_api.powereditor.wincontrols.dockingwnd.dockingresource.DMN_CLOSE:
								break;

							case npp_api.powereditor.wincontrols.dockingwnd.dockingresource.DMN_FLOAT:
								this._isFloating = true;

								break;

							case npp_api.powereditor.wincontrols.dockingwnd.dockingresource.DMN_DOCK:
								this._iDockedPos = core.sys.windows.windef.HIWORD(pnmh.code);
								this._isFloating = false;

								break;

							default:
								break;
						}
					}

					break;

				default:
					break;
			}

			return core.sys.windows.windef.FALSE;
		}
}
