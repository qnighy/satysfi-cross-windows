#!/bin/bash
set -uexv

opam repository -y add windows ./opam-cross-windows
opam repository -y add satysfi-aux ./opam-aux
opam pin -y add satysfi-windows .
