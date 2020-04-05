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
 * プラグインの定義から自動的にインターフェイスをミックスインするためのもの
 *
 * Author: dokutoku, https://twitter.com/dokutoku3
 * License: GPL-2.0 or later
 */
module npp_api.pluginfunc.extra_interfece;


version (Windows):
version (Not_betterC):

private static import core.sys.windows.windef;
private static import std.traits;
private static import npp_api.powereditor.misc.pluginsmanager.plugininterface;
private static import npp_api.pluginfunc.config_file;
private static import npp_api.pluginfunc.menu;

enum current_mixin_version = 0.001;

/**
 * ToDo:
 */
struct npp_plugin_definition
{
	static import npp_api.powereditor.misc.pluginsmanager.plugininterface;
	static import npp_api.pluginfunc.config_file;
	static import npp_api.pluginfunc.menu;
	static import npp_api.pluginfunc.config_file;

	//immutable string released = null;

	float mixin_version = current_mixin_version;

	npp_api.pluginfunc.config_file.config_type_t config_type = npp_api.pluginfunc.config_file.config_type_t.none;

	/**
	 * Plugin name
	 */
	string name = null;

	/**
	 * Plugin version
	 */
	float version_number = 0.001;

	/**
	 * version version string
	 */
	string version_string = null;

	/**
	 * Author name
	 */
	string author = null;

	/**
	 * plugin config file info
	 */
	npp_api.pluginfunc.config_file.plugin_config_info config_info;

	/**
	 * menu list
	 */
	npp_api.pluginfunc.menu.menu_item_t[] menu_items = null;

	//ToDo: export?

	invariant
	{
	}
}

mixin template npp_main_menu(npp_api.pluginfunc.menu.menu_item_t[] main_menu_items)
{
	private static import npp_api.pluginfunc.menu;

	static if (!__traits(compiles, .main_menu_def)) {
		/*
		 * main menu
		 */
		enum npp_api.powereditor.misc.pluginsmanager.plugininterface.FuncItem[main_menu_items.length] main_menu_def = npp_api.pluginfunc.menu.create_main_menu!(main_menu_items.length)(main_menu_items);
		npp_api.powereditor.misc.pluginsmanager.plugininterface.FuncItem[main_menu_items.length] main_menu = main_menu_def;
	}
}

mixin template npp_menu_actions(npp_api.pluginfunc.menu.menu_item_t[] menu_container)
{
	private static import npp_api.pluginfunc.menu;

	static if (!__traits(compiles, .sub_menu_actions_def)) {
		/*
		 * sub menu actions
		 */
		enum sub_menu_actions_def = npp_api.pluginfunc.menu.create_sub_menu_actions(menu_container);
		static assert(sub_menu_actions_def.length == npp_api.pluginfunc.menu.count_sub_menu_ids(menu_container));
		npp_api.pluginfunc.menu.menu_action[sub_menu_actions_def.length] sub_menu_actions = .sub_menu_actions_def;
	}
}

mixin template npp_menu_index(npp_api.pluginfunc.menu.menu_item_t[] menu_container)
{
	private static import npp_api.pluginfunc.menu;

	static if (!__traits(compiles, .menu_index_def)) {
		/*
		 *
		 */
		enum menu_index_length = npp_api.pluginfunc.menu.count_all_menu_items(menu_container);
		enum npp_api.pluginfunc.menu.sub_menu_index[menu_index_length] menu_index_def = npp_api.pluginfunc.menu.create_menu_index!(menu_index_length)(menu_container);
		npp_api.pluginfunc.menu.sub_menu_index[menu_index_length] menu_index = .menu_index_def;

		/*
		 * メニュー部分のインデックスを返す
		 */
		template search_menu_index(string id)
		{
			enum size_t search_menu_index = npp_api.pluginfunc.menu.search_menu_index(.menu_index_def, id);
		}

		template search_index(string id)
		{
			enum size_t search_index = npp_api.pluginfunc.menu.search_index(.menu_index_def, id);
			static assert(menu_index_length >= search_index);
		}
	}

	static assert(.menu_index_def.length == npp_api.pluginfunc.menu.count_all_menu_items(menu_container));
}

