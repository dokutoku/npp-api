# NPP API
NPP API is a D language Notepad ++ plugin development library.

This library is a **development version** created by a **novice programming**.
Note that **destructive changes** can be **added in sequence**.

The original text of this document is written in [Japanese](https://gitlab.com/dokutoku/npp-api/blob/master/README-ja.md).

## Characteristic
### Automatic definition generation
This library can automatically generate processing for the following items:

- Functions required for Notepad ++ plugin
- Main menu
- Sub menu
- Generate configuration file
- Read configuration file
- Write configuration file
- Check main menu

You just write the plugin definition and mixin it.

### BetterC support
Being able to support BetterC is very important.
By using BetterC, you can achieve the same execution speed as C language.

### Message wrapper function
Introduced functions to pass messages to Notepad ++ and Scintilla. This is advantageous in the following points.

- Don't worry about SendMessageA or SendMessageW
- No need to think about the location of parameters passed to SendMessage

## Contents of sample folder
### betterC_test
BetterC compilation test

### converter
[converter](https://github.com/npp-plugins/converter) Plugin

### plugindemo
[plugindemo](https://github.com/npp-plugins/plugindemo) Plugin

### func_test
Function test for this library

### hello
hello world plugin sample

### mimetools
[mimetools](https://github.com/npp-plugins/mimetools) Plugin

## How to publish Notepad ++ plugin
To publish Notepad ++ plugins, you need to register in [nppPluginList](https://github.com/notepad-plus-plus/nppPluginList).
[nppPluginList](https://github.com/notepad-plus-plus/nppPluginList) plugin is a plugin manager that comes with Notepad ++.
By registering with this, you can let the user download the plugin.

#### Create res file
First, copyright information must be assigned to the plugin DLL.

To assign copyright information for the plugin, prepare an .rc file that describes the copyright information.
It is recommended that the character encoding of the rc file be UTF-16.

Compile the .rc file and specify the resulting .res file at build time.
The command to compile the rc file is as follows.

```
rc / n test.rc
```

### Build
Build the plugin with [DUB](https://code.dlang.org/).
Create 32-bit and 64-bit versions.

```
dub build --arch = x86 --build = release
dub build --arch = x86_64 --build = release
```

### Create a zip file
Compress the generated plugin file directly into a zip file without putting it in the directory.
The zip file must be 32bit and 64bit separately.

After compression, change the zip file name to the same name as the plugin dll.

### Create a SHA-256 file hash
Create a SHA-256 file hash of each created zip file.

### Send a pull request
Download the JSON file from the [nppPluginList](https://github.com/notepad-plus-plus/nppPluginList) repository.
The role of the JSON file is as follows.

- [pl.x86.json](https://github.com/notepad-plus-plus/nppPluginList/blob/master/src/pl.x86.json) (32bit)
- [pl.x64.json](https://github.com/notepad-plus-plus/nppPluginList/blob/master/src/pl.x64.json) (64bit)

After downloading the JSON file, add your plugin information.

| Item | Description |
| --- | --- |
| folder-name | Name of the folder to be created under the Notepad ++ plugin folder. **Must be the same as the plugin dll name**. |
| display-name | Name of the plugin |
| version | plugin version |
| id | SHA-256 hash of the zip file |
| repository | Download URI corresponding to plugin version |
| description | plugin overview |
| author | plugin author |
| homepage | Plugin homepage |

## Donation
The project is soliciting donations to continue development.
Please refer to the following site for details.

https://dokutoku.gitlab.io/donation/donation-en.html

## Project status
I spend a lot of time [NPP API](https://gitlab.com/dokutoku/npp-api) and [RDMD for Notepadd ++](https://gitlab.com/dokutoku/rdmd-for-npp) Spent on development. And I was able to implement the functions I wanted.

So if there is no donation, we will stop development.

## Sites that may be helpful for plugin production
- [Plugin Development](https://web.archive.org/web/20190717193010/http://docs.notepad-plus-plus.org/index.php?title=Plugin_Development)
- [Plugin Development | Notepad ++ Community](https://community.notepad-plus-plus.org/category/5/plugin-development)
- [Introduction | Notepad ++ User Manual](https://npp-user-manual.org)
