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
 * Notepad++ lang
 *
 * Author: dokutoku, https://twitter.com/dokutoku3
 * License: GPL-2.0 or later
 */
module npp_api.pluginfunc.lang;


private static import core.sys.windows.winbase;
private static import core.sys.windows.windef;
private static import std.algorithm;
private static import std.array;
private static import std.path;
private static import std.traits;
private static import npp_api.powereditor.menucmdid;
private static import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;
private static import npp_api.pluginfunc.npp_msgs;
private static import npp_api.pluginfunc.string;
private static import npp_api.pluginfunc.path;

pragma(inline, true)
pure nothrow @safe @nogc
bool is_known_lang(npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType lang)

	body
	{
		return (lang != npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_EXTERNAL) && (lang != npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_JS);
	}

/**
 * is programming language
 * ToDo:
 */
pragma(inline, true)
pure nothrow @safe @nogc
bool is_p_lang(npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType lang)

	body
	{
		switch (lang) {
			//case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_TEXT:
			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_PHP:
			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_C:
			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_CPP:
			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_CS:
			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_OBJC:
			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_JAVA:
			//case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_RC:
			//case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_HTML:
			//case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_XML:
			//case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_MAKEFILE:
			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_PASCAL:
			//case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_BATCH:
			//case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_INI:
			//case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_ASCII:
			//case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_USER:
			//case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_ASP:
			//case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_SQL:
			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_VB:
			//case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_JS:
			//case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_CSS:
			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_PERL:
			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_PYTHON:
			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_LUA:
			//case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_TEX:
			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_FORTRAN:
			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_BASH:
			//case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_FLASH:
			//case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_NSIS:
			//case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_TCL:
			//case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_LISP:
			//case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_SCHEME:
			//case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_ASM:
			//case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_DIFF:
			//case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_PROPS:
			//case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_PS:
			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_RUBY:
			//case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_SMALLTALK:
			//case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_VHDL:
			//case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_KIX:
			//case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_AU3:
			//case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_CAML:
			//case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_ADA:
			//case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_VERILOG:
			//case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_MATLAB:
			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_HASKELL:
			//case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_INNO:
			//case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_SEARCHRESULT:
			//case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_CMAKE:
			//case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_YAML:
			//case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_COBOL:
			//case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_GUI4CLI:
			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_D:
			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_POWERSHELL:
			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_R:
			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_JSP:
			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_COFFEESCRIPT:
			//case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_JSON:
			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_JAVASCRIPT:
			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_FORTRAN_77:
			//case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_BAANC:
			//case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_SREC:
			//case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_IHEX:
			//case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_TEHEX:
			//case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_SWIFT:
			//case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_ASN1:
			//case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_AVS:
			//case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_BLITZBASIC:
			//case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_PUREBASIC:
			//case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_FREEBASIC:
			//case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_CSOUND:
			//case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_ERLANG:
			//case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_ESCRIPT:
			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_FORTH:
			//case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_LATEX:
			//case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_MMIXAL:
			//case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_NIMROD:
			//case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_NNCRONTAB:
			//case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_OSCRIPT:
			//case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_REBOL:
			//case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_REGISTRY:
			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_RUST:
			//case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_SPICE:
			//case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_TXT2TAGS:
			//case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_VISUALPROLOG:
			//case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_EXTERNAL:
				return true;

			default:
				return false;
		}
	}

/**
 * Convert IDM_LANG_* to LangType
 *
 * Params:
 *      IDM_LANG = IDM_LANG_*
 *
 * Returns: LangType or LangType.L_EXTERNAL
 */
