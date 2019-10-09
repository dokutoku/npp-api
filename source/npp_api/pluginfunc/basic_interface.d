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
 * Notepad++ plugin basic interface
 *
 * Author: dokutoku, https://twitter.com/dokutoku3
 * License: GPL-2.0 or later
 */
module npp_api.pluginfunc.basic_interface;


version (Windows):

private static import core.sys.windows.winnt;
private static import std.traits;
private static import npp_api.powereditor.misc.pluginsmanager.plugininterface;

struct plugin_DLL_info
{
	string CompanyName = null;
	string FileDescription = null;
	string FileVersion = null;
	string InternalName = null;
	string LegalCopyright = null;
	string OriginalFilename = null;
	string ProductName = null;
	string ProductVersion = null;
}

/**
 * Notepad++ callable
 */
template is_npp_func(alias func_name)
{
	static import std.traits;

	enum bool is_npp_func = (std.traits.isFunction!(func_name)) && (__traits(getLinkage, func_name) == `C`);
}

/**
 * Notepad++ plugin interface function
 */
template is_plugin_func(alias func_name)
{
	static import std.traits;

	enum bool is_plugin_func = (is_npp_func!(func_name)) && (__traits(getProtection, func_name) == `export`);
}

template is_DllMain(alias func_name)
{
	static import std.traits;

	enum bool is_DllMain = (std.traits.isFunction!(func_name)) && (__traits(getLinkage, func_name) == `Windows`) && (__traits(getProtection, func_name) == `export`);
}

mixin template npp_nppData()
{
	private static import npp_api.powereditor.misc.pluginsmanager.plugininterface;

	//ToDo: Compilation error
	static if (!__traits(compiles, .nppData)) {
		pragma(mangle, "nppData")
		extern (C)
		npp_api.powereditor.misc.pluginsmanager.plugininterface.NppData nppData;
	}
}

/**
 * main_menu変数の宣言
 */
mixin template npp_main_menu(alias main_menu_items)
	if (std.traits.isArray!(typeof(main_menu_items)))
{
	private static import npp_api.powereditor.misc.pluginsmanager.plugininterface;
	private static import npp_api.pluginfunc.basic_interface;

	static if (!__traits(compiles, .main_menu_def)) {
		enum npp_api.powereditor.misc.pluginsmanager.plugininterface.FuncItem[main_menu_items.length] main_menu_def = npp_api.pluginfunc.basic_interface.npp_init_main_menu!(main_menu_items.length, typeof(main_menu_items))(main_menu_items);
		npp_api.powereditor.misc.pluginsmanager.plugininterface.FuncItem[main_menu_items.length] main_menu = main_menu_def;
	}
}

