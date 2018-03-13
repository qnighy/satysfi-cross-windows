#!/bin/bash
set -uexv

. .travis/common.sh

wget https://raw.github.com/ocaml/opam/master/shell/opam_installer.sh -O - | sudo sh -s /usr/local/bin $OCAMLVER
/usr/local/bin/opam init --comp $OCAMLVER
cat >> ~/.ocamlinit <<EOD
let () =
  try Topdirs.dir_directory (Sys.getenv "OCAML_TOPLEVEL_PATH")
  with Not_found -> ()
;;
EOD
eval `opam config env`
echo '. "$HOME/.opam/opam-init/init.sh" > /dev/null 2> /dev/null || true' >> ~/.bash_profile

opam update