mixin template npp_autoload(npp_api.pluginfunc.config_file.config_type_t config_type, npp_api.pluginfunc.config_file.setting_item[] settings)
{
	private static import std.algorithm;
	private static import npp_api.pluginfunc.config_file;
	private static import npp_api.pluginfunc.ini_setting;

	static if ((!__traits(compiles, .auto_settings)) && (settings.length != 0)) {
		static if (config_type == npp_api.pluginfunc.config_file.config_type_t.ini) {
			enum auto_settings_def = npp_api.pluginfunc.ini_setting.convert_setting!(settings.length)(settings);
			npp_api.pluginfunc.ini_setting.ini_setting_item[settings.length] auto_settings = auto_settings_def;
			enum wstring[] setting_ids = npp_api.pluginfunc.ini_setting.create_setting_idetifiers(auto_settings_def);

			deprecated
			alias setting_identifiers = .setting_ids;

			deprecated
			alias search_setting_identifier_index = .search_setting_id_index;

			size_t search_setting_id_index(wstring[] id_list, wstring id)

				do
				{
					for (size_t i = 0; i < id_list.length; i++) {
						if (std.algorithm.cmp(id_list[i], id) == 0) {
							return i;
						}
					}

					assert(0);
				}

			deprecated
			alias search_setting_identifier = .search_setting_id;

			template search_setting_id(wstring id)
			{
				enum search_setting_id = search_setting_id_index(.setting_ids, id);
				static assert(auto_settings_def.length > search_setting_id);
			}
		} else static if (config_type == npp_api.pluginfunc.config_file.config_type_t.none) {
		} else {
			static assert(false);
		}
	}
}

mixin template menu_checked_list(size_t main_menu_length, npp_api.pluginfunc.menu.sub_menu_index[] menu_index)
{
	private static import npp_api.pluginfunc.menu;

	static if (!__traits(compiles, .menu_index_checked_def)) {
		deprecated
		alias menu_index_checked_identifiers = .menu_index_checked_ids;

		deprecated
		alias main_menu_checked_identifiers = .main_menu_checked_ids;

		enum wstring[] menu_index_checked_ids = npp_api.pluginfunc.menu.create_menu_index_checked_id(menu_index);
		enum wstring[] main_menu_checked_ids = npp_api.pluginfunc.menu.create_main_menu_checked_id(menu_index);
	}
}

/**
 * menu_index_checkedからmain_menu_checkedへコピーする
 */
pure nothrow @safe @nogc
void update_main_menu_checked(size_t main_menu_length, size_t menu_index_length)(ref npp_api.powereditor.misc.pluginsmanager.plugininterface.FuncItem[main_menu_length] main_menu, const ref npp_api.pluginfunc.menu.sub_menu_index[menu_index_length] menu_index)

	in
	{
	}

	do
	{
		for (size_t i = 0, j = 0; i < menu_index.length; i++) {
			if (menu_index[i].depth == 1) {
				main_menu[j]._init2Check = menu_index[i].func_item._init2Check;
				j++;
			}
		}
	}

mixin template npp_plugin_config(npp_api.pluginfunc.config_file.config_type_t type)
{
	static if (!__traits(compiles, .plugin_config_file)) {
		static if (type == npp_api.pluginfunc.config_file.config_type_t.ini) {
			npp_api.pluginfunc.ini_setting.npp_ini_session plugin_config_file;
		} else static if (type == npp_api.pluginfunc.config_file.config_type_t.none) {
		} else {
			static assert(false);
		}
	}
}

mixin template npp_DLLMain(npp_api.pluginfunc.config_file.config_type_t type, wstring[] menu_index_checked_ids, alias menu_index)
{
	private static import core.sys.windows.basetsd;
	private static import core.sys.windows.dll;
	private static import core.sys.windows.windef;
	private static import core.sys.windows.winnt;
	private static import npp_api.pluginfunc.config_file;

	static if (!__traits(compiles, .DllMain)) {
		pragma(mangle, "DllMain")
		extern (Windows)
		export core.sys.windows.windef.BOOL DllMain(core.sys.windows.basetsd.HANDLE hModule, core.sys.windows.windef.DWORD reasonForCall, core.sys.windows.winnt.LPVOID lpReserved)

			do
			{
				static import core.sys.windows.dll;
				static import core.sys.windows.windef;
				static import core.sys.windows.winnt;

				switch (reasonForCall) {
					case core.sys.windows.winnt.DLL_PROCESS_ATTACH:
						core.sys.windows.dll.dll_process_attach(hModule);

						static if (__traits(compiles, .pluginInit)) {
							.pluginInit(hModule);
						}

						break;

					case core.sys.windows.winnt.DLL_PROCESS_DETACH:
						static if ((type != npp_api.pluginfunc.config_file.config_type_t.none) && (menu_index_checked_ids.length != 0)) {
							plugin_config_file.write_menu_checked(menu_index);
						}

						static if (__traits(compiles, .pluginCleanUp)) {
							.pluginCleanUp();
						}

						core.sys.windows.dll.dll_process_detach(hModule);

						break;

					case core.sys.windows.winnt.DLL_THREAD_ATTACH:
						core.sys.windows.dll.dll_thread_attach(true, true);

						break;

					case core.sys.windows.winnt.DLL_THREAD_DETACH:
						core.sys.windows.dll.dll_thread_detach(true, true);

						break;

					default:
						break;
				}

				return core.sys.windows.windef.TRUE;
			}
	}
}

