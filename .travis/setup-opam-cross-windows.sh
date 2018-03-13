#!/bin/bash
set -uexv

. .travis/common.sh

opam repository -y add windows ./opam-cross-windows
opam pin -y add topkg https://github.com/whitequark/topkg.git

if [[ "$SATYSFI_TARGET" = "windows32" ]]; then
  TOOLPREF32=/usr/lib/mxe/usr/bin/i686-w64-mingw32.static- opam install -y conf-gcc-windows32
else
  TOOLPREF64=/usr/lib/mxe/usr/bin/x86_64-w64-mingw32.static- opam install -y conf-gcc-windows64
fi

opam install -y opam-installer
opam install -y ocaml-windows
