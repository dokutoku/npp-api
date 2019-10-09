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
 * npp menu
 *
 * Author: dokutoku, https://twitter.com/dokutoku3
 * License: GPL-2.0 or later
 */
module npp_api.pluginfunc.menu;


version (Windows):
version (Not_betterC):

private static import core.sys.windows.windef;
private static import core.sys.windows.winuser;
private static import std.traits;
private static import std.utf;
private static import std.algorithm;
private static import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;
private static import npp_api.pluginfunc.npp_msgs;
private static import npp_api.pluginfunc.string;
private static import npp_api.powereditor.misc.pluginsmanager.plugininterface;
private static import npp_api.powereditor.resource;

enum max_submenu_length = npp_api.powereditor.resource.ID_PLUGINS_CMD_DYNAMIC_LIMIT - npp_api.powereditor.resource.ID_PLUGINS_CMD_DYNAMIC;

/**
 * メニューのアクションを照会・実行するための情報を保存する構造体
 */
struct menu_action
{
	int _cmdID = 0;
	npp_api.powereditor.misc.pluginsmanager.plugininterface.PFUNCPLUGINCMD _pFunc = null;
}

/**
 * create_sub_menu_actionsの再起関数
 */
pure nothrow @safe @nogc
private void internal_create_sub_menu_actions(ref .menu_action[] output, ref size_t i, .menu_item_t[] sub_menu)

	in
	{
		assert(sub_menu != null);
	}

	do
	{
		.menu_action output_temp;

		foreach (menu; sub_menu) {
			output_temp._pFunc = menu.func_item._pFunc;
			output[i] = output_temp;
			i++;

			if (menu.sub_menu != null) {
				internal_create_sub_menu_actions(output, i, menu.sub_menu);
			}
		}
	}

/**
 * サブメニューのアクションのリストを作成する
 */
pure nothrow @safe
.menu_action[] create_sub_menu_actions(.menu_item_t[] menu_container)

	do
	{
		.menu_action[] output = new .menu_action[.count_sub_menu_identifiers(menu_container)];

		size_t i = 0;

		foreach (menu; menu_container) {
			if (menu.sub_menu != null) {
				internal_create_sub_menu_actions(output, i, menu.sub_menu);
			}
		}

		return output;
	}

/**
 * 登録されているアクションのリストからIDを探し出して、関数を実行する
 */
nothrow
bool sub_menu_action(size_t actions_length)(const int cmdID, const ref .menu_action[actions_length] menu_actions)

	do
	{
		foreach (menu_func; menu_actions) {
			if (cmdID == menu_func._cmdID) {
				if (menu_func._pFunc != null) {
					menu_func._pFunc();
				}

				return true;
			}
		}

		return false;
	}

/**
 * メインメニューやサブメニューを格納するための構造体
 */
struct menu_item_t
{
	string identifier = null;
	string menu_checked_identifier = null;
	core.sys.windows.windef.HMENU menu_handle = core.sys.windows.windef.NULL;
	npp_api.powereditor.misc.pluginsmanager.plugininterface.FuncItem func_item = void;
	.menu_item_t[] sub_menu = null;

	invariant
	{
		if (this.menu_checked_identifier != null) {
			assert(this.identifier != null);
		}

		if (this.identifier != null) {
			assert((npp_api.powereditor.misc.pluginsmanager.plugininterface.nbChar - 1) >= npp_api.pluginfunc.string.count_string(this.func_item._itemName));
		} else {
			assert(this.menu_checked_identifier == null);
			assert(this.menu_handle == core.sys.windows.windef.NULL);
			assert(this.sub_menu == null);
		}
	}

	invariant
	{
		assert(this.menu_checked_identifier.length <= 63);
	}
}

pure nothrow @safe @nogc
size_t max_identifier_length(bool is_c_string)(const .menu_item_t[] menu_container)

	in
	{
		assert(menu_container.length != 0);
	}

	do
	{
		void max_identifier_length_internal(const .menu_item_t[] menu_items, ref size_t i)

			do
			{
				foreach (menu_item; menu_items) {
					i = (menu_item.identifier.length > i) ? (menu_item.identifier.length) : (i);

					if (menu_item.sub_menu != null) {
						max_identifier_length_internal(menu_item.sub_menu, i);
					}
				}
			}

		size_t max_length = 0;
		max_identifier_length_internal(menu_container, max_length);

		static if (is_c_string) {
			max_length++;
		}

		return max_length;
	}

