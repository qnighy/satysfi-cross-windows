#!/bin/bash
set -uexv

. .travis/common.sh

if [[ "$SATYSFI_TARGET" = "native" ]]; then
  bash -xv ./package-native.sh
else
  bash -xv ./package.sh
fi
