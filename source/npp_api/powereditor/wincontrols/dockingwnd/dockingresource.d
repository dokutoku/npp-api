// this file is part of docking functionality for Notepad++
// Copyright (C)2006 Jens Lorenz <jens.plugin.npp@gmx.de>
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
module npp_api.powereditor.wincontrols.dockingwnd.dockingresource;


private static import core.sys.windows.windef;

enum DM_NOFOCUSWHILECLICKINGCAPTION = "NOFOCUSWHILECLICKINGCAPTION";

enum IDD_PLUGIN_DLG = 103;
enum IDC_EDIT1 = 1000;

enum IDB_CLOSE_DOWN = 137;
enum IDB_CLOSE_UP = 138;
enum IDD_CONTAINER_DLG = 139;

enum IDC_TAB_CONT = 1027;
enum IDC_CLIENT_TAB = 1028;
enum IDC_BTN_CAPTION = 1050;

enum DMM_MSG = 0x5000;
enum DMM_CLOSE = .DMM_MSG + 1;
enum DMM_DOCK = .DMM_MSG + 2;
enum DMM_FLOAT = .DMM_MSG + 3;
enum DMM_DOCKALL = .DMM_MSG + 4;
enum DMM_FLOATALL = .DMM_MSG + 5;
enum DMM_MOVE = .DMM_MSG + 6;
enum DMM_UPDATEDISPINFO = .DMM_MSG + 7;
enum DMM_GETIMAGELIST = .DMM_MSG + 8;
enum DMM_GETICONPOS = .DMM_MSG + 9;
enum DMM_DROPDATA = .DMM_MSG + 10;
enum DMM_MOVE_SPLITTER = .DMM_MSG + 11;
enum DMM_CANCEL_MOVE = .DMM_MSG + 12;
enum DMM_LBUTTONUP = .DMM_MSG + 13;

enum DMN_FIRST = 1050;
enum DMN_CLOSE = .DMN_FIRST + 1;
//nmhdr.code = core.sys.windows.windef.DWORD(.DMN_CLOSE, 0));
//nmhdr.hwndFrom = hwndNpp;
//nmhdr.idFrom = ctrlIdNpp;

enum DMN_DOCK = .DMN_FIRST + 2;
enum DMN_FLOAT = .DMN_FIRST + 3;
//nmhdr.code = core.sys.windows.windef.DWORD(DMN_XXX, int newContainer);
//nmhdr.hwndFrom = hwndNpp;
//nmhdr.idFrom = ctrlIdNpp;

enum DMN_SWITCHIN = .DMN_FIRST + 4;
enum DMN_SWITCHOFF = .DMN_FIRST + 5;
enum DMN_FLOATDROPPED = .DMN_FIRST + 6;
//nmhdr.code = core.sys.windows.windef.DWORD(DMN_XXX, 0);
//nmhdr.hwndFrom = DockingCont::_hself;
//nmhdr.idFrom = 0;