/**
 * メインメニューを含むメニューのインデックス
 */
struct sub_menu_index
{
	size_t parent_index = 0;
	size_t parent_cmdID = 0;
	size_t depth = 0;
	size_t menu_index = 0;
	string identifier = null;
	wstring menu_checked_identifier = null;
	npp_api.powereditor.misc.pluginsmanager.plugininterface.FuncItem func_item;

	/**
	 * サブメニュー用のハンドル
	 */
	core.sys.windows.windef.HMENU menu_handle = core.sys.windows.windef.NULL;

	invariant
	{
		if (this.menu_checked_identifier != null) {
			assert(this.identifier != null);
		}
	}
}

/**
 * メモリ確保するための、サブメニューの数をカウントする
 * identifierがnullでもカウントする。
 */
pure nothrow @safe @nogc
int allocate_sub_menu_length(const .sub_menu_index[] menu_index)

	in
	{
		assert(menu_index.length != 0);
	}

	out(result)
	{
		static import npp_api.powereditor.resource;

		assert(result >= 0);
		assert(max_submenu_length >= result);
	}

	do
	{
		size_t alloc_count = 0;

		foreach (menu; menu_index) {
			if (menu.depth <= 1) {
				continue;
			}

			alloc_count++;
		}

		return cast(int)(alloc_count);
	}

/**
 * create_menu_indexの再帰関数
 */
private void create_menu_index_internal(size_t OUTPUT_LENGTH)(.menu_item_t[] menu_items, ref .sub_menu_index[OUTPUT_LENGTH] output, ref size_t i, size_t depth, size_t parent_index)

	do
	{
		static import std.utf;
		static import npp_api.pluginfunc.auto_pFunc;

		depth++;

		.sub_menu_index index_temp = {parent_index: parent_index, depth: depth};

		size_t index = 0;

		foreach (menu_item; menu_items) {
			index_temp.menu_index = index;
			index_temp.identifier = menu_item.identifier;
			index_temp.menu_checked_identifier = std.utf.toUTF16(menu_item.menu_checked_identifier);
			index_temp.func_item = menu_item.func_item;

			/+
			//ToDo:
			if ((index_temp.menu_checked_identifier != null) && ((index_temp.func_item._pFunc == null) || (index_temp.func_item._pFunc == &npp_api.pluginfunc.auto_pFunc.auto_dummy_func))) {
				index_temp.func_item._pFunc = ;
			}
			+/

			output[i] = index_temp;
			i++;

			if (menu_item.sub_menu != null) {
				create_menu_index_internal(menu_item.sub_menu, output, i, depth, index);
			}

			index++;
		}
	}

/*
 * メニューの設定から検索用のインデックスを作成する
 */
.sub_menu_index[OUTPUT_LENGTH] create_menu_index(size_t OUTPUT_LENGTH)(.menu_item_t[] menu_container)

	in
	{
		assert(OUTPUT_LENGTH == .count_all_menu_items(menu_container));
	}

	do
	{
		static import std.utf;
		static import std.string;

		.sub_menu_index[OUTPUT_LENGTH] output;
		size_t count = 0;
		size_t depth = 0;
		size_t i = 0;
		create_menu_index_internal(menu_container, output, i, depth, 0);

		return output;
	}

pure nothrow @safe @nogc
size_t search_menu_index(menu_t)(const menu_t menu_index, string identifier)
	if (std.traits.isArray!(menu_t))

	do
	{
		size_t i = 0;

		for (; i < menu_index.length; i++) {
			if (menu_index[i].identifier.length == 0) {
				continue;
			}

			if (std.algorithm.cmp(menu_index[i].identifier, identifier) == 0) {
				return menu_index[i].menu_index;
			}
		}

		assert(false);
	}

pure nothrow @safe @nogc
size_t search_index(menu_t)(const menu_t menu_index, string identifier)
	if (std.traits.isArray!(menu_t))

	in
	{
		assert(identifier.length != 0);
	}

	do
	{
		size_t i = 0;

		for (; i < menu_index.length; i++) {
			if (menu_index[i].identifier.length == 0) {
				continue;
			}

			if (std.algorithm.cmp(menu_index[i].identifier, identifier) == 0) {
				return i;
			}
		}

		assert(false);
	}