pragma(inline, true)
pure nothrow @safe @nogc
npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType from_IDM_LANG(int IDM_LANG)

	body
	{
		static import npp_api.powereditor.menucmdid;
		static import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;

		switch (IDM_LANG) {
			case npp_api.powereditor.menucmdid.IDM_LANG_C:
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_C;

			case npp_api.powereditor.menucmdid.IDM_LANG_CPP:
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_CPP;

			case npp_api.powereditor.menucmdid.IDM_LANG_JAVA:
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_JAVA;

			case npp_api.powereditor.menucmdid.IDM_LANG_HTML:
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_HTML;

			case npp_api.powereditor.menucmdid.IDM_LANG_XML:
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_XML;

			case npp_api.powereditor.menucmdid.IDM_LANG_JS:
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_JS;

			case npp_api.powereditor.menucmdid.IDM_LANG_PHP:
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_PHP;

			case npp_api.powereditor.menucmdid.IDM_LANG_ASP:
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_ASP;

			case npp_api.powereditor.menucmdid.IDM_LANG_CSS:
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_CSS;

			case npp_api.powereditor.menucmdid.IDM_LANG_PASCAL:
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_PASCAL;

			case npp_api.powereditor.menucmdid.IDM_LANG_PYTHON:
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_PYTHON;

			case npp_api.powereditor.menucmdid.IDM_LANG_PERL:
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_PERL;

			case npp_api.powereditor.menucmdid.IDM_LANG_OBJC:
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_OBJC;

			case npp_api.powereditor.menucmdid.IDM_LANG_ASCII:
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_ASCII;

			case npp_api.powereditor.menucmdid.IDM_LANG_TEXT:
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_TEXT;

			case npp_api.powereditor.menucmdid.IDM_LANG_RC:
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_RC;

			case npp_api.powereditor.menucmdid.IDM_LANG_MAKEFILE:
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_MAKEFILE;

			case npp_api.powereditor.menucmdid.IDM_LANG_INI:
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_INI;

			case npp_api.powereditor.menucmdid.IDM_LANG_SQL:
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_SQL;

			case npp_api.powereditor.menucmdid.IDM_LANG_VB:
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_VB;

			case npp_api.powereditor.menucmdid.IDM_LANG_BATCH:
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_BATCH;

			case npp_api.powereditor.menucmdid.IDM_LANG_CS:
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_CS;

			case npp_api.powereditor.menucmdid.IDM_LANG_LUA:
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_LUA;

			case npp_api.powereditor.menucmdid.IDM_LANG_TEX:
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_TEX;

			case npp_api.powereditor.menucmdid.IDM_LANG_FORTRAN:
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_FORTRAN;

			case npp_api.powereditor.menucmdid.IDM_LANG_BASH:
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_BASH;

			case npp_api.powereditor.menucmdid.IDM_LANG_FLASH:
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_FLASH;

			case npp_api.powereditor.menucmdid.IDM_LANG_NSIS:
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_NSIS;

			case npp_api.powereditor.menucmdid.IDM_LANG_TCL:
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_TCL;

			case npp_api.powereditor.menucmdid.IDM_LANG_LISP:
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_LISP;

			case npp_api.powereditor.menucmdid.IDM_LANG_SCHEME:
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_SCHEME;

			case npp_api.powereditor.menucmdid.IDM_LANG_ASM:
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_ASM;

			case npp_api.powereditor.menucmdid.IDM_LANG_DIFF:
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_DIFF;

			case npp_api.powereditor.menucmdid.IDM_LANG_PROPS:
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_PROPS;

			case npp_api.powereditor.menucmdid.IDM_LANG_PS:
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_PS;

			case npp_api.powereditor.menucmdid.IDM_LANG_RUBY:
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_RUBY;

			case npp_api.powereditor.menucmdid.IDM_LANG_SMALLTALK:
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_SMALLTALK;

			case npp_api.powereditor.menucmdid.IDM_LANG_VHDL:
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_VHDL;

			case npp_api.powereditor.menucmdid.IDM_LANG_CAML:
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_CAML;

			case npp_api.powereditor.menucmdid.IDM_LANG_KIX:
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_KIX;

			case npp_api.powereditor.menucmdid.IDM_LANG_ADA:
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_ADA;

			case npp_api.powereditor.menucmdid.IDM_LANG_VERILOG:
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_VERILOG;

			case npp_api.powereditor.menucmdid.IDM_LANG_AU3:
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_AU3;

			case npp_api.powereditor.menucmdid.IDM_LANG_MATLAB:
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_MATLAB;

			case npp_api.powereditor.menucmdid.IDM_LANG_HASKELL:
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_HASKELL;

			case npp_api.powereditor.menucmdid.IDM_LANG_INNO:
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_INNO;

			case npp_api.powereditor.menucmdid.IDM_LANG_CMAKE:
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_CMAKE;

			case npp_api.powereditor.menucmdid.IDM_LANG_YAML:
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_YAML;

			case npp_api.powereditor.menucmdid.IDM_LANG_COBOL:
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_COBOL;

			case npp_api.powereditor.menucmdid.IDM_LANG_D:
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_D;

			case npp_api.powereditor.menucmdid.IDM_LANG_GUI4CLI:
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_GUI4CLI;

			case npp_api.powereditor.menucmdid.IDM_LANG_POWERSHELL:
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_POWERSHELL;

			case npp_api.powereditor.menucmdid.IDM_LANG_R:
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_R;

			case npp_api.powereditor.menucmdid.IDM_LANG_JSP:
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_JSP;

			case npp_api.powereditor.menucmdid.IDM_LANG_COFFEESCRIPT:
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_COFFEESCRIPT;

			case npp_api.powereditor.menucmdid.IDM_LANG_JSON:
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_JSON;

			case npp_api.powereditor.menucmdid.IDM_LANG_FORTRAN_77:
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_FORTRAN_77;

			case npp_api.powereditor.menucmdid.IDM_LANG_BAANC:
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_BAANC;

			case npp_api.powereditor.menucmdid.IDM_LANG_SREC:
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_SREC;

			case npp_api.powereditor.menucmdid.IDM_LANG_IHEX:
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_IHEX;

			case npp_api.powereditor.menucmdid.IDM_LANG_TEHEX:
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_TEHEX;

			case npp_api.powereditor.menucmdid.IDM_LANG_SWIFT:
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_SWIFT;

			case npp_api.powereditor.menucmdid.IDM_LANG_ASN1:
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_ASN1;

			case npp_api.powereditor.menucmdid.IDM_LANG_AVS:
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_AVS;

			case npp_api.powereditor.menucmdid.IDM_LANG_BLITZBASIC:
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_BLITZBASIC;

			case npp_api.powereditor.menucmdid.IDM_LANG_PUREBASIC:
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_PUREBASIC;

			case npp_api.powereditor.menucmdid.IDM_LANG_FREEBASIC:
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_FREEBASIC;

			case npp_api.powereditor.menucmdid.IDM_LANG_CSOUND:
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_CSOUND;

			case npp_api.powereditor.menucmdid.IDM_LANG_ERLANG:
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_ERLANG;

			case npp_api.powereditor.menucmdid.IDM_LANG_ESCRIPT:
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_ESCRIPT;

			case npp_api.powereditor.menucmdid.IDM_LANG_FORTH:
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_FORTH;

			case npp_api.powereditor.menucmdid.IDM_LANG_LATEX:
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_LATEX;

			case npp_api.powereditor.menucmdid.IDM_LANG_MMIXAL:
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_MMIXAL;

			case npp_api.powereditor.menucmdid.IDM_LANG_NIMROD:
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_NIMROD;

			case npp_api.powereditor.menucmdid.IDM_LANG_NNCRONTAB:
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_NNCRONTAB;

			case npp_api.powereditor.menucmdid.IDM_LANG_OSCRIPT:
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_OSCRIPT;

			case npp_api.powereditor.menucmdid.IDM_LANG_REBOL:
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_REBOL;

			case npp_api.powereditor.menucmdid.IDM_LANG_REGISTRY:
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_REGISTRY;

			case npp_api.powereditor.menucmdid.IDM_LANG_RUST:
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_RUST;

			case npp_api.powereditor.menucmdid.IDM_LANG_SPICE:
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_SPICE;

			case npp_api.powereditor.menucmdid.IDM_LANG_TXT2TAGS:
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_TXT2TAGS;

			case npp_api.powereditor.menucmdid.IDM_LANG_VISUALPROLOG:
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_VISUALPROLOG;

			case npp_api.powereditor.menucmdid.IDM_LANG_EXTERNAL:
			case npp_api.powereditor.menucmdid.IDM_LANG_EXTERNAL_LIMIT:
			default:
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_EXTERNAL;
		}
	}

