#!/bin/bash
set -uexv

. .travis/common.sh

opam repository -y add satysfi-aux ./opam-aux
if [[ "$SATYSFI_TARGET" = "native" ]]; then
  opam pin -y add satysfi ./SATySFi
else
  opam pin -y add satysfi-windows .
fi