/**
 * メモリ確保するための、サブメニューの数をカウントする
 */
pure nothrow @safe @nogc
int allocate_sub_menu_length(const .menu_item_t[] menu_container)

	in
	{
		assert(menu_container != null);
	}

	out(result)
	{
		static import npp_api.powereditor.resource;

		assert(result >= 0);
		assert(max_submenu_length >= result);
	}

	do
	{
		void internal_count(const .menu_item_t[] sub_menu, ref size_t i)

			do
			{
				foreach (menu; sub_menu) {
					i++;

					if (menu.sub_menu != null) {
						internal_count(menu.sub_menu, i);
					}
				}
			}

		size_t count = 0;

		foreach (menu; menu_container) {
			if (menu.sub_menu != null) {
				internal_count(menu.sub_menu, count);
			}
		}

		return cast(int)(count);
	}

/**
 * identifierがnullでもカウントする。
 */
pure nothrow @safe @nogc
int count_all_menu_items(const .menu_item_t[] menu_container)

	in
	{
		assert(menu_container != null);
	}

	out(result)
	{
		static import npp_api.powereditor.resource;

		enum int max_count = npp_api.powereditor.resource.ID_PLUGINS_CMD_DYNAMIC_LIMIT - npp_api.powereditor.resource.ID_PLUGINS_CMD_DYNAMIC;

		assert(result >= 0);
		assert(max_count >= result);
	}

	do
	{
		void internal_count(const .menu_item_t[] sub_menu, ref size_t i)

			do
			{
				foreach (menu; sub_menu) {
					i++;

					if (menu.sub_menu != null) {
						internal_count(menu.sub_menu, i);
					}
				}
			}

		size_t count = 0;

		foreach (menu; menu_container) {
			count++;

			if (menu.sub_menu != null) {
				internal_count(menu.sub_menu, count);
			}
		}

		return cast(int)(count);
	}

/**
 * identifierがnullでないすべてのメニューの数をカウントする
 */
pure nothrow @safe @nogc
size_t count_menu_identifiers(const .menu_item_t[] menu_container)

	in
	{
		assert(menu_container != null);
	}

	do
	{
		void internal_count(const .menu_item_t[] menu_list, ref size_t i)

			do
			{
				foreach (menu; menu_list) {
					if (menu.identifier != null) {
						i++;

						if (menu.sub_menu != null) {
							internal_count(menu.sub_menu, i);
						}
					}
				}
			}

		size_t count = 0;

		internal_count(menu_container, count);

		return count;
	}

/**
 * identifierがnullでないサブメニューの数をカウントする
 */
pure nothrow @safe @nogc
size_t count_sub_menu_identifiers(const .menu_item_t[] menu_container)

	in
	{
		assert(menu_container != null);
	}

	do
	{
		void internal_count(const .menu_item_t[] menu_list, ref size_t i)

			do
			{
				foreach (menu; menu_list) {
					if (menu.identifier != null) {
						i++;

						if (menu.sub_menu != null) {
							internal_count(menu.sub_menu, i);
						}
					}
				}
			}

		size_t count = 0;

		foreach (menu; menu_container) {
			if (menu.sub_menu != null) {
				internal_count(menu.sub_menu, count);
			}
		}

		return count;
	}

pure nothrow @safe @nogc
bool is_sub_menu_exists(.menu_item_t[] menu_container)

	do
	{
		foreach (menu; menu_container) {
			if (menu.sub_menu != null) {
				return true;
			}
		}

		return false;
	}

/**
 * Notepad++に渡す用のメインメニューの静的配列を作成する
 */
pure nothrow @safe @nogc
npp_api.powereditor.misc.pluginsmanager.plugininterface.FuncItem[menu_length] create_main_menu(size_t menu_length)(.menu_item_t[] main_menu_items)

	do
	{
		static import npp_api.powereditor.misc.pluginsmanager.plugininterface;
		static import npp_api.pluginfunc.string;

		npp_api.powereditor.misc.pluginsmanager.plugininterface.FuncItem[menu_length] output;

		for (size_t i = 0; i < main_menu_items.length; i++) {
			output[i]._itemName = npp_api.pluginfunc.string.copy_string(main_menu_items[i].func_item._itemName);
			output[i]._pFunc = main_menu_items[i].func_item._pFunc;
			output[i]._cmdID = main_menu_items[i].func_item._cmdID;
			output[i]._init2Check = main_menu_items[i].func_item._init2Check;
			output[i]._pShKey = main_menu_items[i].func_item._pShKey;
		}

		return output;
	}

