#!/bin/bash
set -uexv

. .travis/common.sh

cd SATySFi
patch -p1 < ../files/patches/otfm-dev-null-windows.patch
cd ..

opam repository -y add satysfi-aux ./opam-aux
opam pin -y add satysfi-windows .
