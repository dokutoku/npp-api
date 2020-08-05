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
 * 
 *
 * See_Also:
 *      https://github.com/notepad-plus-plus/nppPluginList
 *
 * Author: dokutoku, https://twitter.com/dokutoku3
 * License: GPL-2.0 or later
 */
module npp_api.pluginfunc.export_info;


version (Not_betterC):

private static import std.array;
private static import std.ascii;
private static import std.digest;
private static import std.digest.sha;
private static import std.file;
private static import std.json;

private enum string[] key_names =
[
	`folder-name`,
	`display-name`,
	`version`,
	`id`,
	`repository`,
	`description`,
	`author`,
	`homepage`,
];

/**
 *
 */
struct npp_plugin_info_item
{
	/**
	 * plugin folder name
	 */
	string folder_name;

	/**
	 * plugin display name
	 */
	string display_name;

	/**
	 * plugin veresion
	 */
	string version_;

	/**
	 * SHA-256 zip file hash
	 */
	string id;

	/**
	 * plugin zip file uri
	 */
	string repository;

	/**
	 * plugin description
	 */
	string description;

	/**
	 * plugin author
	 */
	string author;

	/**
	 * plugin project page URI
	 */
	string homepage;

	void update_id(string input_file)

		do
		{
			if (!std.file.exists(input_file) || !std.file.isFile(input_file)) {
				throw new Exception(`Unknown input file.`);
			}

			this.id = std.digest.toHexString!(std.ascii.LetterCase.lower)(std.digest.sha.sha256Of(std.file.read(input_file))).idup;
		}

	@disable
	void update_json(std.json.JSONValue input)

		do
		{
			/+
			foreach (item_value; this.tupleof) {
			}
			+/
		}

	string export_json()

		in
		{
			static assert(key_names.length == this.tupleof.length);
		}

		do
		{
			auto output = std.array.appender!(string);

			output.put("\t\t");
			output.put(`{`);
			output.put("\n");

			size_t i = 0;

			foreach (item_value; this.tupleof) {
				std.json.JSONValue json_value = item_value;
				output.put("\t\t\t");
				output.put(`"`);
				output.put(key_names[i]);
				output.put(`": `);
				output.put(std.json.toJSON(json_value, false, std.json.JSONOptions.escapeNonAsciiChars | std.json.JSONOptions.doNotEscapeSlashes));
				output.put((i != (this.tupleof.length - 1)) ? (",\n") : ("\n"));
				i++;
			}

			output.put("\t\t");
			output.put(`}`);
			output.put(`,`);
			output.put("\n");

			return output.data().idup;
		}
}


string create_plugin_list_json(A...)(A a)

	in
	{
		foreach (item; a) {
			static assert(is(typeof(item) : string));
		}
	}

	do
	{
		auto output = std.array.appender!(string);

		output.put(`{`);
		output.put("\n");

		output.put("\t");
		output.put(`"npp-plugins": [`);
		output.put("\n");

		foreach (item; a) {
			output.put(item);
		}


		output.put("\t");
		output.put(`]`);
		output.put("\n");

		output.put(`}`);
		output.put("\n");


		return output.data().idup;
	}
