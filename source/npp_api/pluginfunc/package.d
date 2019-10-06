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
 * general plugin functions
 *
 * Author: dokutoku, https://twitter.com/dokutoku3
 * License: GPL-2.0 or later
 */
module npp_api.pluginfunc;


public import core.sys.windows.windows;
public import npp_api.powereditor.menucmdid;
public import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;
public import npp_api.powereditor.misc.pluginsmanager.plugininterface;
public import npp_api.powereditor.resource;
public import npp_api.scintilla.scintilla;
public import npp_api.scintilla.Sci_Position;
public import npp_api.pluginfunc.basic;
public import npp_api.pluginfunc.basic_interface;
public import npp_api.pluginfunc.config_file;
public import npp_api.pluginfunc.export_info;
public import npp_api.pluginfunc.shortcut;
public import npp_api.pluginfunc.string;
public import npp_api.pluginfunc.ini_setting;
public import npp_api.pluginfunc.json_setting;
public import npp_api.pluginfunc.lang;
public import npp_api.pluginfunc.menu;
public import npp_api.pluginfunc.extra_interfece;
public import npp_api.pluginfunc.npp_msgs;
public import npp_api.pluginfunc.path;
public import npp_api.pluginfunc.auto_pFunc;
public import npp_api.pluginfunc.scintilla_msg;