/**
 * Convert LangType to IDM_LANG_*
 *
 * Params:
 *      lang = LangType
 *
 * Returns: IDM_LANG_* or IDM_LANG_EXTERNAL_LIMIT on error.
 */
pragma(inline, true)
pure nothrow @safe @nogc
int to_IDM_LANG(npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType lang)

	body
	{
		static import npp_api.powereditor.menucmdid;
		static import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;

		switch (lang) {
			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_TEXT:
				return npp_api.powereditor.menucmdid.IDM_LANG_TEXT;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_PHP:
				return npp_api.powereditor.menucmdid.IDM_LANG_PHP;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_C:
				return npp_api.powereditor.menucmdid.IDM_LANG_C;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_CPP:
				return npp_api.powereditor.menucmdid.IDM_LANG_CPP;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_CS:
				return npp_api.powereditor.menucmdid.IDM_LANG_CS;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_OBJC:
				return npp_api.powereditor.menucmdid.IDM_LANG_OBJC;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_JAVA:
				return npp_api.powereditor.menucmdid.IDM_LANG_JAVA;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_RC:
				return npp_api.powereditor.menucmdid.IDM_LANG_RC;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_HTML:
				return npp_api.powereditor.menucmdid.IDM_LANG_HTML;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_XML:
				return npp_api.powereditor.menucmdid.IDM_LANG_XML;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_MAKEFILE:
				return npp_api.powereditor.menucmdid.IDM_LANG_MAKEFILE;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_PASCAL:
				return npp_api.powereditor.menucmdid.IDM_LANG_PASCAL;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_BATCH:
				return npp_api.powereditor.menucmdid.IDM_LANG_BATCH;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_INI:
				return npp_api.powereditor.menucmdid.IDM_LANG_INI;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_ASCII:
				return npp_api.powereditor.menucmdid.IDM_LANG_ASCII;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_ASP:
				return npp_api.powereditor.menucmdid.IDM_LANG_ASP;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_SQL:
				return npp_api.powereditor.menucmdid.IDM_LANG_SQL;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_VB:
				return npp_api.powereditor.menucmdid.IDM_LANG_VB;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_JS:
				return npp_api.powereditor.menucmdid.IDM_LANG_JS;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_CSS:
				return npp_api.powereditor.menucmdid.IDM_LANG_CSS;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_PERL:
				return npp_api.powereditor.menucmdid.IDM_LANG_PERL;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_PYTHON:
				return npp_api.powereditor.menucmdid.IDM_LANG_PYTHON;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_LUA:
				return npp_api.powereditor.menucmdid.IDM_LANG_LUA;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_TEX:
				return npp_api.powereditor.menucmdid.IDM_LANG_TEX;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_FORTRAN:
				return npp_api.powereditor.menucmdid.IDM_LANG_FORTRAN;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_BASH:
				return npp_api.powereditor.menucmdid.IDM_LANG_BASH;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_FLASH:
				return npp_api.powereditor.menucmdid.IDM_LANG_FLASH;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_NSIS:
				return npp_api.powereditor.menucmdid.IDM_LANG_NSIS;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_TCL:
				return npp_api.powereditor.menucmdid.IDM_LANG_TCL;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_LISP:
				return npp_api.powereditor.menucmdid.IDM_LANG_LISP;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_SCHEME:
				return npp_api.powereditor.menucmdid.IDM_LANG_SCHEME;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_ASM:
				return npp_api.powereditor.menucmdid.IDM_LANG_ASM;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_DIFF:
				return npp_api.powereditor.menucmdid.IDM_LANG_DIFF;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_PROPS:
				return npp_api.powereditor.menucmdid.IDM_LANG_PROPS;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_PS:
				return npp_api.powereditor.menucmdid.IDM_LANG_PS;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_RUBY:
				return npp_api.powereditor.menucmdid.IDM_LANG_RUBY;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_SMALLTALK:
				return npp_api.powereditor.menucmdid.IDM_LANG_SMALLTALK;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_VHDL:
				return npp_api.powereditor.menucmdid.IDM_LANG_VHDL;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_KIX:
				return npp_api.powereditor.menucmdid.IDM_LANG_KIX;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_AU3:
				return npp_api.powereditor.menucmdid.IDM_LANG_AU3;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_CAML:
				return npp_api.powereditor.menucmdid.IDM_LANG_CAML;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_ADA:
				return npp_api.powereditor.menucmdid.IDM_LANG_ADA;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_VERILOG:
				return npp_api.powereditor.menucmdid.IDM_LANG_VERILOG;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_MATLAB:
				return npp_api.powereditor.menucmdid.IDM_LANG_MATLAB;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_HASKELL:
				return npp_api.powereditor.menucmdid.IDM_LANG_HASKELL;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_INNO:
				return npp_api.powereditor.menucmdid.IDM_LANG_INNO;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_CMAKE:
				return npp_api.powereditor.menucmdid.IDM_LANG_CMAKE;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_YAML:
				return npp_api.powereditor.menucmdid.IDM_LANG_YAML;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_COBOL:
				return npp_api.powereditor.menucmdid.IDM_LANG_COBOL;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_GUI4CLI:
				return npp_api.powereditor.menucmdid.IDM_LANG_GUI4CLI;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_D:
				return npp_api.powereditor.menucmdid.IDM_LANG_D;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_POWERSHELL:
				return npp_api.powereditor.menucmdid.IDM_LANG_POWERSHELL;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_R:
				return npp_api.powereditor.menucmdid.IDM_LANG_R;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_JSP:
				return npp_api.powereditor.menucmdid.IDM_LANG_JSP;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_COFFEESCRIPT:
				return npp_api.powereditor.menucmdid.IDM_LANG_COFFEESCRIPT;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_JSON:
				return npp_api.powereditor.menucmdid.IDM_LANG_JSON;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_FORTRAN_77:
				return npp_api.powereditor.menucmdid.IDM_LANG_FORTRAN_77;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_BAANC:
				return npp_api.powereditor.menucmdid.IDM_LANG_BAANC;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_SREC:
				return npp_api.powereditor.menucmdid.IDM_LANG_SREC;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_IHEX:
				return npp_api.powereditor.menucmdid.IDM_LANG_IHEX;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_TEHEX:
				return npp_api.powereditor.menucmdid.IDM_LANG_TEHEX;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_SWIFT:
				return npp_api.powereditor.menucmdid.IDM_LANG_SWIFT;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_ASN1:
				return npp_api.powereditor.menucmdid.IDM_LANG_ASN1;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_AVS:
				return npp_api.powereditor.menucmdid.IDM_LANG_AVS;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_BLITZBASIC:
				return npp_api.powereditor.menucmdid.IDM_LANG_BLITZBASIC;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_PUREBASIC:
				return npp_api.powereditor.menucmdid.IDM_LANG_PUREBASIC;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_FREEBASIC:
				return npp_api.powereditor.menucmdid.IDM_LANG_FREEBASIC;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_CSOUND:
				return npp_api.powereditor.menucmdid.IDM_LANG_CSOUND;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_ERLANG:
				return npp_api.powereditor.menucmdid.IDM_LANG_ERLANG;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_ESCRIPT:
				return npp_api.powereditor.menucmdid.IDM_LANG_ESCRIPT;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_FORTH:
				return npp_api.powereditor.menucmdid.IDM_LANG_FORTH;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_LATEX:
				return npp_api.powereditor.menucmdid.IDM_LANG_LATEX;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_MMIXAL:
				return npp_api.powereditor.menucmdid.IDM_LANG_MMIXAL;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_NIMROD:
				return npp_api.powereditor.menucmdid.IDM_LANG_NIMROD;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_NNCRONTAB:
				return npp_api.powereditor.menucmdid.IDM_LANG_NNCRONTAB;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_OSCRIPT:
				return npp_api.powereditor.menucmdid.IDM_LANG_OSCRIPT;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_REBOL:
				return npp_api.powereditor.menucmdid.IDM_LANG_REBOL;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_REGISTRY:
				return npp_api.powereditor.menucmdid.IDM_LANG_REGISTRY;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_RUST:
				return npp_api.powereditor.menucmdid.IDM_LANG_RUST;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_SPICE:
				return npp_api.powereditor.menucmdid.IDM_LANG_SPICE;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_TXT2TAGS:
				return npp_api.powereditor.menucmdid.IDM_LANG_TXT2TAGS;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_VISUALPROLOG:
				return npp_api.powereditor.menucmdid.IDM_LANG_VISUALPROLOG;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_EXTERNAL:
				return npp_api.powereditor.menucmdid.IDM_LANG_EXTERNAL;

			//case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_USER:
			//case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_SEARCHRESULT:
			//case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_JAVASCRIPT:
			default:
				return npp_api.powereditor.menucmdid.IDM_LANG_EXTERNAL_LIMIT;
		}
	}

