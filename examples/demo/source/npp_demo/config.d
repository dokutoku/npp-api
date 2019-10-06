/**
 * plugin config
 */
module npp_demo.config;


private static import npp_api.pluginfunc.extra_interfece;
private static import npp_api.powereditor.misc.pluginsmanager.plugininterface;
private static import npp_api.pluginfunc.config_file;
private static import npp_demo.commands;

private import npp_api.powereditor.misc.pluginsmanager.plugininterface;
private import npp_demo.commands;
private import npp_demo.plugin_dll;

/**
 * Alt + F
 */
extern (C)
__gshared npp_api.powereditor.misc.pluginsmanager.plugininterface.ShortcutKey shKey =
{
	_isAlt: true,
	_isCtrl: false,
	_isShift: false,
	_key: 'F',
};

/**
 * Alt + Q
 */
extern (C)
__gshared npp_api.powereditor.misc.pluginsmanager.plugininterface.ShortcutKey pShKey =
{
	_isAlt: true,
	_isCtrl: false,
	_isShift: false,
	_key: 'Q',
};

enum npp_api.pluginfunc.config_file.plugin_config_info plugin_config =
{
	type: npp_api.pluginfunc.config_file.config_type_t.ini,
	directory_name: ``,
	file_name: `pluginDemo`,
	ini_section_name: `Insert Extesion`,
	settings:
	[
		{
			name: ``,
			type: npp_api.pluginfunc.config_file.value_type.bool_type,
		},
	],
};

enum npp_api.pluginfunc.extra_interfece.npp_plugin_definition plugin_def =
{
	name: "Notepad++ plugin demo",
	version_string: "0.1",
	author: "Unknown",
	config_info: plugin_config,
	menu_items:
	[
		{
			identifier: `Hello Notepad++`,
			func_item:
			{
				_itemName: "Hello Notepad++"w,
				_pFunc: &.hello,
				_init2Check: false,
				_pShKey: null,
			},
		},
		{
			identifier: `Hello (with FX)`,
			func_item:
			{
				_itemName: "Hello (with FX)"w,
				_pFunc: &.helloFX,
				_init2Check: false,
				_pShKey: null,
			},
		},
		{
			identifier: `What is Notepad++?`,
			func_item:
			{
				_itemName: "What is Notepad++?"w,
				_pFunc: &.WhatIsNpp,
				_init2Check: false,
				_pShKey: null,
			},
		},
		{
			func_item:
			{
				_pFunc: null,
			},
		},
		{
			identifier: `Current Full Path`,
			func_item:
			{
				_itemName: "Current Full Path"w,
				_pFunc: &.insertCurrentFullPath,
				_init2Check: false,
				_pShKey: &.shKey,
			},
		},
		{
			identifier: `Current File Name`,
			func_item:
			{
				_itemName: "Current File Name"w,
				_pFunc: &.insertCurrentFileName,
				_init2Check: false,
				_pShKey: null,
			},
		},
		{
			identifier: `Current Directory`,
			func_item:
			{
				_itemName: "Current Directory"w,
				_pFunc: &.insertCurrentDirectory,
				_init2Check: false,
				_pShKey: null,
			},
		},
		{
			identifier: `Date & Time - short format`,
			func_item:
			{
				_itemName: "Date & Time - short format"w,
				_pFunc: &.insertShortDateTime,
				_init2Check: false,
				_pShKey: null,
			},
		},
		{
			identifier: `Date & Time - long format`,
			func_item:
			{
				_itemName: "Date & Time - long format"w,
				_pFunc: &.insertLongDateTime,
				_init2Check: false,
				_pShKey: null,
			},
		},
		{
			identifier: `Close HTML/XML tag automatically`,
			menu_checked_identifier: `doCloseTag`,
			func_item:
			{
				_itemName: "Close HTML/XML tag automatically"w,
				_pFunc: &.insertHtmlCloseTag.auto_change_check,
				_init2Check: false,
				_pShKey: &.pShKey,
			},
		},
		{
			func_item:
			{
				_pFunc: null,
			},
		},
		{
			identifier: `Get File Names Demo`,
			func_item:
			{
				_itemName: "Get File Names Demo"w,
				_pFunc: &.getFileNamesDemo,
				_init2Check: false,
				_pShKey: null,
			},
		},
		{
			identifier: `Get Session File Names Demo`,
			func_item:
			{
				_itemName: "Get Session File Names Demo"w,
				_pFunc: &.getSessionFileNamesDemo,
				_init2Check: false,
				_pShKey: null,
			},
		},
		{
			identifier: `Save Current Session Demo`,
			func_item:
			{
				_itemName: "Save Current Session Demo"w,
				_pFunc: &.saveCurrentSessionDemo,
				_init2Check: false,
				_pShKey: null,
			},
		},
		{
			func_item:
			{
				_pFunc: null,
			},
		},
		{
			identifier: `Dockable Dialog Demo`,
			func_item:
			{
				_itemName: "Dockable Dialog Demo"w,
				_pFunc: &.DockableDlgDemo,
				_init2Check: false,
				_pShKey: null,
			},
		},
	],
};
