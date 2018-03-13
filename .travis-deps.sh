#!/bin/bash
set -ue

if [[ "$SATYSFI_TARGET" = "windows32" ]]; then
  ARCH=i686-w64-mingw32
elif [[ "$SATYSFI_TARGET" = "windows64" ]]; then
  ARCH=x86_64-w64-mingw32
else
  echo "Error: unknown \$SATYSFI_TARGET = $SATYSFI_TARGET" >&2
fi

wget https://raw.github.com/ocaml/opam/master/shell/opam_installer.sh -O - | sh -s $HOME/bin
if [[ "$SATYSFI_TARGET" = "windows32" ]]; then
  opam switch "4.06.1+32bit"
else
  opam switch "4.06.1"
fi
opam update