/**
 * Whether Windows \\?\ path is supported
 *
 * Params:
 *      lang = LangType
 *
 * Returns: true is supported
 * ToDo:
 */
pragma(inline, true)
pure nothrow @safe @nogc
bool is_extended_path_supported(npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType lang)

	body
	{
		static import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;

		switch (lang) {
			/*
			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_TEXT:
				return false;
			*/

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_PHP:
				return false;

			/*
			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_C:
				return false;
			*/

			/*
			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_CPP:
				return false;
			*/

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_CS:
				return false;

			/*
			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_OBJC:
				return false;
			*/

			/*
			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_JAVA:
				return false;
			*/

			/*
			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_RC:
				return false;
			*/

			/*
			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_HTML:
				return false;
			*/

			/*
			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_XML:
				return false;
			*/

			/*
			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_MAKEFILE:
				return false;
			*/

			/*
			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_PASCAL:
				return false;
			*/

			/*
			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_BATCH:
				return false;
			*/

			/*
			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_INI:
				return false;
			*/

			/*
			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_ASCII:
				return false;
			*/

			/*
			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_USER:
				return false;
			*/

			/*
			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_ASP:
				return false;
			*/

			/*
			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_SQL:
				return false;
			*/

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_VB:
				return true;

			/*
			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_JS:
				return false;
			*/

			/*
			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_CSS:
				return false;
			*/

			/*
			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_PERL:
				return false;
			*/

			/*
			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_PYTHON:
				return false;
			*/

			/*
			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_LUA:
				return false;
			*/

			/*
			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_TEX:
				return false;
			*/

			/*
			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_FORTRAN:
				return false;
			*/

			/*
			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_BASH:
				return false;
			*/

			/*
			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_FLASH:
				return false;
			*/

			/*
			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_NSIS:
				return false;
			*/

			/*
			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_TCL:
				return false;
			*/

			/*
			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_LISP:
				return false;
			*/

			/*
			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_SCHEME:
				return false;
			*/

			/*
			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_ASM:
				return false;
			*/

			/*
			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_DIFF:
				return false;
			*/

			/*
			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_PROPS:
				return false;
			*/

			/*
			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_PS:
				return false;
			*/

			/*
			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_RUBY:
				return false;
			*/

			/*
			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_SMALLTALK:
				return false;
			*/

			/*
			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_VHDL:
				return false;
			*/

			/*
			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_KIX:
				return false;
			*/

			/*
			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_AU3:
				return false;
			*/

			/*
			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_CAML:
				return false;
			*/

			/*
			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_ADA:
				return false;
			*/

			/*
			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_VERILOG:
				return false;
			*/

			/*
			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_MATLAB:
				return false;
			*/

			/*
			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_HASKELL:
				return false;
			*/

			/*
			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_INNO:
				return false;
			*/

			/*
			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_SEARCHRESULT:
				return false;
			*/

			/*
			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_CMAKE:
				return false;
			*/

			/*
			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_YAML:
				return false;
			*/

			/*
			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_COBOL:
				return false;
			*/

			/*
			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_GUI4CLI:
				return false;
			*/

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_D:
				return true;

			/*
			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_POWERSHELL:
				return false;
			*/

			/*
			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_R:
				return false;
			*/

			/*
			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_JSP:
				return false;
			*/

			/*
			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_COFFEESCRIPT:
				return false;
			*/

			/*
			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_JSON:
				return false;
			*/

			/*
			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_JAVASCRIPT:
				return false;
			*/

			/*
			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_FORTRAN_77:
				return false;
			*/

			/*
			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_BAANC:
				return false;
			*/

			/*
			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_SREC:
				return false;
			*/

			/*
			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_IHEX:
				return false;
			*/

			/*
			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_TEHEX:
				return false;
			*/

			/*
			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_SWIFT:
				return false;
			*/

			/*
			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_ASN1:
				return false;
			*/

			/*
			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_AVS:
				return false;
			*/

			/*
			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_BLITZBASIC:
				return false;
			*/

			/*
			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_PUREBASIC:
				return false;
			*/

			/*
			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_FREEBASIC:
				return false;
			*/

			/*
			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_CSOUND:
				return false;
			*/

			/*
			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_ERLANG:
				return false;
			*/

			/*
			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_ESCRIPT:
				return false;
			*/

			/*
			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_FORTH:
				return false;
			*/

			/*
			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_LATEX:
				return false;
			*/

			/*
			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_MMIXAL:
				return false;
			*/

			/*
			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_NIMROD:
				return false;
			*/

			/*
			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_NNCRONTAB:
				return false;
			*/

			/*
			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_OSCRIPT:
				return false;
			*/

			/*
			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_REBOL:
				return false;
			*/

			/*
			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_REGISTRY:
				return false;
			*/

			/*
			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_RUST:
				return false;
			*/

			/*
			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_SPICE:
				return false;
			*/

			/*
			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_TXT2TAGS:
				return false;
			*/

			/*
			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_VISUALPROLOG:
				return false;
			*/

			/*
			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_EXTERNAL:
				return false;
			*/

			default:
				return false;
		}
	}

