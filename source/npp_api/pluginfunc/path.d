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
module npp_api.pluginfunc.path;


version (Windows):
version (Not_betterC):

private static import core.sys.windows.winbase;
private static import core.sys.windows.windef;
private static import core.sys.windows.winnt;
private static import std.algorithm;
private static import std.array;
private static import std.file;
private static import std.string;
private static import std.path;
private static import std.process;
private static import npp_api.powereditor.misc.pluginsmanager.plugininterface;
private static import npp_api.pluginfunc.npp_msgs;
private static import npp_api.pluginfunc.string;
private static import std.process;

enum OS_MAX_PATH = 32768;

/**
 * get file path
 */
nothrow @nogc
bool get_full_current_path(core.sys.windows.windef.HWND _nppHandle, ref core.sys.windows.winnt.WCHAR[.OS_MAX_PATH] path_temp)

	do
	{
		static import core.sys.windows.windef;
		static import npp_api.powereditor.misc.pluginsmanager.plugininterface;
		static import npp_api.pluginfunc.npp_msgs;

		path_temp[] = '\0';

		if (npp_api.pluginfunc.npp_msgs.send_NPPM_GETFULLCURRENTPATH(_nppHandle, .OS_MAX_PATH, &(path_temp[0])) == core.sys.windows.windef.TRUE) {
			return true;
		} else {
			return false;
		}
	}

nothrow
wstring get_file_path(core.sys.windows.windef.HWND _nppHandle)

	do
	{
		static import core.sys.windows.winnt;
		static import npp_api.pluginfunc.string;

		core.sys.windows.winnt.WCHAR[.OS_MAX_PATH] path_temp;

		if (.get_full_current_path(_nppHandle, path_temp)) {
			return npp_api.pluginfunc.string.from_stringz(path_temp);
		} else {
			return null;
		}
	}

nothrow
wstring get_directory_path(core.sys.windows.windef.HWND _nppHandle)

	do
	{
		static import core.sys.windows.windef;
		static import core.sys.windows.winnt;
		static import npp_api.pluginfunc.string;
		static import npp_api.pluginfunc.npp_msgs;

		core.sys.windows.winnt.WCHAR[.OS_MAX_PATH] path_temp;

		if (npp_api.pluginfunc.npp_msgs.send_NPPM_GETCURRENTDIRECTORY(_nppHandle, .OS_MAX_PATH, &(path_temp[0])) == core.sys.windows.windef.TRUE) {
			return npp_api.pluginfunc.string.from_stringz(path_temp);
		} else {
			return null;
		}
	}

pure nothrow @safe
private immutable (C)[][] c_names(C)(const C[][] input)

	do
	{
		immutable (C)[][] output = new immutable (C)[][input.length];

		for (size_t i = 0; i < input.length; i++) {
			output[i] = (input[i] ~ '\0').idup;
		}

		return output;
	}

pure nothrow @safe
private immutable (C)[][] create_variable_identifiers(C)(const C[][] input)

	do
	{
		immutable (C)[][] output = new immutable (C)[][input.length];

		for (size_t i = 0; i < input.length; i++) {
			output[i] = ('%' ~ input[i] ~ '%').idup;
		}

		return output;
	}

enum wstring[] windows_variable_names =
[
	`ALLUSERSPROFILE`w,
	`APPDATA`w,
	`CommonProgramFiles`w,
	`CommonProgramFiles(x86)`w,
	`CommonProgramW6432`w,
	`COMPUTERNAME`w,
	`ComSpec`w,
	`DriverData`w,
	`HOMEDRIVE`w,
	`HOMEPATH`w,
	`LOCALAPPDATA`w,
	`LOGONSERVER`w,
	`NUMBER_OF_PROCESSORS`w,
	`OneDrive`w,
	`OS`w,
	`Path`w,
	`PATHEXT`w,
	`PROCESSOR_ARCHITECTURE`w,
	`PROCESSOR_ARCHITEW6432`w,
	`PROCESSOR_IDENTIFIER`w,
	`PROCESSOR_LEVEL`w,
	`PROCESSOR_REVISION`w,
	`ProgramData`w,
	`ProgramFiles`w,
	`ProgramFiles(x86)`w,
	`ProgramW6432`w,
	`PROMPT`w,
	`PSModulePath`w,
	`PUBLIC`w,
	`SESSIONNAME`w,
	`SystemDrive`w,
	`SystemRoot`w,
	`TEMP`w,
	`TMP`w,
	`USERDOMAIN`w,
	`USERDOMAIN_ROAMINGPROFILE`w,
	`USERNAME`w,
	`USERPROFILE`w,
	`windir`w,
];

enum wstring[] windows_variable_wnames = c_names!(wchar)(windows_variable_names);
enum wstring[] windows_variables = create_variable_identifiers!(wchar)(windows_variable_names);

pure nothrow @safe @nogc
private size_t max_length(wstring[] list)

	do
	{
		size_t max_length = 0;

		for (size_t i = 0; i < list.length; i++) {
			if (list[i].length > max_length) {
				max_length = list[i].length;
			}
		}

		return max_length;
	}

