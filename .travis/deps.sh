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