/**
 * Whether Windows \\?\ path is supported
 *
 * Params:
 *      ext = lang file extension
 *
 * Returns: true is supported
 */
pragma(inline, true)
pure nothrow @safe @nogc
bool is_extended_path_supported(S)(S ext)
	if (std.traits.isSomeString!(S))

	body
	{
		switch (ext) {
			case ".d":
			case ".go":
				return true;

			//case ".php":
			default:
				return false;
		}
	}

/**
 * Convert LangType to extension
 *
 * Params:
 *      lang = LangType
 *
 * Returns: file extension or null
 * ToDo:
 */
pure nothrow @safe @nogc
S lang_to_ext(S)(npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType lang)

	body
	{
		static import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;

		switch (lang) {
			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_TEXT:
				return ".txt";

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_PHP:
				return ".php";

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_C:
				return ".c";

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_CPP:
				return ".cpp";

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_CS:
				return ".cs";

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_OBJC:
				return null;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_JAVA:
				return null;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_RC:
				return null;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_HTML:
				return ".html";

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_XML:
				return ".xml";

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_MAKEFILE:
				return null;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_PASCAL:
				return null;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_BATCH:
				return null;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_INI:
				return ".ini";

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_ASCII:
				return null;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_USER:
				return null;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_ASP:
				return null;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_SQL:
				return null;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_VB:
				return ".vb";

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_JS:
				return null;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_CSS:
				return null;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_PERL:
				return null;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_PYTHON:
				return ".py";

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_LUA:
				return null;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_TEX:
				return null;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_FORTRAN:
				return null;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_BASH:
				return null;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_FLASH:
				return null;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_NSIS:
				return null;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_TCL:
				return null;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_LISP:
				return null;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_SCHEME:
				return null;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_ASM:
				return ".asm";

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_DIFF:
				return null;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_PROPS:
				return null;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_PS:
				return null;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_RUBY:
				return ".rb";

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_SMALLTALK:
				return null;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_VHDL:
				return null;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_KIX:
				return null;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_AU3:
				return null;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_CAML:
				return null;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_ADA:
				return null;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_VERILOG:
				return null;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_MATLAB:
				return null;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_HASKELL:
				return null;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_INNO:
				return null;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_SEARCHRESULT:
				return null;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_CMAKE:
				return null;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_YAML:
				return null;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_COBOL:
				return null;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_GUI4CLI:
				return null;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_D:
				return ".d";

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_POWERSHELL:
				return null;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_R:
				return null;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_JSP:
				return null;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_COFFEESCRIPT:
				return null;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_JSON:
				return ".json";

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_JAVASCRIPT:
				return null;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_FORTRAN_77:
				return null;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_BAANC:
				return null;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_SREC:
				return null;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_IHEX:
				return null;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_TEHEX:
				return null;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_SWIFT:
				return null;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_ASN1:
				return null;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_AVS:
				return null;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_BLITZBASIC:
				return null;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_PUREBASIC:
				return null;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_FREEBASIC:
				return null;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_CSOUND:
				return null;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_ERLANG:
				return null;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_ESCRIPT:
				return null;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_FORTH:
				return null;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_LATEX:
				return null;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_MMIXAL:
				return null;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_NIMROD:
				return null;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_NNCRONTAB:
				return null;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_OSCRIPT:
				return null;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_REBOL:
				return null;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_REGISTRY:
				return null;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_RUST:
				return null;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_SPICE:
				return null;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_TXT2TAGS:
				return null;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_VISUALPROLOG:
				return null;

			case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_EXTERNAL:
				return null;

			default:
				return null;
		}
}

