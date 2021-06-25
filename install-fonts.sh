#!/usr/bin/env bash

SARASA_VER='0.32.6'
SARASA_FILE="sarasa-gothic-ttf-$SARASA_VER"
SARASA_URL="https://github.com/be5invis/Sarasa-Gothic/releases/download/v$SARASA_VER/$SARASA_FILE.7z"
cd /tmp
wget "$SARASA_URL"
7z x "$SARASA_FILE.7z"

if [ $(id -u) -eq 0 ]; then
    DESTIN_DIR='/usr/share/fonts/truetype/sarasa-gothic/'
else
    DESTIN_DIR='~/.fonts'
fi

mkdir -p "$DESTIN_DIR"
mv sarasa-*-j-*.ttf "$DESTIN_DIR"
rm -rf sarasa-*
