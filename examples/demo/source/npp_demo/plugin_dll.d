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
module npp_demo.plugin_dll;


version (Windows):

pragma(lib, "kernel32.lib");
pragma(lib, "user32.lib");

private static import core.runtime;
private static import core.stdc.ctype;
private static import core.stdc.string;
private static import core.sys.windows.basetsd;
private static import core.sys.windows.winbase;
private static import core.sys.windows.windef;
private static import core.sys.windows.winnt;
private static import core.sys.windows.winuser;
private static import npp_api.pluginfunc.basic_interface;
private static import npp_api.pluginfunc.extra_interfece;
private static import npp_api.pluginfunc.npp_msgs;
private static import npp_api.pluginfunc.scintilla_msg;
private static import npp_api.pluginfunc.string;
private static import npp_api.powereditor.menucmdid;
private static import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;
private static import npp_api.powereditor.misc.pluginsmanager.plugininterface;
private static import npp_api.powereditor.scitillacomponent.gotolinedlg;
private static import npp_api.scintilla.scintilla;
private static import npp_demo.commands;
private static import npp_demo.config;

mixin npp_api.pluginfunc.auto_pFunc.mixin_menu_index_change_check!(`Close HTML/XML tag automatically`) insertHtmlCloseTag;

extern (C)
__gshared npp_api.powereditor.misc.pluginsmanager.plugininterface.NppData gshared_nppData;

/**
 * Initialization of your plugin data
 * It will be called while plugin loading
 */
pragma(inline, true)
nothrow
void pluginInit(core.sys.windows.basetsd.HANDLE hModule)

	in
	{
	}

	body
	{
		static import core.sys.windows.winbase;
		static import core.sys.windows.windef;
		static import npp_api.powereditor.scitillacomponent.gotolinedlg;
		static import npp_demo.gotolinedlg;

		// Initialize dockable demo dialog
		npp_demo.gotolinedlg._goToLine = new npp_demo.gotolinedlg.demo_dlg();
		npp_demo.gotolinedlg._goToLine.initialize(cast(core.sys.windows.windef.HINSTANCE)(hModule), core.sys.windows.windef.NULL);
	}

pragma(inline, true)
nothrow
void pluginBeNotified(ref npp_api.scintilla.scintilla.SCNotification notifyCode)

	body
	{
		static import core.stdc.ctype;
		static import core.stdc.string;
		static import core.sys.windows.windef;
		static import core.sys.windows.winuser;
		static import npp_api.pluginfunc.npp_msgs;
		static import npp_api.pluginfunc.scintilla_msg;
		static import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;
		static import npp_api.scintilla.scintilla;

		switch (notifyCode.nmhdr.code) {
			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.NPPN_SHUTDOWN:
				break;

			case npp_api.scintilla.scintilla.SCN_CHARADDED:
				npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType docType;
				npp_api.pluginfunc.npp_msgs.send_NPPM_GETCURRENTLANGTYPE(.nppData._nppHandle, docType);
				bool isDocTypeHTML = ((docType == npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_HTML) || (docType == npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_XML) || (docType == npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_PHP));

				if (.menu_index[.search_index!(`Close HTML/XML tag automatically`)].func_item._init2Check && isDocTypeHTML) {
					if (notifyCode.ch == '>') {
						char[512] buf;
						int currentEdit;
						npp_api.pluginfunc.npp_msgs.send_NPPM_GETCURRENTSCINTILLA(.nppData._nppHandle, currentEdit);
						core.sys.windows.windef.HWND hCurrentEditView = (currentEdit == 0) ? (.nppData._scintillaMainHandle) : (.nppData._scintillaSecondHandle);
						int currentPos = cast(int)(npp_api.pluginfunc.scintilla_msg.send_SCI_GETCURRENTPOS(hCurrentEditView));
						int beginPos = currentPos - cast(int)(buf.length - 1);
						int startPos = (beginPos > 0) ? (beginPos) : (0);
						int size = currentPos - startPos;
						char[516] insertString = "</";

						if (size >= 3) {
							npp_api.scintilla.scintilla.Sci_TextRange tr = {{startPos, currentPos}, &(buf[0])};

							npp_api.pluginfunc.scintilla_msg.send_SCI_GETTEXTRANGE(hCurrentEditView, tr);

							if (buf[size - 2] != '/') {
								const (char)* pBegin = &(buf[0]);
								const (char)* pCur = &(buf[size - 2]);
								int  insertStringSize = 2;

								for (; (pCur > pBegin) && (*pCur != '<') && (*pCur != '>') ;) {
									pCur--;
								}

								if (*pCur == '<') {
									++pCur;

									while ((core.stdc.string.strchr(":_-.", *pCur) != null) || (core.stdc.ctype.isalnum(*pCur) != 0)) {
										insertString[insertStringSize++] = *pCur;
										++pCur;
									}
								}

								insertString[insertStringSize++] = '>';
								insertString[insertStringSize] = '\0';

								if (insertStringSize > 3) {
									npp_api.pluginfunc.scintilla_msg.send_SCI_BEGINUNDOACTION(hCurrentEditView);
									npp_api.pluginfunc.scintilla_msg.send_SCI_REPLACESEL(hCurrentEditView, &(insertString[0]));
									npp_api.pluginfunc.scintilla_msg.send_SCI_SETSEL(hCurrentEditView, currentPos, currentPos);
									npp_api.pluginfunc.scintilla_msg.send_SCI_ENDUNDOACTION(hCurrentEditView);
								}
							}
						}
					}
				}

				break;

			default:
				return;
		}
	}

/*
 * Notepad++ interface functions
 */
mixin npp_api.pluginfunc.extra_interfece.npp_plugin_interface!(npp_demo.config.plugin_def);