pure nothrow @safe @nogc
bool[output_length] create_main_menu_checked(size_t output_length)(const .sub_menu_index[] menu_index)

	do
	{
		bool[output_length] output;

		for (size_t i = 0, j = 0; i < menu_index.length; i++) {
			if (menu_index[i].depth == 1) {
				output[j] = menu_index[i].func_item._init2Check;
				j++;
			}
		}

		return output;
	}

pure nothrow @safe @nogc
bool[output_length] create_menu_index_checked(size_t output_length)(const .sub_menu_index[] menu_index)

	do
	{
		bool[output_length] output;

		for (size_t i = 0, j = 0; i < menu_index.length; i++) {
			output[j] = menu_index[i].func_item._init2Check;
			j++;
		}

		return output;
	}

pure nothrow @safe
wstring[] create_main_menu_checked_identifier(const .sub_menu_index[] menu_index)

	do
	{
		wstring[] output;

		for (size_t i = 0; i < menu_index.length; i++) {
			if ((menu_index[i].depth == 1) && (menu_index[i].menu_checked_identifier.length != 0)) {
				output ~= menu_index[i].menu_checked_identifier;
			}
		}

		return output;
	}

pure nothrow @safe
wstring[] create_menu_index_checked_identifier(const .sub_menu_index[] menu_index)

	do
	{
		wstring[] output;

		for (size_t i = 0; i < menu_index.length; i++) {
			if (menu_index[i].menu_checked_identifier.length != 0) {
				output ~= menu_index[i].menu_checked_identifier;
			}
		}

		return output;
	}

pure nothrow @safe @nogc
size_t first_sub_menu_pos(size_t LENGTH)(const .sub_menu_index[LENGTH] menu_index, string identifier)

	in
	{
		assert(LENGTH >= (search_index(menu_index, identifier)));
	}

	do
	{
		size_t i = search_index(menu_index, identifier);
		size_t depth = menu_index[i].depth;

		if (i == 0) {
			return i;
		}

		if (menu_index[i - 1].depth != depth) {
			return i;
		}

		for (; ((i - 1) != 0) && (menu_index[i - 1].depth == depth); i--) {
		}

		return i;
	}

pure nothrow @safe @nogc
size_t end_sub_menu_pos(size_t LENGTH)(const .sub_menu_index[LENGTH] menu_index, string identifier)

	in
	{
		assert(LENGTH >= (search_index(menu_index, identifier)));
	}

	do
	{
		size_t i = search_index(menu_index, identifier);
		size_t depth = menu_index[i].depth;

		if ((i + 1) >= LENGTH) {
			return i;
		}

		if (menu_index[i + 1].depth != depth) {
			return i;
		}

		for (; ((i + 1) < LENGTH) && (menu_index[i + 1].depth == depth); i++) {
		}

		return i;
	}

pure nothrow @safe @nogc
size_t sub_menu_length(size_t LENGTH)(const .sub_menu_index[LENGTH] menu_index, string identifier)

	in
	{
		assert(LENGTH >= (search_index(menu_index, identifier)));
	}

	do
	{
		size_t i = search_index(menu_index, identifier);
		size_t depth = menu_index[i].depth;
		size_t count = 0;

		for (; (i < LENGTH) && (menu_index[i].depth == depth); i++, count++) {
		}

		return count;
	}

pragma(inline, true)
nothrow @nogc
void enable_check(core.sys.windows.windef.HWND _nppHandle, ref npp_api.powereditor.misc.pluginsmanager.plugininterface.FuncItem menu_item)

	do
	{
		static import core.sys.windows.windef;
		static import npp_api.pluginfunc.npp_msgs;

		menu_item._init2Check = true;
		npp_api.pluginfunc.npp_msgs.send_NPPM_SETMENUITEMCHECK(_nppHandle, menu_item._cmdID, core.sys.windows.windef.TRUE);
	}