/**
 * Contert extension to LangType
 *
 * Params:
 *      extension = file extension
 *
 * Returns: LangType, default is L_EXTERNAL
 * ToDo: 
 */
pure nothrow @safe @nogc
npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType ext_to_lang(C)(const (C)[] extension)
	if (std.traits.isSomeChar!(C))

	in
	{
		if (extension.length != 0) {
			assert(extension.length >= 2);
			assert(extension[0] == '.');
		}
	}

	body
	{
		static import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;

		switch (extension) {
			case ".txt":
			case ".log":
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_TEXT;

			case ".php":
			case ".php3":
			case ".php4":
			case ".php5":
			case ".phps":
			case ".phpt":
			case ".phtml":
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_PHP;

			case ".h":
			case ".c":
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_C;

			case ".hh":
			case ".hpp":
			case ".hxx":
			case ".cc":
			case ".cpp":
			case ".cxx":
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_CPP;

			case ".cs":
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_CS;

			/*
			case ".":
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_OBJC;
			*/

			/*
			case ".":
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_JAVA;
			*/

			/*
			case ".":
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_RC;
			*/

			case ".html":
			case ".htm":
			case ".shtml":
			case ".shtm":
			case ".hta":
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_HTML;

			case ".xml":
			case ".xhtml":
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_XML;

			/*
			case ".":
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_MAKEFILE;
			*/

			/*
			case ".":
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_PASCAL;
			*/

			/*
			case ".":
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_BATCH;
			*/

			case ".ini":
			case ".inf":
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_INI;

			/*
			case ".":
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_ASCII;
			*/

			/*
			case ".":
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_USER;
			*/

			case ".asp":
			case ".aspx":
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_ASP;

			case ".sql":
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_SQL;

			case ".vb":
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_VB;

			/*
			case ".js":
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_JS;
			*/

			case ".css":
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_CSS;

			case ".pl":
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_PERL;

			case ".py":
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_PYTHON;

			case ".lua":
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_LUA;

			/*
			case ".":
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_TEX;
			*/

			/*
			case ".":
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_FORTRAN;
			*/

			/*
			case ".":
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_BASH;
			*/

			/*
			case ".":
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_FLASH;
			*/

			/*
			case ".":
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_NSIS;
			*/

			/*
			case ".":
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_TCL;
			*/

			/*
			case ".":
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_LISP;
			*/

			/*
			case ".":
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_SCHEME;
			*/

			/*
			case ".":
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_ASM;
			*/

			/*
			case ".":
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_DIFF;
			*/

			/*
			case ".":
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_PROPS;
			*/

			/*
			case ".":
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_PS;
			*/

			case ".rb":
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_RUBY;

			/*
			case ".":
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_SMALLTALK;
			*/

			/*
			case ".":
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_VHDL;
			*/

			/*
			case ".":
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_KIX;
			*/

			/*
			case ".":
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_AU3;
			*/

			/*
			case ".":
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_CAML;
			*/

			/*
			case ".":
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_ADA;
			*/

			/*
			case ".":
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_VERILOG;
			*/

			/*
			case ".":
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_MATLAB;
			*/

			/*
			case ".":
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_HASKELL;
			*/

			/*
			case ".":
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_INNO;
			*/

			/*
			case ".":
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_SEARCHRESULT;
			*/

			/*
			case ".":
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_CMAKE;
			*/

			/*
			case ".":
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_YAML;
			*/

			/*
			case ".":
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_COBOL;
			*/

			/*
			case ".":
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_GUI4CLI;
			*/

			case ".d":
			case ".dd":
			case ".di":
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_D;

			case ".ps":
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_POWERSHELL;

			case ".r":
			case ".rda":
			case ".rdata":
			case ".rds":
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_R;

			/*
			case ".":
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_JSP;
			*/

			/*
			case ".":
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_COFFEESCRIPT;
			*/

			case ".json":
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_JSON;

			/*
			case ".js":
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_JAVASCRIPT;
			*/

			/*
			case ".":
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_FORTRAN_77;
			*/

			/*
			case ".":
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_BAANC;
			*/

			/*
			case ".":
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_SREC;
			*/

			/*
			case ".":
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_IHEX;
			*/

			/*
			case ".":
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_TEHEX;
			*/

			/*
			case ".":
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_SWIFT;
			*/

			/*
			case ".":
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_ASN1;
			*/

			/*
			case ".":
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_AVS;
			*/

			/*
			case ".":
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_BLITZBASIC;
			*/

			/*
			case ".":
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_PUREBASIC;
			*/

			/*
			case ".":
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_FREEBASIC;
			*/

			/*
			case ".":
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_CSOUND;
			*/

			/*
			case ".":
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_ERLANG;
			*/

			/*
			case ".":
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_ESCRIPT;
			*/

			/*
			case ".":
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_FORTH;
			*/

			/*
			case ".":
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_LATEX;
			*/

			/*
			case ".":
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_MMIXAL;
			*/

			/*
			case ".":
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_NIMROD;
			*/

			/*
			case ".":
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_NNCRONTAB;
			*/

			/*
			case ".":
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_OSCRIPT;
			*/

			/*
			case ".":
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_REBOL;
			*/

			/*
			case ".":
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_REGISTRY;
			*/

			/*
			case ".":
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_RUST;
			*/

			/*
			case ".":
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_SPICE;
			*/

			/*
			case ".":
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_TXT2TAGS;
			*/

			/*
			case ".":
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_VISUALPROLOG;
			*/

			default:
				return npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_EXTERNAL;
		}
	}

	unittest
	{
		static import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;
		static import npp_api.pluginfunc.lang;

		assert(npp_api.pluginfunc.lang.ext_to_lang(".php") == npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_PHP);
		assert(npp_api.pluginfunc.lang.ext_to_lang(".php"w) == npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_PHP);
		assert(npp_api.pluginfunc.lang.ext_to_lang(".php"d) == npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_PHP);
		assert(npp_api.pluginfunc.lang.ext_to_lang(".php\0") != npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_PHP);
		assert(npp_api.pluginfunc.lang.ext_to_lang(".PHP") != npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_PHP);
	}

