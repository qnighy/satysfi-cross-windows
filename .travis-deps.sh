#!/bin/bash
set -uexv

if [[ "$SATYSFI_TARGET" = "windows32" ]]; then
  ARCH="i686-w64-mingw32"
  OCAMLVER="4.06.1+32bit"
elif [[ "$SATYSFI_TARGET" = "windows64" ]]; then
  ARCH="x86_64-w64-mingw32"
  OCAMLVER="4.06.1"
else
  echo "Error: unknown \$SATYSFI_TARGET = $SATYSFI_TARGET" >&2
fi

wget https://raw.github.com/ocaml/opam/master/shell/opam_installer.sh -O - | sh -s $HOME/bin $OCAMLVER
cat >> ~/.ocamlinit <<EOD
let () =
  try Topdirs.dir_directory (Sys.getenv "OCAML_TOPLEVEL_PATH")
  with Not_found -> ()
;;
EOD
eval `opam config env`
echo '. "$HOME/.opam/opam-init/init.sh" > /dev/null 2> /dev/null || true' >> ~/.bash_profile

opam update
