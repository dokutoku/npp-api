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
 * BetterC test2
 *
 * Author: dokutoku, https://twitter.com/dokutoku3
 * License: GPL-2.0 or later
 */
module nppplugintemplate.better_c_test2;


version (Windows):
version (D_BetterC):
version (betterC_test2):

private static import npp_api.powereditor.misc.pluginsmanager.plugininterface;
private static import npp_api.pluginfunc.basic_interface;

extern (C)
pure nothrow @safe @nogc
void dummy_func()

	do
	{
	}

enum npp_api.powereditor.misc.pluginsmanager.plugininterface.FuncItem[] main_menu_items_def =
[
	{
		_itemName: "dummy menu"w,
		_pFunc: &dummy_func,
		_init2Check: false,
		_pShKey: null,
	},
];

mixin npp_api.pluginfunc.basic_interface.npp_plugin_interface!("BetterC test2"w, main_menu_items_def);
