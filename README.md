# SATySFi on Windows

[![Build Status](https://travis-ci.org/qnighy/satysfi-cross-windows.svg?branch=master)](https://travis-ci.org/qnighy/satysfi-cross-windows)

**[SATySFi](https://github.com/gfngfn/SATySFi)** is a new typesetting system with a static type system.

This repository provides **SATySFi for Windows**.

## Downloading

**SATySFi for Windows** is available at [releases page](https://github.com/qnighy/satysfi-cross-windows/releases).

## How to compile the demo document (after version 20180317)

1. Download SATySFi for Windows from [releases page](https://github.com/qnighy/satysfi-cross-windows/releases).
2. Extract the archive or run the installer.
3. If you didn't use the installer, do one of the following:
  - Set `%SATYSFI_RUNTIME%` environment variable to `path\to\satysfi\lib`.
  - Copy `satysfi\lib` directory to `%userprofile%\.satysfi`. `%userprofile%` is typically `C:\Users\yourname`.
4. Copy `demo` directory to somewhere.
5. Prepare arbitrary JPEG image and copy it to `demo\satysfi-logo.jpg`.
6. Run `path\to\satysfi.exe demo.saty`. If you used the installer, `%PATH%` is automatically configured.
7. `demo.pdf` will be produced.

## How to compile the demo document (before version 20180315)

1. Download SATySFi for Windows from [releases page](https://github.com/qnighy/satysfi-cross-windows/releases).
2. Extract the archive or run the installer.
3. Copy `lib-satysfi` directory to `%userprofile%\.satysfi`. `%userprofile%` is typically `C:\Users\yourname`.
4. Copy `demo` directory to somewhere.
5. Prepare arbitrary JPEG image and copy it to `demo\satysfi-logo.jpg`.
6. Run `path\to\satysfi.exe demo.saty`.
7. `demo.pdf` will be produced.

## Compilation of SATySFi for Windows itself

If you want to compile SATySFi for Windows by your own, see `build-instructions.md` in this repository.

# SATySFi on Windows

**[SATySFi](https://github.com/gfngfn/SATySFi)**は、新しい組版処理システムとその言語です。

このリポジトリでは**Windows版SATySFi**を提供しています。

## ダウンロード

**SATySFi for Windows**は[リリースページ](https://github.com/qnighy/satysfi-cross-windows/releases)からダウンロードできます。

## デモ文書のコンパイル方法 (バージョン20180317以降)

1. SATySFi for Windowsを[リリースページ](https://github.com/qnighy/satysfi-cross-windows/releases)からダウンロードする。
2. アーカイブを展開するか、インストーラを実行する。
3. インストーラを使わなかった場合は以下のどちらかをする。
  - 環境変数 `%SATYSFI_RUNTIME%` を `適切な\パス\satysfi\lib` のように設定する。
  - `satysfi\lib` ディレクトリを `%userprofile%\.satysfi` にコピーする。 `%userprofile%` は通常、 `C:\Users\名前` のようなディレクトリを指しています。
4. `demo` ディレクトリをどこかにコピーする。
5. 何でもいいのでJPEG画像を用意し、 `demo\satysfi-logo.jpg` にコピーする。
6. `適切な\パス\satysfi.exe demo.saty` を実行する。インストーラーを使った場合は、 `%PATH%` が自動的に設定されているはずです。
7. `demo.pdf` が生成されます。

## デモ文書のコンパイル方法 (バージョン20180315以前)

1. SATySFi for Windowsを[リリースページ](https://github.com/qnighy/satysfi-cross-windows/releases)からダウンロードする。
2. アーカイブを展開するか、インストーラを実行する。
3. `lib-satysfi` ディレクトリを `%userprofile\.satysfi` にコピーする。 `%userprofile%` は通常、 `C:\Users\名前` のようなディレクトリを指しています。
4. `demo` ディレクトリをどこかにコピーする。
5. 何でもいいのでJPEG画像を用意し、 `demo\satysfi-logo.jpg` にコピーする。
6. `適切な\パス\satysfi.exe demo.saty` を実行する。
7. `demo.pdf` が生成されます。

## SATySFi for Windows 自体のコンパイル

SATySFi for Windows自体を自分でビルドしたい場合は、このリポジトリ内の `build-insructions.md` を参照してください。
