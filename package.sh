#!/bin/bash
set -ue

eval `opam config env`

if opam switch show | grep '32bit' -q; then
  RELEASE_NAME=satysfi32
  GCC_EXCEPTION_TYPE=sjlj
else
  RELEASE_NAME=satysfi64
  GCC_EXCEPTION_TYPE=seh
fi

CROSS_PREFIX="$(opam config var conf-gcc-windows:c-lib)/.."

rm -rf "$RELEASE_NAME"
mkdir "$RELEASE_NAME"
cp $(ocamlfind -toolchain windows ocamlc -where)/../../bin/satysfi "$RELEASE_NAME/satysfi.exe"
cp "$CROSS_PREFIX/bin/libjpeg-9.dll" "$RELEASE_NAME/"
cp "$CROSS_PREFIX/bin/libgcc_s_$GCC_EXCEPTION_TYPE-1.dll" "$RELEASE_NAME/"

cp -r licenses "$RELEASE_NAME/"
cp -r SATySFi/lib-satysfi "$RELEASE_NAME/"
find "$RELEASE_NAME/lib-satysfi" -name '.git*' -exec rm '{}' '+'
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

installer/make-installer.sh "$RELEASE_NAME"
