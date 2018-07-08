#!/bin/bash
set -uexv

. .travis/common.sh

if [[ "$SATYSFI_TARGET" = "native" ]]; then
  exit
fi

echo "deb http://pkg.mxe.cc/repos/apt/debian wheezy main" | sudo tee \
   /etc/apt/sources.list.d/mxeapt.list
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys D43A795B73B16ABE9643FE1AFD8FFF16DB45C6AB
sudo apt update
sudo apt install mxe-{x86-64,i686}-w64-mingw32.shared-{gcc,libpng,jpeg,freetype}
