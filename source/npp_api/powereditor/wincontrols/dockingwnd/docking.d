// this file is part of Notepad++
// Copyright (C)2005 Jens Lorenz <jens.plugin.npp@gmx.de>
// 
// This program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public License
// as published by the Free Software Foundation; either
// version 2 of the License, or (at your option) any later version.
// 
// // Note that the GPL places important restrictions on "derived works", yet
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
module npp_api.powereditor.wincontrols.dockingwnd.docking;


version (Windows):

private static import core.sys.windows.windef;
private static import core.sys.windows.winnt;

// ATTENTION : It's a part of interface header, so don't include the others header here

// styles for containers
enum CAPTION_TOP = core.sys.windows.windef.TRUE;
enum CAPTION_BOTTOM = core.sys.windows.windef.FALSE;

//   defines for docking manager
enum CONT_LEFT = 0;
enum CONT_RIGHT = 1;
enum CONT_TOP = 2;
enum CONT_BOTTOM = 3;
enum DOCKCONT_MAX = 4;

// mask params for plugins of internal dialogs

/**
 * Icon for tabs are available
 */
enum DWS_ICONTAB = 0x00000001;

/**
 * Icon for icon bar are available (currently not supported)
 */
enum DWS_ICONBAR = 0x00000002;

/**
 * Additional information are in use
 */
enum DWS_ADDINFO = 0x00000004;

enum DWS_PARAMSALL = .DWS_ICONTAB | .DWS_ICONBAR | .DWS_ADDINFO;

// default docking values for first call of plugin

/**
 * default docking on left
 */
enum DWS_DF_CONT_LEFT = .CONT_LEFT << 28;

/**
 * default docking on right
 */
enum DWS_DF_CONT_RIGHT = .CONT_RIGHT << 28;

/**
 * default docking on top
 */
enum DWS_DF_CONT_TOP = .CONT_TOP << 28;

/**
 * default docking on bottom
 */
enum DWS_DF_CONT_BOTTOM = .CONT_BOTTOM << 28;

/**
 * default state is floating
 */
enum DWS_DF_FLOATING = 0x80000000;

extern (C)
struct tTbData
{
	static import core.sys.windows.windef;
	static import core.sys.windows.winnt;

	/**
	 * client Window Handle
	 */
	core.sys.windows.windef.HWND hClient;

	/**
	 * name of plugin (shown in window)
	 */
	const (core.sys.windows.winnt.WCHAR)* pszName;

	/**
	 * a funcItem provides the function pointer to start a dialog. Please parse here these ID
	 */
	int dlgID;

	// user modifications

	/**
	 * mask params: look to above defines
	 */
	core.sys.windows.windef.UINT uMask;

	/**
	 * icon for tabs
	 */
	core.sys.windows.windef.HICON hIconTab;

	/**
	 * for plugin to display additional informations
	 */
	const (core.sys.windows.winnt.WCHAR)* pszAddInfo;

private:
	/**
	 * floating position
	 */
	core.sys.windows.windef.RECT rcFloat;

	/**
	 * stores the privious container (toggling between float and dock)
	 */
	int iPrevCont;

public:
	/**
	 * it's the plugin file name. It's used to identify the plugin
	 */
	const (core.sys.windows.winnt.WCHAR)* pszModuleName;
}

struct tDockMgr
{
	static import core.sys.windows.windef;

	/**
	 * the docking manager wnd
	 */
	core.sys.windows.windef.HWND hWnd;

	/**
	 * position of docked dialogs
	 */
	core.sys.windows.windef.RECT[.DOCKCONT_MAX] rcRegion;
}

enum HIT_TEST_THICKNESS = 20;
enum SPLITTER_WIDTH = 4;
