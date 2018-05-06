#!/bin/bash
set -uexv

. .travis/common.sh

opam repository -y add satysfi-aux ./opam-aux
opam pin -y add satysfi-windows .