version (Windows) {
	/**
	 * プログラミング言語のデフォルトのファイルパスを返す。
	 *
	 * Params:
	 *      lang = 
	 *
	 * Returns: そのプログラミング言語の実行ファイルへのPATHが決まっていたらそのPATH。決まっていないなら実行ファイル名のみ。見つからないならnull。
	 * ToDo:
	 */
	pure nothrow @safe @nogc
	immutable (C)[] default_lang_path(C)(npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType lang)
		if (std.traits.isSomeChar!(C))

		body
		{
			static import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;

			switch (lang) {
				case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_TEXT:
					return null;

				case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_PHP:
					return "php.exe";

				case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_C:
					return null;

				case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_CPP:
					return null;

				case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_CS:
					return "csc.exe";

				case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_OBJC:
					return null;

				case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_JAVA:
					return null;

				case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_RC:
					return null;

				case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_HTML:
					return null;

				case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_XML:
					return null;

				case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_MAKEFILE:
					return null;

				case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_PASCAL:
					return null;

				case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_BATCH:
					return null;

				case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_INI:
					return null;

				case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_ASCII:
					return null;

				case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_USER:
					return null;

				case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_ASP:
					return null;

				case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_SQL:
					return null;

				case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_VB:
					return null;

				case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_JS:
					return null;

				case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_CSS:
					return null;

				case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_PERL:
					return null;

				case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_PYTHON:
					return "python.exe";

				case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_LUA:
					return null;

				case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_TEX:
					return null;

				case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_FORTRAN:
					return null;

				case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_BASH:
					return null;

				case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_FLASH:
					return null;

				case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_NSIS:
					return null;

				case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_TCL:
					return null;

				case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_LISP:
					return null;

				case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_SCHEME:
					return null;

				case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_ASM:
					return null;

				case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_DIFF:
					return null;

				case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_PROPS:
					return null;

				case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_PS:
					return null;

				case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_RUBY:
					return "ruby.exe";

				case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_SMALLTALK:
					return null;

				case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_VHDL:
					return null;

				case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_KIX:
					return null;

				case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_AU3:
					return null;

				case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_CAML:
					return null;

				case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_ADA:
					return null;

				case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_VERILOG:
					return null;

				case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_MATLAB:
					return null;

				case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_HASKELL:
					return null;

				case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_INNO:
					return null;

				case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_SEARCHRESULT:
					return null;

				case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_CMAKE:
					return null;

				case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_YAML:
					return null;

				case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_COBOL:
					return null;

				case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_GUI4CLI:
					return null;

				case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_D:
					return "%HOMEDRIVE%/D/dmd2/windows/bin/dmd.exe";

				case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_POWERSHELL:
					return null;

				case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_R:
					return null;

				case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_JSP:
					return null;

				case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_COFFEESCRIPT:
					return null;

				case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_JSON:
					return null;

				case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_JAVASCRIPT:
					return null;

				case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_FORTRAN_77:
					return null;

				case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_BAANC:
					return null;

				case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_SREC:
					return null;

				case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_IHEX:
					return null;

				case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_TEHEX:
					return null;

				case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_SWIFT:
					return null;

				case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_ASN1:
					return null;

				case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_AVS:
					return null;

				case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_BLITZBASIC:
					return null;

				case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_PUREBASIC:
					return null;

				case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_FREEBASIC:
					return null;

				case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_CSOUND:
					return null;

				case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_ERLANG:
					return null;

				case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_ESCRIPT:
					return null;

				case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_FORTH:
					return null;

				case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_LATEX:
					return null;

				case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_MMIXAL:
					return null;

				case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_NIMROD:
					return null;

				case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_NNCRONTAB:
					return null;

				case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_OSCRIPT:
					return null;

				case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_REBOL:
					return null;

				case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_REGISTRY:
					return null;

				case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_RUST:
					return null;

				case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_SPICE:
					return null;

				case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_TXT2TAGS:
					return null;

				case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_VISUALPROLOG:
					return null;

				case npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType.L_EXTERNAL:
				default:
					return null;
			}
		}

	/**
	 * 拡張子からデフォルトの実行ファイル名のPATHを返す
	 * ToDo:
	 */
	pure nothrow @safe @nogc
	immutable (C)[] default_lang_path(C)(const (C)[] extension)
		if (std.traits.isSomeChar!(C))

		body
		{
			static import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;

			npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType lang_type = .ext_to_lang(extension);

			if (is_known_lang(lang_type)) {
				return .default_lang_path!(C)(lang_type);
			}

			switch (extension) {
				case ".dub":
				case ".sdl":
					return "%HOMEDRIVE%/D/dmd2/windows/bin/dub.exe";

				case ".go":
					return "%HOMEDRIVE%/Go/bin/go.exe";

				default:
					break;
			}

			return null;
		}

	template L_EXE_PATH(S, npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType lang)
		if (std.traits.isSomeString!(S))
	{
		static import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;

		enum S L_EXE_PATH = default_lang_path!(S)(lang);
		static assert(L_EXE_PATH.length != 0);
	}

	pragma(inline, true)
	nothrow @nogc
	void set_lang(core.sys.windows.windef.HWND _nppHandle, npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType lang)

		body
		{
			static import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;
			static import npp_api.pluginfunc.npp_msgs;

			if (is_known_lang(lang)) {
				npp_api.pluginfunc.npp_msgs.send_NPPM_SETCURRENTLANGTYPE(_nppHandle, lang);
			}
		}

	pragma(inline, true)
	nothrow @nogc
	void set_lang(C)(core.sys.windows.windef.HWND _nppHandle, const (C)[] extension)
		if (std.traits.isSomeChar!(C))

		body
		{
			static import npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs;
			static import npp_api.pluginfunc.npp_msgs;

			npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType lang_type = .ext_to_lang(extension);

			if (is_known_lang(lang_type)) {
				npp_api.pluginfunc.npp_msgs.send_NPPM_SETCURRENTLANGTYPE(_nppHandle, lang_type);
			}
		}

	version (Not_betterC) {
		wstring replace_lang_variable(wstring path)

		body
		{
			static import core.sys.windows.winbase;
			static import std.algorithm;
			static import std.array;
			static import npp_api.pluginfunc.string;
			static import npp_api.pluginfunc.path;

			if ((path == null) || (!std.algorithm.canFind(path, '%'))) {
				return path;
			}

			core.sys.windows.winnt.WCHAR[npp_api.pluginfunc.path.OS_MAX_PATH] buf = '\0';

			if (core.sys.windows.winbase.GetEnvironmentVariableW(&(npp_api.pluginfunc.string.c_wstring!("HOMEDRIVE"w)[0]), &(buf[0]), buf.length) == 0) {
				return path;
			}

			return std.array.replace(path, "%HOMEDRIVE%"w, npp_api.pluginfunc.string.from_stringz(buf)).idup;
		}

		nothrow
		wstring lang_path(lang_identifier)(lang_identifier lang)
			if (is(lang_identifier : npp_api.powereditor.misc.pluginsmanager.notepad_plus_msgs.LangType) || is(lang_identifier : const wchar[]))

			body
			{
				static import std.algorithm;
				static import std.path;
				static import npp_api.pluginfunc.path;

				wstring path = default_lang_path!(wchar)(lang);

				if (path == null) {
					return null;
				}

				try {
					if (std.algorithm.canFind(path, '%')) {
						path = replace_lang_variable(path);
						assert(!std.algorithm.canFind(path, '%'));
					}

					if (!std.path.isAbsolute(path)) {
						path = npp_api.pluginfunc.path.search_exe(path);
					}
				} catch (Exception e) {
				}

				return path.idup;
			}
	}
}