mixin template npp_setInfo(alias nppData, npp_api.pluginfunc.config_file.plugin_config_info config_info, alias plugin_config_file, alias auto_settings, alias main_menu, alias menu_index)
	if (is(typeof(nppData) == npp_api.powereditor.misc.pluginsmanager.plugininterface.NppData) && std.traits.isStaticArray!(typeof(main_menu)) && std.traits.isStaticArray!(typeof(menu_index)))
{
	private static import npp_api.powereditor.misc.pluginsmanager.plugininterface;
	private static import npp_api.pluginfunc.extra_interfece;
	private static import npp_api.pluginfunc.config_file;

	static if (!__traits(compiles, .setInfo)) {
		pragma(mangle, "setInfo")
		extern (C)
		nothrow
		export void setInfo(npp_api.powereditor.misc.pluginsmanager.plugininterface.NppData notpadPlusData)

			do
			{
				static import std.utf;
				static import npp_api.pluginfunc.extra_interfece;

				nppData = notpadPlusData;

				static if (__traits(compiles, .gshared_nppData)) {
					.gshared_nppData = notpadPlusData;
				}

				try {
					static if (config_info.type != npp_api.pluginfunc.config_file.config_type_t.none) {
						enum directory_name = std.utf.toUTF16(config_info.directory_name);
						enum file_name = std.utf.toUTF16(config_info.file_name);
						enum section_name = std.utf.toUTF16(config_info.ini_section_name);
						plugin_config_file = npp_api.pluginfunc.ini_setting.npp_ini_session(nppData._nppHandle, directory_name, file_name, section_name);

						static if (main_menu.length != 0) {
							plugin_config_file.auto_load(auto_settings, menu_index);
						} else {
							plugin_config_file.auto_load(auto_settings);
						}
					}

					static if (main_menu.length != 0) {
						npp_api.pluginfunc.extra_interfece.update_main_menu_checked(main_menu, menu_index);
					}
				} catch (Exception e) {
					//ToDo:
				}

				static if (__traits(compiles, .pluginSetInfo)) {
					.pluginSetInfo(notpadPlusData);
				}
			}
	}
}

mixin template npp_beNotified(alias nppData, alias main_menu, alias menu_index, alias menu_index_def, alias sub_menu_actions)
{
	private static import std.traits;
	private static import npp_api.scintilla.scintilla;
	private static import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;
	private static import npp_api.pluginfunc.menu;

	static if (!__traits(compiles, .beNotified) && (npp_api.pluginfunc.menu.allocate_sub_menu_length(menu_index_def) != 0)) {
		static if (__traits(compiles, .pluginBeNotified) && !std.traits.hasFunctionAttributes!(.pluginBeNotified, "@nogc")) {
			pragma(mangle, "beNotified")
			extern (C)
			nothrow
			export void beNotified(npp_api.scintilla.scintilla.SCNotification* notifyCode)

				do
				{
					static import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;
					static import npp_api.pluginfunc.menu;

					/+
					if (notifyCode == null) {
						return;
					}
					+/

					switch ((*notifyCode).nmhdr.code) {
						case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPN_TBMODIFICATION:
							//init submenu
							enum required = npp_api.pluginfunc.menu.allocate_sub_menu_length(menu_index_def);
							npp_api.pluginfunc.menu.init_submenu(nppData._nppHandle, main_menu, menu_index, sub_menu_actions, required);

							break;

						default:
							break;
					}

					.pluginBeNotified(*notifyCode);
				}
		} else {
			pragma(mangle, "beNotified")
			extern (C)
			nothrow @nogc
			export void beNotified(npp_api.scintilla.scintilla.SCNotification* notifyCode)

				do
				{
					static import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;
					static import npp_api.pluginfunc.menu;

					/+
					if (notifyCode == null) {
						return;
					}
					+/

					switch ((*notifyCode).nmhdr.code) {
						case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPN_TBMODIFICATION:
							//init submenu
							enum required = npp_api.pluginfunc.menu.allocate_sub_menu_length(menu_index_def);
							npp_api.pluginfunc.menu.init_submenu(nppData._nppHandle, main_menu, menu_index, sub_menu_actions, required);

							break;

						default:
							break;
					}

					static if (__traits(compiles, .pluginBeNotified)) {
						.pluginBeNotified(*notifyCode);
					}
				}
		}
	}
}