pragma(inline, true)
nothrow @nogc
void disable_check(core.sys.windows.windef.HWND _nppHandle, ref npp_api.powereditor.misc.pluginsmanager.plugininterface.FuncItem menu_item)

	do
	{
		static import core.sys.windows.windef;
		static import npp_api.pluginfunc.npp_msgs;

		menu_item._init2Check = false;
		npp_api.pluginfunc.npp_msgs.send_NPPM_SETMENUITEMCHECK(_nppHandle, menu_item._cmdID, core.sys.windows.windef.FALSE);
	}

pragma(inline, true)
nothrow @nogc
void change_check(core.sys.windows.windef.HWND _nppHandle, ref npp_api.powereditor.misc.pluginsmanager.plugininterface.FuncItem menu_item)

	do
	{
		static import core.sys.windows.windef;
		static import npp_api.pluginfunc.npp_msgs;

		menu_item._init2Check = !menu_item._init2Check;

		if (menu_item._init2Check) {
			npp_api.pluginfunc.npp_msgs.send_NPPM_SETMENUITEMCHECK(_nppHandle, menu_item._cmdID, core.sys.windows.windef.TRUE);
		} else {
			if (menu_item._pFunc != null) {
				npp_api.pluginfunc.npp_msgs.send_NPPM_SETMENUITEMCHECK(_nppHandle, menu_item._cmdID, core.sys.windows.windef.FALSE);
			}
		}
	}

pragma(inline, true)
nothrow @nogc
void enable_sub_menu_check(core.sys.windows.windef.HWND _nppHandle, .menu_item_t[] sub_menu_items, size_t menu_index)

	in
	{
		assert(sub_menu_items.length >= menu_index);
	}

	do
	{
		for (size_t i = 0; i < sub_menu_items.length; i++) {
			if (i == menu_index) {
				enable_check(_nppHandle, sub_menu_items[i].func_item);
			} else {
				if (sub_menu_items[i].func_item._pFunc != null) {
					disable_check(_nppHandle, sub_menu_items[i].func_item);
				}
			}
		}
	}

pragma(inline, true)
nothrow @nogc
void disable_sub_menu_check(core.sys.windows.windef.HWND _nppHandle, .menu_item_t[] sub_menu_items, size_t menu_index)

	in
	{
		assert(sub_menu_items.length >= menu_index);
	}

	do
	{
		for (size_t i = 0; i < sub_menu_items.length; i++) {
			if (sub_menu_items[i].func_item._pFunc != null) {
				disable_check(_nppHandle, sub_menu_items[i].func_item);
			}
		}
	}

pragma(inline, true)
nothrow @nogc
void change_sub_menu_check(core.sys.windows.windef.HWND _nppHandle, .menu_item_t[] sub_menu_items, size_t menu_index)

	in
	{
		assert(sub_menu_items.length >= menu_index);
	}

	do
	{
		for (size_t i = 0; i < sub_menu_items.length; i++) {
			if (i == menu_index) {
				change_check(_nppHandle, sub_menu_items[i].func_item);
			} else {
				if (sub_menu_items[i].func_item._pFunc != null) {
					disable_check(_nppHandle, sub_menu_items[i].func_item);
				}
			}
		}
	}

pragma(inline, true)
nothrow @nogc
void change_sub_menu_check(core.sys.windows.windef.HWND _nppHandle, .sub_menu_index[] index_list, string enable_identifier)

	in
	{
		assert(index_list.length != 0);
		assert(size_t.max > index_list.length);
		assert(index_list.length >= search_index(index_list, enable_identifier));
	}

	do
	{
		size_t index = search_index(index_list, enable_identifier);
		size_t depth = index_list[index].depth;

		change_check(_nppHandle, index_list[index].func_item);

		for (size_t i = index + 1; (i < index_list.length) && (index_list[i].depth == depth); i++) {
			if (index_list[i].func_item._pFunc != null) {
				disable_check(_nppHandle, index_list[i].func_item);
			}
		}

		for (size_t i = index - 1; (i != 0) && (index_list[i].depth == depth); i--) {
			if (index_list[i].func_item._pFunc != null) {
				disable_check(_nppHandle, index_list[i].func_item);
			}
		}
	}

pragma(inline, true)
nothrow @nogc
void change_sub_menu_check(core.sys.windows.windef.HWND _nppHandle, .sub_menu_index[] index_list, size_t start, size_t end, size_t pos)

	in
	{
		assert(index_list.length > end);
		assert(end >= start);
		assert(pos >= start);
		assert(end >= pos);
	}

	do
	{
		for (size_t i = start; i <= end; i++) {
			if (i == pos) {
				change_check(_nppHandle, index_list[i].func_item);
			} else {
				disable_check(_nppHandle, index_list[i].func_item);
			}
		}
	}

