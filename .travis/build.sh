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
  cp /usr/lib/mxe/usr/i686-w64-mingw32.shared/bin/{libjpeg-9.dll,libgcc_s_sjlj-1.dll} satysfi32/
  zip -r satysfi32.zip satysfi32
else
  mkdir satysfi64
  cp $HOME/.opam/$OCAMLVER/windows-sysroot/bin/satysfi satysfi64/satysfi.exe
  cp /usr/lib/mxe/usr/x86_64-w64-mingw32.shared/bin/{libjpeg-9.dll,libgcc_s_seh-1.dll} satysfi64/
  zip -r satysfi64.zip satysfi64
fi
