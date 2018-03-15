#!/bin/bash
set -ue
RELEASE_NAME="$1"

cd installer
find "../$RELEASE_NAME" -type f -printf '%P\n' | sort -r | sed -e 's|/|\\|g' | sed -e 's/.*/Delete "$INSTDIR\\&"/' > remove-list.nsh
find "../$RELEASE_NAME" -type d -printf '%P\n' | sort -r | sed -e 's|/|\\|g' | grep . | sed -e 's/.*/RmDir "$INSTDIR\\&"/' >> remove-list.nsh
makensis $RELEASE_NAME.nsi