pure nothrow @safe @nogc
bool is_chid_menu_checked(const .sub_menu_index[] menu_index_list, size_t parent_menu_pos)

	do
	{
		size_t i = parent_menu_pos + 1; 

		if (i >= menu_index_list.length) {
			return false;
		}

		size_t depth = menu_index_list[parent_menu_pos].depth + 1;

		for (; (i < menu_index_list.length) && (depth == menu_index_list[i].depth); i++) {
			if (menu_index_list[i].func_item._init2Check) {
				return true;
			}
		}

		return false;
	}

/**
 * 同じ階層のメニューの最初のindexの位置を返す
 */
nothrow @nogc
size_t same_menu_start_pos(const .sub_menu_index[] menu_index, size_t pos)

	in
	{
		assert(menu_index.length > pos);
	}

	out(result)
	{
		assert(pos >= result);
	}

	do
	{
		size_t depth = menu_index[pos].depth;
		size_t i = pos;

		for (; (i != 0); i--) {
			if (depth != menu_index[i - 1].depth) {
				break;
			}
		}

		return i;
	}

/**
 * 同じ階層のメニューの最後のindexの位置を返す
 */
nothrow @nogc
size_t same_menu_end_pos(const .sub_menu_index[] menu_index, size_t pos)

	in
	{
		assert(menu_index.length > pos);
	}

	out(result)
	{
		assert(result >= pos);
	}

	do
	{
		size_t depth = menu_index[pos].depth;
		size_t i = pos;

		for (; (i < menu_index.length); i++) {
			if (depth != menu_index[i + 1].depth) {
				break;
			}
		}

		return i;
	}

enum core.sys.windows.winuser.MENUITEMINFOW default_submenu =
{
	cbSize: core.sys.windows.winuser.MENUITEMINFOW.sizeof,
	fMask: core.sys.windows.winuser.MIIM_STATE|core.sys.windows.winuser.MIIM_ID|core.sys.windows.winuser.MIIM_TYPE,
	fType: core.sys.windows.winuser.MFT_STRING,
	fState: core.sys.windows.winuser.MFS_ENABLED,
	wID: 0,
	hSubMenu: core.sys.windows.windef.NULL,
	hbmpChecked: core.sys.windows.windef.NULL,
	hbmpUnchecked: core.sys.windows.windef.NULL,
	dwItemData: 0,
	dwTypeData: core.sys.windows.windef.NULL,
	cch: 0,
	hbmpItem: core.sys.windows.windef.NULL,
};

enum core.sys.windows.winuser.MENUITEMINFOW default_add_menu =
{
	cbSize: core.sys.windows.winuser.MENUITEMINFOW.sizeof,
	fMask: core.sys.windows.winuser.MIIM_SUBMENU,
	fType: 0,
	fState: 0,
	wID: 0,
	hSubMenu: core.sys.windows.windef.NULL,
	hbmpChecked: core.sys.windows.windef.NULL,
	hbmpUnchecked: core.sys.windows.windef.NULL,
	dwItemData: 0,
	dwTypeData: core.sys.windows.windef.NULL,
	cch: 0,
	hbmpItem: core.sys.windows.windef.NULL,
};

