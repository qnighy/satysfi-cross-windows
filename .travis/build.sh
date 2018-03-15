#!/bin/bash
set -uexv

. .travis/common.sh

cd SATySFi
patch -p1 < ../files/patches/otfm-dev-null-windows.patch
patch -p1 < ../files/patches/win32-userprofile.patch
cd ..

opam repository -y add satysfi-aux ./opam-aux
opam pin -y add satysfi-windows .

if [[ "$SATYSFI_TARGET" = "windows32" ]]; then
  RELEASE_NAME=satysfi32
  GCC_EXCEPTION_TYPE=sjlj
else
  RELEASE_NAME=satysfi64
  GCC_EXCEPTION_TYPE=seh
fi

mkdir "$RELEASE_NAME"
cp "$HOME/.opam/$OCAMLVER/windows-sysroot/bin/satysfi" "$RELEASE_NAME/satysfi.exe"
cp "/usr/lib/mxe/usr/$ARCH.shared/bin/libjpeg-9.dll" "$RELEASE_NAME/"
cp "/usr/lib/mxe/usr/$ARCH.shared/bin/libgcc_s_$GCC_EXCEPTION_TYPE-1.dll" "$RELEASE_NAME/"

cp -r licenses "$RELEASE_NAME/"
cp -r SATySFi/lib-satysfi "$RELEASE_NAME/"
rm "$RELEASE_NAME/lib-satysfi/dist/fonts/.gitkeep"
cp \
  /usr/share/fonts/opentype/ipaexfont-mincho/ipaexm.ttf \
  /usr/share/fonts/opentype/ipaexfont-gothic/ipaexg.ttf \
  /usr/share/texmf/fonts/opentype/public/lm/lmroman10-regular.otf \
  /usr/share/texmf/fonts/opentype/public/lm/lmroman10-italic.otf \
  /usr/share/texmf/fonts/opentype/public/lm/lmmono10-regular.otf \
  /usr/share/texmf/fonts/opentype/public/lm/lmsans10-regular.otf \
  /usr/share/fonts/truetype/junicode/Junicode.ttf \
  /usr/share/fonts/truetype/junicode/Junicode-Italic.ttf \
  /usr/share/texlive/texmf-dist/fonts/opentype/public/lm-math/latinmodern-math.otf \
  "$RELEASE_NAME/lib-satysfi/dist/fonts/"

cp -r SATySFi/demo "$RELEASE_NAME/"

zip -r "$RELEASE_NAME.zip" "$RELEASE_NAME"

cd installer
makensis $RELEASE_NAME.nsi
mv $RELEASE_NAME-installer.exe ..
cd ..