mixin template npp_messageProc(alias sub_menu_actions_def)
	if (std.traits.isArray!(typeof(sub_menu_actions_def)))
{
	private static import core.sys.windows.windef;
	private static import core.sys.windows.winuser;
	private static import npp_api.pluginfunc.menu;
	private static import npp_api.pluginfunc.basic_interface;

	static if ((!__traits(compiles, .messageProc)) && (sub_menu_actions_def.length != 0)) {
		pragma(mangle, "messageProc")
		extern (C)
		nothrow
		export core.sys.windows.windef.LRESULT messageProc(core.sys.windows.windef.UINT Message, core.sys.windows.windef.WPARAM wParam, core.sys.windows.windef.LPARAM lParam)

			do
			{
				static import core.sys.windows.windef;
				static import core.sys.windows.winuser;
				static import npp_api.pluginfunc.menu;
				static import npp_api.pluginfunc.basic_interface;

				if (Message == core.sys.windows.winuser.WM_COMMAND) {
					int id = core.sys.windows.windef.LOWORD(wParam);

					if (npp_api.pluginfunc.menu.sub_menu_action(id, .sub_menu_actions)) {
						return core.sys.windows.windef.TRUE;
					}
				}

				static if (__traits(compiles, .pluginMessageProc)) {
					if (pluginMessageProc(Message, wParam, lParam)) {
						return core.sys.windows.windef.TRUE;
					} else {
						return core.sys.windows.windef.FALSE;
					}
				} else {
					return core.sys.windows.windef.TRUE;
				}
			}
	}
}

mixin template npp_plugin_interface(.npp_plugin_definition plugin_def)
{
	private static import std.utf;
	private static import npp_api.pluginfunc.basic;
	private static import npp_api.pluginfunc.string;
	private static import npp_api.pluginfunc.basic_interface;
	private static import npp_api.pluginfunc.extra_interfece;

	static assert(npp_api.pluginfunc.extra_interfece.current_mixin_version >= plugin_def.mixin_version);
	enum plugin_name = npp_api.pluginfunc.string.c_wstring!(std.utf.toUTF16(plugin_def.name)).idup;

	mixin npp_api.pluginfunc.basic_interface.npp_nppData!();
	mixin npp_api.pluginfunc.basic.plugin_messageBox!(plugin_name);
	mixin npp_api.pluginfunc.extra_interfece.npp_menu_actions!(plugin_def.menu_items);
	mixin npp_api.pluginfunc.extra_interfece.npp_main_menu!(plugin_def.menu_items);
	mixin npp_api.pluginfunc.extra_interfece.npp_messageProc!(sub_menu_actions_def);
	mixin npp_api.pluginfunc.extra_interfece.npp_menu_index!(plugin_def.menu_items);
	mixin npp_api.pluginfunc.extra_interfece.npp_autoload!(plugin_def.config_info.type, plugin_def.config_info.settings);
	mixin npp_api.pluginfunc.extra_interfece.menu_checked_list!(.main_menu.length, .menu_index_def);
	mixin npp_api.pluginfunc.extra_interfece.npp_plugin_config!(plugin_def.config_info.type);
	mixin npp_api.pluginfunc.extra_interfece.npp_DLLMain!(plugin_def.config_info.type, .menu_index_checked_ids, .menu_index);

	//ToDo:
	static if (__traits(compiles, .plugin_config_file) && __traits(compiles, .auto_settings)) {
		mixin npp_api.pluginfunc.extra_interfece.npp_setInfo!(.nppData, plugin_def.config_info, .plugin_config_file, .auto_settings, .main_menu, .menu_index);
	}

	mixin npp_api.pluginfunc.extra_interfece.npp_beNotified!(.nppData, .main_menu, .menu_index, .menu_index_def, .sub_menu_actions);
	mixin npp_api.pluginfunc.basic_interface.npp_plugin_interface!(plugin_name, main_menu_def);
	mixin npp_api.pluginfunc.basic_interface.npp_plugin_interface!();
}