nothrow
wstring echo_variables(wstring name)

	do
	{
		static import core.sys.windows.winbase;
		static import std.algorithm;
		static import std.array;
		static import npp_api.pluginfunc.string;

		enum buf_length = max_length(windows_variable_names) + 1;

		core.sys.windows.winnt.WCHAR[buf_length] name_buf = '\0';
		core.sys.windows.winnt.WCHAR[.OS_MAX_PATH] buf = '\0';

		if (name.length > buf_length) {
			return null;
		}

		npp_api.pluginfunc.string.copy_string(name_buf, name);

		core.sys.windows.windef.DWORD Environment_length = core.sys.windows.winbase.GetEnvironmentVariableW(&(name_buf[0]), &(buf[0]), buf.length);

		if (Environment_length == 0) {
			return null;
		}

		return buf[0 .. Environment_length].idup;
	}

nothrow
wstring repalce_variables(wstring path)

	do
	{
		static import core.sys.windows.winbase;
		static import std.algorithm;
		static import std.array;
		static import npp_api.pluginfunc.string;

		if (path == null) {
			return path;
		}

		try {
			if (!std.algorithm.canFind(path, '%')) {
				return path;
			}
		} catch (Exception e) {
			//ToDo:
			return path;
		}

		core.sys.windows.winnt.WCHAR[.OS_MAX_PATH] buf = '\0';
		core.sys.windows.winnt.WCHAR[.OS_MAX_PATH] output_buf = '\0';

		for (size_t i = 0; i < windows_variable_wnames.length; i++) {
			try {
				if (!std.algorithm.canFind(path, windows_variables[i])) {
					continue;
				}
			} catch (Exception e) {
				//ToDo:
				continue;
			}

			core.sys.windows.windef.DWORD Environment_length = core.sys.windows.winbase.GetEnvironmentVariableW(&(windows_variable_wnames[i][0]), &(buf[0]), buf.length);

			if (Environment_length == 0) {
				continue;
			}

			path = std.array.replace(path, windows_variables[i], buf[0 .. Environment_length]).idup;
		}

		return path;
	}

/**
 * search exe file from "PATH"
 */
nothrow
wstring search_exe(const wchar[] exe_name, wstring default_name = null)

	in
	{
		assert(exe_name.length != 0);

		for (size_t i = 0; i < exe_name.length; i++) {
			assert(exe_name[i] != '\\');
		}
	}

	do
	{
		static import core.sys.windows.winnt;
		static import core.sys.windows.winbase;
		static import std.array;
		static import std.file;
		static import std.string;
		static import std.path;
		static import npp_api.pluginfunc.string;

		//dlang GC Bug?
		version (none) {
			//ToDo: インストールされたものの中から検索
			try {
				core.sys.windows.winnt.WCHAR[.OS_MAX_PATH] buf = '\0';
				core.sys.windows.windef.DWORD Environment_length = core.sys.windows.winbase.GetEnvironmentVariableW(&(npp_api.pluginfunc.string.c_wstring!(`PATH`w)[0]), &(buf[0]), buf.length);

				if (Environment_length == 0) {
					return (default_name != null) ? (default_name) : (exe_name.idup);
				}

				wstring[] PATH_directory = std.array.split(buf[0 .. Environment_length].idup, ';');

				foreach (PATH; PATH_directory) {
					if ((!std.file.exists(PATH)) || (!std.file.isDir(PATH))) {
						continue;
					}

					wstring file_exe = std.path.buildPath(PATH, exe_name);

					if ((!std.file.exists(file_exe)) || (!std.file.isFile(file_exe))) {
						continue;
					}

					return file_exe.idup;
				}
			} catch (Exception e) {
				//ToDo:
			}

			return (default_name != null) ? (default_name) : (exe_name.idup);
		} else {
			return (default_name != null) ? (default_name) : (exe_name.idup);
		}
	}

//ToDo: dlang GC bug?
@disable
nothrow
string search_exe(const char[] exe_name, string default_name = null)

	in
	{
		assert(exe_name.length != 0);

		for (size_t i = 0; i < exe_name.length; i++) {
			assert(exe_name[i] != '\\');
		}
	}

	do
	{
		static import std.array;
		static import std.file;
		static import std.string;
		static import std.path;
		static import std.process;

		try {
			string[] PATH_directory = std.array.split(std.process.environment[`PATH`], ';');

			foreach (PATH; PATH_directory) {
				if ((!std.file.exists(PATH)) || (!std.file.isDir(PATH))) {
					continue;
				}

				string file_exe = std.path.buildPath(PATH, exe_name);

				if ((!std.file.exists(file_exe)) || (!std.file.isFile(file_exe))) {
					continue;
				}

				return file_exe.idup;
			}
		} catch (Exception e) {
		}

		return (default_name != null) ? (default_name) : (exe_name.idup);
	}
