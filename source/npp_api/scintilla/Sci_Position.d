// Scintilla source code edit control
/** @file Sci_Position.h
 ** Define the Sci_Position type used in Scintilla's external interfaces.
 ** These need to be available to clients written in C so are not in a C++ namespace.
 **/
// Copyright 2015 by Neil Hodgson <neilh@scintilla.org>
// The License.txt file describes the conditions under which this software may be distributed.
/**
 * Scintilla source code edit control
 *
 * License: GPL-2.0 or later
 */
module npp_api.scintilla.Sci_Position;


private static import core.stdc.config;

/**
 * Basic signed type used throughout interface
 */
alias Sci_Position = ptrdiff_t;

/**
 * Unsigned variant used for ILexer::Lex and ILexer::Fold
 */
alias Sci_PositionU = size_t;

/**
 * For Sci_CharacterRange  which is defined as long to be compatible with Win32 CHARRANGE
 */
alias Sci_PositionCR = core.stdc.config.c_long;

/+
#ifdef _WIN32
	#define SCI_METHOD __stdcall
#else
	#define SCI_METHOD
#endif
+/
