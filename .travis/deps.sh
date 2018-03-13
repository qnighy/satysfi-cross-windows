#!/bin/bash
set -uexv

. .travis/common.sh

cat >$HOME/bin/$ARCH-gcc <<EOD
#!/bin/sh
/usr/bin/$ARCH-gcc -L/usr/local/$ARCH/lib -I/usr/local/$ARCH/include "\$@"
EOD
cat >$HOME/bin/$ARCH-ld <<EOD
#!/bin/sh
/usr/bin/$ARCH-ld -L/usr/local/$ARCH/lib "\$@"
EOD
chmod +x $HOME/bin/$ARCH-gcc
chmod +x $HOME/bin/$ARCH-ld

opam install -y opam-installer



wget "https://download.sourceforge.net/libpng/zlib-1.2.11.tar.gz"
wget "https://download.sourceforge.net/libpng/libpng-1.6.34.tar.gz"
wget "http://www.ijg.org/files/jpegsrc.v9c.tar.gz"
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

tar zxf "freetype-2.9.tar.gz"
cd "freetype-2.9"
# ./configure --prefix="$HOME/$ARCH" --host=$ARCH --without-bzip2 --without-harfbuzz
# make
# make install
./configure --prefix="/usr/local/$ARCH" --host=$ARCH --without-bzip2 --without-harfbuzz
make
sudo make install
cd ..
