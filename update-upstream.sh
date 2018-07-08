#!/usr/bin/env bash
set -ue
set -o pipefail

OTFM_REPO=https://github.com/gfngfn/otfm.git
CAMLPDF_REPO=https://github.com/gfngfn/camlpdf.git

otfm_rev=$(git ls-remote $OTFM_REPO master | cut -f 1)
camlpdf_rev=$(git ls-remote $CAMLPDF_REPO master | cut -f 1)

echo "git: \"$OTFM_REPO#$otfm_rev\"" > opam-aux/packages/otfm.0.3.0+satysfi/url
echo "git: \"$OTFM_REPO#$otfm_rev\"" > opam-aux/packages/otfm-windows.0.3.0+satysfi/url
echo "git: \"$CAMLPDF_REPO#$camlpdf_rev\"" > opam-aux/packages/camlpdf.2.2.1+satysfi/url
echo "git: \"$CAMLPDF_REPO#$camlpdf_rev\"" > opam-aux/packages/camlpdf-windows.2.2.1+satysfi/url

cd SATySFi
git fetch origin
git checkout origin/master
cd ..
