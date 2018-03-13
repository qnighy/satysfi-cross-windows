#!/bin/bash
set -uex

. "$HOME/.opam/opam-init/init.sh" > /dev/null 2> /dev/null || true

opam repository -y add windows ./opam-cross-windows
opam repository -y add satysfi-aux ./opam-aux
opam pin -y add satysfi-windows .
