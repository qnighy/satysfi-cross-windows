# SATySFi on Windows

**[SATySFi](https://github.com/gfngfn/SATySFi)** is a new typesetting system with a static type system.

**SATySFi for Windows** is available at [releases page](https://github.com/qnighy/satysfi-cross-windows/releases).

# Crosscompiling SATySFi from Ubuntu to Windows

## Install MinGW-w64 crosscompiler, libpng, libjpeg and freetype

Here I use [MXE prebuilt repository](http://pkg.mxe.cc/). Alternatively, you can use [MXE (nonprebuilt)](http://mxe.cc/) or use crosscompiler from Ubuntu with your own libpng/libjpeg/freetype builds.

```sh
echo "deb http://pkg.mxe.cc/repos/apt/debian wheezy main" | sudo tee \
   /etc/apt/sources.list.d/mxeapt.list
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys D43A795B73B16ABE9643FE1AFD8FFF16DB45C6AB
sudo apt update
sudo apt install mxe-{x86-64,i686}-w64-mingw32.static-{gcc,libpng,jpeg,freetype}
```

# Install OPAM and OCaml 4.06.1

See [OPAM installation](https://opam.ocaml.org/doc/Install.html) for details.

```sh
sudo apt-get install build-essential git m4 unzip wget

# The following command will ask if you allow OPAM to modify some files (e.g. ~/.bash_profile).
# Be sure to read its instructions. Otherwise, some environment variables won't be set.
wget https://raw.github.com/ocaml/opam/master/shell/opam_installer.sh -O - | sh -s /usr/local/bin

opam switch 4.06.1
eval `opam config env`
opam update
```

# Install OCaml crosscompiler

See [opam-cross-windows](https://github.com/ocaml-cross/opam-cross-windows) for details.

```sh
opam repository add windows git://github.com/ocaml-cross/opam-cross-windows
TOOLPREF64=/usr/lib/mxe/usr/bin/x86_64-w64-mingw32.static- opam install conf-gcc-windows64
opam install opam-installer ocaml-windows
```

# Build SATySFi and its dependencies

```
git clone https://github.com/qnighy/satysfi-cross-windows.git --recursive
cd satysfi-cross-windows
opam repository add satysfi-aux ./opam-aux
opam pin add satysfi-windows .
```

You can find the generated binary in `~/.opam/4.06.1/windows-sysroot/bin/satysfi`.
