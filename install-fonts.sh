#!/usr/bin/env bash

SARASA_VER='0.31.0'
SARASA_FILE="sarasa-gothic-ttf-$SARASA_VER"
SARASA_URL="https://github.com/be5invis/Sarasa-Gothic/releases/download/v$SARASA_VER/$SARASA_FILE.7z"
cd /tmp
wget "$SARASA_URL"
7z x "$SARASA_FILE.7z"

mkdir -p ~/.fonts
mv sarasa-*-j-*.ttf ~/.fonts
rm -rf sarasa-*