nothrow @nogc
private void init_sub_menu_internal(size_t menu_index_length, size_t actions_length)(core.sys.windows.windef.HMENU plugin_menu, ref wchar[npp_api.pluginfunc.config_file.setting_name_length] setting_name_buffer, ref .sub_menu_index[menu_index_length] menu_index_list, ref size_t j, size_t depth, ref .menu_action[actions_length] actions, ref size_t actions_pos, ref int nextNumber, ref core.sys.windows.winuser.MENUITEMINFOW sub_menu_buf)

	in
	{
	}

	do
	{
		static import npp_api.pluginfunc.string;
		static import core.sys.windows.winuser;

		++depth;
		size_t parent_id = j;

		//insert sub menu parent
		menu_index_list[parent_id].menu_handle = core.sys.windows.winuser.CreatePopupMenu();
		core.sys.windows.winuser.MENUITEMINFOW parent_menu = .default_add_menu;
		parent_menu.hSubMenu = menu_index_list[parent_id].menu_handle;
		core.sys.windows.winuser.SetMenuItemInfoW(plugin_menu, menu_index_list[parent_id].func_item._cmdID, core.sys.windows.windef.FALSE, &parent_menu);

		size_t menu_count = 0;
		j++;

		for (; (j < menu_index_list.length) && (menu_index_list[j].depth >= depth); j++) {
			menu_index_list[j].parent_cmdID = menu_index_list[parent_id].func_item._cmdID;
			menu_index_list[j].func_item._cmdID = nextNumber;

			//update action
			assert(actions.length > actions_pos);
			actions[actions_pos]._cmdID = nextNumber;
			++actions_pos;

			//Insert Sub menu
			sub_menu_buf.wID = nextNumber;

			if (menu_index_list[j].func_item._init2Check) {
				sub_menu_buf.fState = core.sys.windows.winuser.MFS_CHECKED;
			} else {
				sub_menu_buf.fState = core.sys.windows.winuser.MFS_UNCHECKED;
			}

			sub_menu_buf.dwTypeData = &(menu_index_list[j].func_item._itemName[0]);
			sub_menu_buf.cch = cast(core.sys.windows.windef.UINT)(npp_api.pluginfunc.string.count_string(menu_index_list[j].func_item._itemName));
			core.sys.windows.winuser.InsertMenuItemW(menu_index_list[parent_id].menu_handle, cast(int)(menu_count), core.sys.windows.windef.TRUE, &sub_menu_buf);

			++nextNumber;

			if ((menu_index_list.length > (j + 1)) && (menu_index_list[j + 1].depth == (depth + 1))) {
				init_sub_menu_internal(plugin_menu, setting_name_buffer, menu_index_list, j, depth, actions, actions_pos, nextNumber, sub_menu_buf);
			}

			menu_count++;

			if (((menu_index_list.length > (j + 1)) && ((depth - 1) >= menu_index_list[j + 1].depth))) {
				break;
			}
		}
	}

/**
 * サブメニューを初期化する
 * _cmdIDとかも同期する
 */
nothrow @nogc
void init_submenu(size_t main_menu_length, size_t menu_index_length, size_t actions_length)(core.sys.windows.windef.HWND _nppHandle, const ref npp_api.powereditor.misc.pluginsmanager.plugininterface.FuncItem[main_menu_length] main_menu, ref .sub_menu_index[menu_index_length] menu_index_list, ref .menu_action[actions_length] actions, int required_length)

	in
	{
		static import core.sys.windows.windef;

		static assert(int.max >= actions_length);
		assert(_nppHandle != core.sys.windows.windef.NULL);
		assert(required_length != 0);
		assert(required_length == allocate_sub_menu_length(menu_index_list));
	}

	do
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;
		static import npp_api.pluginfunc.npp_msgs;
		static import npp_api.pluginfunc.config_file;

		wchar[npp_api.pluginfunc.config_file.setting_name_length] setting_name_buffer;

		core.sys.windows.winuser.MENUITEMINFOW sub_menu_buf = .default_submenu;

		if (npp_api.pluginfunc.npp_msgs.send_NPPM_ALLOCATESUPPORTED(_nppHandle) == core.sys.windows.windef.TRUE) {
			core.sys.windows.windef.HMENU plugin_menu = npp_api.pluginfunc.npp_msgs.send_NPPM_GETMENUHANDLE(_nppHandle, npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPPLUGINMENU);
			int startNumber;

			if (!npp_api.pluginfunc.npp_msgs.send_NPPM_ALLOCATECMDID(_nppHandle, cast(int)(required_length), startNumber)) {
				return;
			}

			int nextNumber = startNumber;
			size_t actions_pos = 0;

			for (size_t i = 0, j = 0; (i < main_menu.length); i++, j++) {
				assert(menu_index_list.length > j);
				menu_index_list[j].parent_cmdID = 0;
				menu_index_list[j].func_item._cmdID = main_menu[i]._cmdID;

				if ((menu_index_list.length > (j + 1)) && (menu_index_list[j + 1].depth == 2)) {
					.init_sub_menu_internal(plugin_menu, setting_name_buffer, menu_index_list, j, 1, actions, actions_pos, nextNumber, sub_menu_buf);
				}
			}
		}
	}
