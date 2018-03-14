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
  RELEASE_NAME=satysfi32
  GCC_EXCEPTION_TYPE=sjlj
else
  RELEASE_NAME=satysfi64
  GCC_EXCEPTION_TYPE=seh
fi

mkdir "$RELEASE_NAME"
cp "$HOME/.opam/$OCAMLVER/windows-sysroot/bin/satysfi" "$RELEASE_NAME/satysfi.exe"
cp "/usr/lib/mxe/usr/$ARCH.shared/bin/libjpeg-9.dll" "$RELEASE_NAME/"
cp "/usr/lib/mxe/usr/$ARCH.shared/bin/libgcc_s_$GCC_EXCEPTION_TYPE-1.dll" "$RELEASE_NAME/"

cp -r licenses "$RELEASE_NAME/"

zip -r "$RELEASE_NAME.zip" "$RELEASE_NAME"
