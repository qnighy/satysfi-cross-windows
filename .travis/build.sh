#!/bin/bash
set -uexv

. .travis/common.sh

opam repository -y add windows ./opam-cross-windows
opam install -y ocaml-windows

cat >$HOME/.opam/$OCAMLVER/windows-sysroot/bin/ocamlmklib <<EOD
#!/bin/sh
$HOME/.opam/$OCAMLVER/bin/ocamlrun "$HOME/.opam/$OCAMLVER/windows-sysroot/bin/ocamlmklib.exe" -L/usr/local/$ARCH/lib "\$@"
EOD

# export LDFLAGS="-L$HOME/$ARCH/lib"
# export CPPFLAGS="-I$HOME/$ARCH/include"
export LDFLAGS=""
export CPPFLAGS=""

cd SATySFi
patch -p1 < ../files/patches/otfm-dev-null-windows.patch
patch -p1 < ../files/patches/win32-userprofile.patch
cd ..

opam repository -y add satysfi-aux ./opam-aux
opam pin -y add satysfi-windows .
