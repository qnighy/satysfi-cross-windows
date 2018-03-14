#!/bin/bash
set -uexv

. .travis/common.sh

cd SATySFi
patch -p1 < ../files/patches/otfm-dev-null-windows.patch
patch -p1 < ../files/patches/win32-userprofile.patch
cd ..

opam repository -y add satysfi-aux ./opam-aux
opam pin -y add satysfi-windows .

if [[ "$SATYSFI_TARGET" = "windows32" ]]; then
  mkdir satysfi32
  cp $HOME/.opam/$OCAMLVER/windows-sysroot/bin/satysfi satysfi32/satysfi.exe
  zip -r satysfi32.zip satysfi32
else
  mkdir satysfi64
  cp $HOME/.opam/$OCAMLVER/windows-sysroot/bin/satysfi satysfi64/satysfi.exe
  zip -r satysfi64.zip satysfi64
fi