mixin template npp_DLLMain()
{
	version (D_BetterC) {
		private static import core.sys.windows.basetsd;
		private static import core.sys.windows.windef;
		private static import core.sys.windows.winnt;

		static if (!__traits(compiles, .DllMain)) {
			static if (!__traits(compiles, .pluginInit) && !__traits(compiles, .pluginCleanUp)) {
				pragma(mangle, "DllMain")
				extern (Windows)
				pure nothrow @safe @nogc
				export core.sys.windows.windef.BOOL DllMain(core.sys.windows.basetsd.HANDLE hModule, core.sys.windows.windef.DWORD reasonForCall, core.sys.windows.winnt.LPVOID lpReserved)

					do
					{
						static import core.sys.windows.windef;

						return core.sys.windows.windef.TRUE;
					}
			} else {
				pragma(mangle, "DllMain")
				extern (Windows)
				nothrow @nogc
				export core.sys.windows.windef.BOOL DllMain(core.sys.windows.basetsd.HANDLE hModule, core.sys.windows.windef.DWORD reasonForCall, core.sys.windows.winnt.LPVOID lpReserved)

					do
					{
						static import core.sys.windows.windef;
						static import core.sys.windows.winnt;

						switch (reasonForCall) {
							case core.sys.windows.winnt.DLL_PROCESS_ATTACH:
								static if (__traits(compiles, .pluginInit)) {
									.pluginInit(hModule);
								}

								break;

							case core.sys.windows.winnt.DLL_PROCESS_DETACH:
								static if (__traits(compiles, .pluginCleanUp)) {
									.pluginCleanUp();
								}

								break;

							default:
								break;
						}

						return core.sys.windows.windef.TRUE;
					}
			}
		}
	} else {
		private static import core.sys.windows.basetsd;
		private static import core.sys.windows.dll;
		private static import core.sys.windows.windef;
		private static import core.sys.windows.winnt;

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
}

mixin template npp_getName()
{
	private static import core.sys.windows.windef;
	private static import core.sys.windows.winnt;

	static if (!__traits(compiles, .getName)) {
		pragma(mangle, "getName")
		extern (C)
		pure nothrow @safe @nogc
		export const (core.sys.windows.winnt.WCHAR)* getName()

			do
			{
				static import core.sys.windows.windef;

				return core.sys.windows.windef.NULL;
			}
	}
}

mixin template npp_getName(wstring plugin_name)
{
	private static import std.traits;
	private static import core.sys.windows.windef;
	private static import core.sys.windows.winnt;
	private static import npp_api.pluginfunc.string;

	static if (!__traits(compiles, .getName)) {
		pragma(mangle, "getName")
		extern (C)
		pure nothrow @safe @nogc
		export const (core.sys.windows.winnt.WCHAR)* getName()

			do
			{
				static import core.sys.windows.windef;
				static import npp_api.pluginfunc.string;

				static if (plugin_name.length != 0) {
					static assert(plugin_name[$ - 1] == '\0');

					return &(plugin_name[0]);
				} else {
					return core.sys.windows.windef.NULL;
				}
			}
	}
}

pragma(inline, true)
pure nothrow @safe @nogc
npp_api.powereditor.misc.pluginsmanager.plugininterface.FuncItem[main_menu_length] npp_init_main_menu(size_t main_menu_length, main_menu_type)(main_menu_type menu_def)
	if (std.traits.isArray!(main_menu_type))

	in
	{
		static import std.traits;
		static import npp_api.powereditor.misc.pluginsmanager.plugininterface;

		static if (std.traits.isStaticArray!(main_menu_type)) {
			static assert(is(main_menu_type : npp_api.powereditor.misc.pluginsmanager.plugininterface.FuncItem[main_menu_length]));
		} else static if (std.traits.isDynamicArray!(main_menu_type)) {
			static assert(is(main_menu_type : npp_api.powereditor.misc.pluginsmanager.plugininterface.FuncItem[]));
		}

		assert(main_menu_length == menu_def.length);
	}

	do
	{
		static import npp_api.powereditor.misc.pluginsmanager.plugininterface;
		static import npp_api.pluginfunc.string;

		npp_api.powereditor.misc.pluginsmanager.plugininterface.FuncItem[main_menu_length] output;

		for (size_t i = 0; i < main_menu_length; i++) {
			output[i]._itemName = npp_api.pluginfunc.string.copy_string(menu_def[i]._itemName);
			output[i]._pFunc = menu_def[i]._pFunc;
			output[i]._cmdID = menu_def[i]._cmdID;
			output[i]._init2Check = menu_def[i]._init2Check;
			output[i]._pShKey = menu_def[i]._pShKey;
		}

		return output;
	}

mixin template npp_getFuncsArray()
{
	private static import npp_api.powereditor.misc.pluginsmanager.plugininterface;

	static if (!__traits(compiles, .getFuncsArray)) {
		pragma(mangle, "getFuncsArray")
		extern (C)
		pure nothrow @nogc
		export const (npp_api.powereditor.misc.pluginsmanager.plugininterface.FuncItem)* getFuncsArray(int* nbF)

			do
			{
				/+
				if (nbF == null) {
					return null;
				}
				+/

				*nbF = 0;

				return null;
			}
	}
}

mixin template npp_getFuncsArray(alias func_list)
	if (std.traits.isArray!(typeof(func_list)))
{
	private static import std.traits;
	private static import npp_api.powereditor.misc.pluginsmanager.plugininterface;
	private static import npp_api.pluginfunc.basic_interface;

	version (D_BetterC) {
		static assert(std.traits.isStaticArray!(typeof(func_list)));
	}

	static if (std.traits.isStaticArray!(typeof(func_list))) {
		static assert(is(typeof(func_list) : const npp_api.powereditor.misc.pluginsmanager.plugininterface.FuncItem[func_list.length]));
		static assert(func_list.length != 0);
		static assert(int.max >= func_list.length);
	} else {
		static assert(is(typeof(func_list) : const npp_api.powereditor.misc.pluginsmanager.plugininterface.FuncItem[]));
	}

	static if (!__traits(compiles, .getFuncsArray)) {
		pragma(mangle, "getFuncsArray")
		extern (C)
		nothrow @nogc
		export const (npp_api.powereditor.misc.pluginsmanager.plugininterface.FuncItem)* getFuncsArray(int* nbF)

			in
			{
				assert(int.max >= func_list.length);
			}

			do
			{
				static import std.traits;
				static import npp_api.pluginfunc.basic_interface;

				/+
				if (nbF == null) {
					return null;
				}
				+/

				*nbF = cast(int)(func_list.length);

				static if (std.traits.isStaticArray!(typeof(func_list))) {
					return &(func_list[0]);
				} else {
					if (func_list.length != 0) {
						return &(func_list[0]);
					} else {
						return null;
					}
				}
			}
	}
}

mixin template npp_isUnicode()
{
	private static import core.sys.windows.windef;

	/**
	 * This API return always true now, since Notepad++ isn't compiled in ANSI mode anymore
	 */
	static if (!__traits(compiles, .isUnicode)) {
		pragma(mangle, "isUnicode")
		extern (C)
		pure nothrow @safe @nogc
		export core.sys.windows.windef.BOOL isUnicode()

			do
			{
				static import core.sys.windows.windef;

				return core.sys.windows.windef.TRUE;
			}
	}
}

mixin template npp_setInfo()
{
	private static import std.traits;
	private static import npp_api.powereditor.misc.pluginsmanager.plugininterface;

	static if (!__traits(compiles, .setInfo)) {
		static if (!__traits(compiles, .pluginSetInfo) && !__traits(compiles, .nppData) && !__traits(compiles, .gshared_nppData)) {
			pragma(mangle, "setInfo")
			extern (C)
			pure nothrow @safe @nogc
			export void setInfo(npp_api.powereditor.misc.pluginsmanager.plugininterface.NppData notpadPlusData)

				do
				{
				}
		} else static if (std.traits.hasFunctionAttributes!(.pluginSetInfo, "@nogc")) {
			pragma(mangle, "setInfo")
			extern (C)
			nothrow @nogc
			export void setInfo(npp_api.powereditor.misc.pluginsmanager.plugininterface.NppData notpadPlusData)

				do
				{
					static if (__traits(compiles, .nppData)) {
						.nppData = notpadPlusData;
					}

					static if (__traits(compiles, .gshared_nppData)) {
						.gshared_nppData = notpadPlusData;
					}

					.pluginSetInfo(notpadPlusData);
				}
		} else {
			pragma(mangle, "setInfo")
			extern (C)
			nothrow
			export void setInfo(npp_api.powereditor.misc.pluginsmanager.plugininterface.NppData notpadPlusData)

				do
				{
					static if (__traits(compiles, .nppData)) {
						.nppData = notpadPlusData;
					}

					static if (__traits(compiles, .gshared_nppData)) {
						.gshared_nppData = notpadPlusData;
					}

					.pluginSetInfo(notpadPlusData);
				}
		}
	}
}

mixin template npp_setInfo(alias nppData)
	if (is(typeof(nppData) == npp_api.powereditor.misc.pluginsmanager.plugininterface.NppData))
{
	private static import std.traits;
	private static import npp_api.powereditor.misc.pluginsmanager.plugininterface;

	static if (!__traits(compiles, .setInfo)) {
		static if (!__traits(compiles, .pluginSetInfo) || (__traits(compiles, .pluginSetInfo) && (std.traits.hasFunctionAttributes!(.pluginSetInfo, "@nogc")))) {
			pragma(mangle, "setInfo")
			extern (C)
			nothrow @nogc
			export void setInfo(npp_api.powereditor.misc.pluginsmanager.plugininterface.NppData notpadPlusData)

				do
				{
					nppData = notpadPlusData;

					static if (__traits(compiles, .gshared_nppData)) {
						.gshared_nppData = notpadPlusData;
					}

					static if (__traits(compiles, .pluginSetInfo)) {
						.pluginSetInfo(notpadPlusData);
					}
				}
		} else {
			pragma(mangle, "setInfo")
			extern (C)
			nothrow
			export void setInfo(npp_api.powereditor.misc.pluginsmanager.plugininterface.NppData notpadPlusData)

				do
				{
					nppData = notpadPlusData;

					static if (__traits(compiles, .gshared_nppData)) {
						.gshared_nppData = notpadPlusData;
					}

					static if (__traits(compiles, .pluginSetInfo)) {
						.pluginSetInfo(notpadPlusData);
					}
				}
		}
	}
}

mixin template npp_setInfo(alias nppData, alias main_menu, alias menu_def)
	if (is(typeof(nppData) == npp_api.powereditor.misc.pluginsmanager.plugininterface.NppData) && std.traits.isArray!(typeof(main_menu)) && std.traits.isArray!(typeof(menu_def)))
{
	private static import std.traits;
	private static import npp_api.powereditor.misc.pluginsmanager.plugininterface;
	private static import npp_api.pluginfunc.basic_interface;

	version (D_BetterC) {
		static assert(std.traits.isStaticArray!(typeof(main_menu)));
		static assert(std.traits.isStaticArray!(typeof(menu_def)));
	}

	static if (std.traits.isStaticArray!(typeof(main_menu))) {
		static assert(is(typeof(main_menu) : npp_api.powereditor.misc.pluginsmanager.plugininterface.FuncItem[main_menu.length]));
		static assert(main_menu.length != 0);
	} else {
		static assert(is(typeof(main_menu) : npp_api.powereditor.misc.pluginsmanager.plugininterface.FuncItem[]));
	}

	static if (std.traits.isStaticArray!(typeof(menu_def))) {
		static assert(is(typeof(menu_def) : npp_api.powereditor.misc.pluginsmanager.plugininterface.FuncItem[menu_def.length]));
		static assert(menu_def.length != 0);

		static if (std.traits.isStaticArray!(typeof(main_menu))) {
			static assert(menu_def.length >= main_menu.length);
		}
	} else {
		static assert(is(typeof(menu_def) : npp_api.powereditor.misc.pluginsmanager.plugininterface.FuncItem[]));
	}

	static if (!__traits(compiles, .setInfo)) {
		static if (!__traits(compiles, .pluginSetInfo) || (__traits(compiles, .pluginSetInfo) && (std.traits.hasFunctionAttributes!(.pluginSetInfo, "@nogc")))) {
			pragma(mangle, "setInfo")
			extern (C)
			nothrow @nogc
			export void setInfo(npp_api.powereditor.misc.pluginsmanager.plugininterface.NppData notpadPlusData)

				in
				{
					assert(menu_def.length >= main_menu.length);
				}

				do
				{
					nppData = notpadPlusData;

					static if (__traits(compiles, .gshared_nppData)) {
						.gshared_nppData = notpadPlusData;
					}

					static if (__traits(compiles, .pluginSetInfo)) {
						.pluginSetInfo(notpadPlusData);
					}
				}
		} else {
			pragma(mangle, "setInfo")
			extern (C)
			nothrow
			export void setInfo(npp_api.powereditor.misc.pluginsmanager.plugininterface.NppData notpadPlusData)

				in
				{
					assert(menu_def.length >= main_menu.length);
				}

				do
				{
					nppData = notpadPlusData;

					static if (__traits(compiles, .gshared_nppData)) {
						.gshared_nppData = notpadPlusData;
					}

					static if (__traits(compiles, .pluginSetInfo)) {
						.pluginSetInfo(notpadPlusData);
					}
				}
		}
	}
}

mixin template npp_beNotified()
{
	private static import std.traits;
	private static import npp_api.scintilla.scintilla;
	private static import npp_api.pluginfunc.basic_interface;

	static if (!__traits(compiles, .beNotified)) {
		static if (!__traits(compiles, .pluginBeNotified)) {
			pragma(mangle, "beNotified")
			extern (C)
			pure nothrow @safe @nogc
			export void beNotified(npp_api.scintilla.scintilla.SCNotification* notifyCode)

				do
				{
					/+
					static import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;

					/+
					if (notifyCode == null) {
						return;
					}
					+/

					switch ((*notifyCode).nmhdr.code) {
						case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPN_READY:
						case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPN_TBMODIFICATION:
						case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPN_FILEBEFORECLOSE:
						case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPN_FILEOPENED:
						case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPN_FILECLOSED:
						case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPN_FILEBEFOREOPEN:
						case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPN_FILEBEFORESAVE:
						case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPN_FILESAVED:
						case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPN_SHUTDOWN:
						case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPN_BUFFERACTIVATED:
						case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPN_LANGCHANGED:
						case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPN_WORDSTYLESUPDATED:
						case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPN_SHORTCUTREMAPPED:
						case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPN_FILEBEFORELOAD:
						case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPN_FILELOADFAILED:
						case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPN_READONLYCHANGED:
						case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPN_DOCORDERCHANGED:
						case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPN_SNAPSHOTDIRTYFILELOADED:
						case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPN_BEFORESHUTDOWN:
						case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPN_CANCELSHUTDOWN:
						case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPN_FILEBEFORERENAME:
						case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPN_FILERENAMECANCEL:
						case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPN_FILERENAMED:
						case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPN_FILEBEFOREDELETE:
						case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPN_FILEDELETEFAILED:
						case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPN_FILEDELETED:
							break;

						default:
							break;
					}
					+/
				}
		} else static if (std.traits.hasFunctionAttributes!(.pluginBeNotified, "@nogc")) {
			pragma(mangle, "beNotified")
			extern (C)
			nothrow @nogc
			export void beNotified(npp_api.scintilla.scintilla.SCNotification* notifyCode)

				do
				{
					/+
					if (notifyCode == null) {
						return;
					}
					+/

					.pluginBeNotified(*notifyCode);
				}
		} else {
			pragma(mangle, "beNotified")
			extern (C)
			nothrow
			export void beNotified(npp_api.scintilla.scintilla.SCNotification* notifyCode)

				do
				{
					/+
					if (notifyCode == null) {
						return;
					}
					+/

					.pluginBeNotified(*notifyCode);
				}
		}
	}
}

mixin template npp_messageProc()
{
	private static import std.traits;
	private static import core.sys.windows.windef;
	private static import npp_api.pluginfunc.basic_interface;

	static if (!__traits(compiles, .messageProc)) {
		static if (!__traits(compiles, .pluginMessageProc)) {
			pragma(mangle, "messageProc")
			extern (C)
			pure nothrow @safe @nogc
			export core.sys.windows.windef.LRESULT messageProc(core.sys.windows.windef.UINT Message, core.sys.windows.windef.WPARAM wParam, core.sys.windows.windef.LPARAM lParam)

				do
				{
					static import core.sys.windows.windef;

					/*
					switwch (Message) {
						case core.sys.windows.winuser.WM_MOVE:
						case core.sys.windows.winuser.WM_SIZE:
						case core.sys.windows.winuser.WM_COMMAND:
							break;

						default:
							break;
					}
					*/

					return core.sys.windows.windef.TRUE;
				}
		} else static if (std.traits.hasFunctionAttributes!(.pluginMessageProc, "@nogc")) {
			pragma(mangle, "messageProc")
			extern (C)
			nothrow @nogc
			export core.sys.windows.windef.LRESULT messageProc(core.sys.windows.windef.UINT Message, core.sys.windows.windef.WPARAM wParam, core.sys.windows.windef.LPARAM lParam)

				do
				{
					static import core.sys.windows.windef;

					if (.pluginMessageProc(Message, wParam, lParam)) {
						return core.sys.windows.windef.TRUE;
					} else {
						return core.sys.windows.windef.FALSE;
					}
				}
		} else {
			pragma(mangle, "messageProc")
			extern (C)
			nothrow
			export core.sys.windows.windef.LRESULT messageProc(core.sys.windows.windef.UINT Message, core.sys.windows.windef.WPARAM wParam, core.sys.windows.windef.LPARAM lParam)

				do
				{
					static import core.sys.windows.windef;

					if (.pluginMessageProc(Message, wParam, lParam)) {
						return core.sys.windows.windef.TRUE;
					} else {
						return core.sys.windows.windef.FALSE;
					}
				}
		}
	}
}

mixin template npp_plugin_interface()
{
	private static import npp_api.pluginfunc.basic_interface;

	mixin npp_api.pluginfunc.basic_interface.npp_nppData!();
	mixin npp_api.pluginfunc.basic_interface.npp_DLLMain!();
	mixin npp_api.pluginfunc.basic_interface.npp_getName!();
	mixin npp_api.pluginfunc.basic_interface.npp_getFuncsArray!();
	mixin npp_api.pluginfunc.basic_interface.npp_isUnicode!();
	mixin npp_api.pluginfunc.basic_interface.npp_setInfo!(nppData);
	mixin npp_api.pluginfunc.basic_interface.npp_beNotified!();
	mixin npp_api.pluginfunc.basic_interface.npp_messageProc!();

	static assert(npp_api.pluginfunc.basic_interface.is_DllMain!(.DllMain));
	static assert(npp_api.pluginfunc.basic_interface.is_plugin_func!(.getName));
	static assert(npp_api.pluginfunc.basic_interface.is_plugin_func!(.getFuncsArray));
	static assert(npp_api.pluginfunc.basic_interface.is_plugin_func!(.isUnicode));
	static assert(npp_api.pluginfunc.basic_interface.is_plugin_func!(.setInfo));
	static assert(npp_api.pluginfunc.basic_interface.is_plugin_func!(.beNotified));
	static assert(npp_api.pluginfunc.basic_interface.is_plugin_func!(.messageProc));
}

mixin template npp_plugin_interface(wstring plugin_name, alias main_menu_items)
	if (std.traits.isArray!(typeof(main_menu_items)))
{
	private static import npp_api.pluginfunc.basic_interface;

	private enum plugin_name_internal = plugin_name ~ "\0";

	mixin npp_api.pluginfunc.basic_interface.npp_nppData!();
	mixin npp_api.pluginfunc.basic_interface.npp_main_menu!(main_menu_items);
	mixin npp_api.pluginfunc.basic_interface.npp_getName!(plugin_name_internal);
	mixin npp_api.pluginfunc.basic_interface.npp_getFuncsArray!(main_menu);
	mixin npp_api.pluginfunc.basic_interface.npp_setInfo!(nppData, main_menu, main_menu_def);
	mixin npp_api.pluginfunc.basic_interface.npp_plugin_interface!();
}
