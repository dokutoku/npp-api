[![pipeline status](https://gitlab.com/dokutoku/npp-api/badges/master/pipeline.svg)](https://gitlab.com/dokutoku/npp-api/commits/master)
# NPP API
NPP APIはD言語製のNotepad++のプラグイン開発ライブラリです。

このライブラリは**プログラミング初心者**が製作した**開発版**です。
**破壊的変更**が**次々に加えられる**可能性があることに注意してください。

この文章の原文は[日本語](https://gitlab.com/dokutoku/npp-api/blob/master/README-ja.md)で書かれています。

## 特徴
### 定義の自動生成
このライブラリは以下の項目の処理を自動的に生成することができます。

- Notepad++のプラグインに必要な関数群
- メインメニュー
- サブメニュー
- 設定ファイルの生成
- 設定ファイルの読み取り
- 設定ファイルの書き込み
- メインメニュのチェック

あなたはプラグインの定義を書いて、mixinするだけです。

### BetterC対応
BetterCに対応できることは非常に重要です。
BetterCを利用することでC言語と同等の実行速度を実現することができます。

### メッセージのラッパー関数
Notepad++やScintillaにメッセージを渡す関数を導入しました。これは以下のような点で有利です。

- SendMessageAかSendMessageWかを気にしなくてもよくなる
- SendMessageに渡すパラメータの場所について考えなくてよくなる

## サンプルフォルダの内容
### betterC_test
BetterCのコンパイルテスト

### converter
[converter](https://github.com/npp-plugins/converter)プラグイン

### plugindemo
[plugindemo](https://github.com/npp-plugins/plugindemo)プラグイン

### func_test
このライブラリの関数テスト

### hello
hello worldプラグインサンプル

### mimetools
[mimetools](https://github.com/npp-plugins/mimetools)プラグイン

## Notepad++プラグインを公開する方法
Notepad++のプラグインを公開するには、[nppPluginList](https://github.com/notepad-plus-plus/nppPluginList)に登録する必要があります。
[nppPluginList](https://github.com/notepad-plus-plus/nppPluginList)プラグインはNotepad++本体に付属されているプラグインマネージャーです。
これに登録することで、あなたは利用者にプラグインをダウンロードさせることができます。

#### resファイルを作成する
まずはプラグインのDLLに著作権情報を付与しなければなりません。

プラグインの著作権情報を付与するには、著作権情報を記述した.rcファイルを用意します。
rcファイルの文字エンコーディングはUTF-16にすることを推奨します。

.rcファイルをコンパイルして、できた.resファイルをビルド時に指定します。
rcファイルをコンパイルするコマンドは以下のようになります。

```
rc /n test.rc
```

### ビルドする
プラグインを[DUB](https://code.dlang.org/)でビルドします。
32bit版と64bit版を作成します。

```
dub build --arch=x86 --build=release
dub build --arch=x86_64 --build=release
```

### zipファイルを作成する
生成されたプラグインファイルを**フォルダに入れないで直接**zipファイルに圧縮します。
zipファイルは32bitと64bitを別々にする必要があります。

圧縮したらzipファイル名を**プラグインのdllの名前と同じ名前**にします。

### SHA-256ファイルハッシュを作成する
作成したそれぞれのzipファイルのSHA-256ファイルハッシュを作成します。

### JSONファイルを作成する
プラグインの情報を記述したJSONファイルを作成します。
[nppPluginList](https://github.com/notepad-plus-plus/nppPluginList)のレポジトリからJSONファイルをダウンロードします。
JSONファイルの役割は以下のようになっています。

- [pl.x86.json](https://github.com/notepad-plus-plus/nppPluginList/blob/master/src/pl.x86.json)(32bit)
- [pl.x64.json](https://github.com/notepad-plus-plus/nppPluginList/blob/master/src/pl.x64.json)(64bit)

JSONファイルをダウンロードしたらあなたのプラグインの情報を追記します。

| 項目 | 説明 |
| --- | --- |
| folder-name | Notepad++のpluginフォルダ以下に作成するフォルダの名前。**プラグインのdllの名前と同じである必要があります。他のプラグインのfolder-nameと重複してもいけません。** |
| display-name | プラグインの名前 |
| version | プラグインのバージョン |
| id | zipファイルのSHA-256ハッシュ |
| repository | プラグインのバージョンに対応したダウンロードURI |
| description | プラグインの概要 |
| author | プラグイン作成者 |
| homepage | プラグインのホームページ |

### テストする
JSONファイルを作成したらデバッグ用のNotepad++でテストします。
デバッグ用のファイルをダウンロードします。

- [Notepad++.exe 32bit debug](https://notepad-plus-plus.org/assets/pluginListTestTools/npp.debug.x32.zip)
- [Notepad++.exe 64bit debug](https://notepad-plus-plus.org/assets/pluginListTestTools/npp.debug.x64.zip)
- [wingup 32bit](https://notepad-plus-plus.org/assets/pluginListTestTools/wingup.release.x64.zip)
- [wingup 64bit](https://notepad-plus-plus.org/assets/pluginListTestTools/wingup.release.x64.zip)

ダウンロードしたファイルと生成したJSONファイルをNotepad++のフォルダに配置します。

| 名前 | 配置する場所 | 操作 |
| --- | --- | --- |
| notepad++.exe | Notepad++をインストールしたフォルダ | notepad++.exeをデバッグ用のnotepad++.exeに置き換える。 |
| GUP.exe | updaterフォルダ | GUP.exeをデバッグ用のGUP.exeに置き換える。 |
| nppPluginList.json | plugins/configフォルダ | pl.x64.jsonかpl.x86.jsonをnppPluginList.jsonへとリネームする。 |

配置したらNotepad++を起動してJSONファイルが正しいかどうかをチェックします。
「プラグイン」→「プラグイン管理」からあなたのプラグインが追加されているかどうかを見てみましょう。

### プルリクエストを送る
JSONファイルに問題がないことが確認できたら、[nppPluginList](https://github.com/notepad-plus-plus/nppPluginList)にプルリクエストを送ります。
リクエストが承認されるのを待ちましょう。

## 寄付
このプロジェクトでは開発継続のための寄付を募っています。
詳細は以下のサイトを参考にしてください。

https://dokutoku.gitlab.io/donation/donation-ja.html

## プロジェクトのステータス
私は非常に多くの時間を[NPP API](https://gitlab.com/dokutoku/npp-api)と[RDMD for Notepadd++](https://gitlab.com/dokutoku/rdmd-for-npp)の開発に費やしました。そして自分が欲しかった機能を実装することができました。

なので寄付がなければこのまま開発を停止する予定です。

## プラグイン製作の参考になりそうなサイト
- [Plugin Development](https://web.archive.org/web/20190717193010/http://docs.notepad-plus-plus.org/index.php?title=Plugin_Development)
- [Plugin Development | Notepad++ Community](https://community.notepad-plus-plus.org/category/5/plugin-development)
- [Introduction | Notepad++ User Manual](https://npp-user-manual.org)
