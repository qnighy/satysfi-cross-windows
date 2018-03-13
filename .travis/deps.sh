#!/bin/bash
set -uexv

if [[ "$SATYSFI_TARGET" = "windows32" ]]; then
  ARCH="i686-w64-mingw32"
  OCAMLVER="4.06.1+32bit"
elif [[ "$SATYSFI_TARGET" = "windows64" ]]; then
  ARCH="x86_64-w64-mingw32"
  OCAMLVER="4.06.1"
else
  echo "Error: unknown \$SATYSFI_TARGET = $SATYSFI_TARGET" >&2
fi

cat >$HOME/bin/$ARCH-gcc <<EOD
#!/bin/sh
/usr/bin/$ARCH-gcc -L/usr/local/$ARCH/lib -I/usr/local/$ARCH/include "$@"
EOD
chmod +x $HOME/bin/$ARCH-gcc

wget https://raw.github.com/ocaml/opam/master/shell/opam_installer.sh -O - | sh -s $HOME/bin $OCAMLVER
cat >> ~/.ocamlinit <<EOD
let () =
  try Topdirs.dir_directory (Sys.getenv "OCAML_TOPLEVEL_PATH")
  with Not_found -> ()
;;
EOD
eval `opam config env`
echo '. "$HOME/.opam/opam-init/init.sh" > /dev/null 2> /dev/null || true' >> ~/.bash_profile

opam update
opam install -y opam-installer



wget "https://download.sourceforge.net/libpng/zlib-1.2.11.tar.gz"
wget "https://download.sourceforge.net/libpng/libpng-1.6.34.tar.gz"
wget "http://www.ijg.org/files/jpegsrc.v9c.tar.gz"
wget "http://www.bzip.org/1.0.6/bzip2-1.0.6.tar.gz"
wget "https://download.savannah.gnu.org/releases/freetype/freetype-2.9.tar.gz"

# export LDFLAGS="-L$HOME/$ARCH/lib"
# export CPPFLAGS="-I$HOME/$ARCH/include"
export LDFLAGS=""
export CPPFLAGS=""
unset CC
unset LD

tar zxf "zlib-1.2.11.tar.gz"
cd "zlib-1.2.11"
# make -f win32/Makefile.gcc PREFIX="$ARCH-" BINARY_PATH="$HOME/$ARCH/bin" INCLUDE_PATH="$HOME/$ARCH/include" LIBRARY_PATH="$HOME/$ARCH/lib"
# make install -f win32/Makefile.gcc PREFIX="$ARCH-" BINARY_PATH="$HOME/$ARCH/bin" INCLUDE_PATH="$HOME/$ARCH/include" LIBRARY_PATH="$HOME/$ARCH/lib"
make -f win32/Makefile.gcc PREFIX="$ARCH-" BINARY_PATH="/usr/local/$ARCH/bin" INCLUDE_PATH="/usr/local/$ARCH/include" LIBRARY_PATH="/usr/local/$ARCH/lib"
sudo make install -f win32/Makefile.gcc PREFIX="$ARCH-" BINARY_PATH="/usr/local/$ARCH/bin" INCLUDE_PATH="/usr/local/$ARCH/include" LIBRARY_PATH="/usr/local/$ARCH/lib"
cd ..

tar zxf "libpng-1.6.34.tar.gz"
cd "libpng-1.6.34"
# ./configure --prefix="$HOME/$ARCH" --host=$ARCH
# make
# make install
./configure --prefix="/usr/local/$ARCH" --host=$ARCH
make
sudo make install
cd ..

tar zxf "jpegsrc.v9c.tar.gz"
cd "jpeg-9c"
# ./configure --prefix="$HOME/$ARCH" --host=$ARCH
# make
# make install
./configure --prefix="/usr/local/$ARCH" --host=$ARCH
make
sudo make install
cd ..

tar zxf "bzip2-1.0.6.tar.gz"
cd "bzip2-1.0.6"
patch -p1 < ../.travis/bzip2-mingw-cross.patch
# make libbz2.a bzip2 bzip2recover PREFIX="$HOME/$ARCH" CC="$ARCH-gcc" AR="$ARCH-ar" RANLIB="$ARCH-ranlib"
# make install PREFIX="$HOME/$ARCH" CC="$ARCH-gcc" AR="$ARCH-ar" RANLIB="$ARCH-ranlib"
make libbz2.a bzip2 bzip2recover PREFIX="/usr/local/$ARCH" CC="$ARCH-gcc" AR="$ARCH-ar" RANLIB="$ARCH-ranlib"
sudo make install PREFIX="/usr/local/$ARCH" CC="$ARCH-gcc" AR="$ARCH-ar" RANLIB="$ARCH-ranlib"
cd ..

tar zxf "freetype-2.9.tar.gz"
cd "freetype-2.9"
# ./configure --prefix="$HOME/$ARCH" --host=$ARCH
# make
# make install
./configure --prefix="/usr/local/$ARCH" --host=$ARCH
make
sudo make install
cd ..
