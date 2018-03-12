#!/bin/sh
set -ue

ocamlbuild -classic-display -use-ocamlfind src/ppx_deriving_main.native -plugin-tag 'package(cppo_ocamlbuild)'
rm _build/src/*.cm*
# ocamlbuild -use-ocamlfind -just-plugin -plugin-tag 'package(cppo_ocamlbuild)'
OCAMLFIND_TOOLCHAIN=windows ocaml pkg/build.ml native=true native-dynlink=true
sed -i.bak ppx_deriving.install -e '6a\
  "_build/src/ppx_deriving_main.native" {"ppx_deriving_main.native"}'
