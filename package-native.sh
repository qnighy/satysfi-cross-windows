#!/bin/bash
set -ue

eval `opam config env`

mkdir -p "$HOME/.satysfi"
cp -r SATySFi/lib-satysfi/* "$HOME/.satysfi"
cp \
  /usr/share/fonts/opentype/ipaexfont-mincho/ipaexm.ttf \
  /usr/share/fonts/opentype/ipaexfont-gothic/ipaexg.ttf \
  /usr/share/texmf/fonts/opentype/public/lm/lmroman10-regular.otf \
  /usr/share/texmf/fonts/opentype/public/lm/lmroman10-bold.otf \
  /usr/share/texmf/fonts/opentype/public/lm/lmroman10-italic.otf \
  /usr/share/texmf/fonts/opentype/public/lm/lmmono10-regular.otf \
  /usr/share/texmf/fonts/opentype/public/lm/lmsans10-regular.otf \
  /usr/share/fonts/truetype/junicode/Junicode.ttf \
  /usr/share/fonts/truetype/junicode/Junicode-Bold.ttf \
  /usr/share/fonts/truetype/junicode/Junicode-Italic.ttf \
  /usr/share/texmf/fonts/opentype/public/lm-math/latinmodern-math.otf \
  /usr/share/texlive/texmf-dist/fonts/opentype/public/Asana-Math/Asana-Math.otf \
  "$HOME/.satysfi/dist/fonts/"
  # /usr/share/texlive/texmf-dist/fonts/opentype/public/lm-math/latinmodern-math.otf \

mv "$HOME/.satysfi/dist/fonts/Asana-Math.otf" "$HOME/.satysfi/dist/fonts/Asana-math.otf"

rm -rf satysfi-doc satysfi-doc.zip
cp -r SATySFi/doc satysfi-doc
make -C satysfi-doc all lang
zip -r satysfi-doc.zip satysfi-doc

rm -rf satysfi-demo-src satysfi-demo-src.zip
cp -r SATySFi/demo satysfi-demo-src
zip -r satysfi-demo-src.zip satysfi-demo-src
