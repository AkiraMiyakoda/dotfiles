#!/usr/bin/env bash

if [ $(id -u) -ne 0 ]; then
    echo "Sudo requred."
    exit 1
fi

SARASA_VER='0.32.10'
SARASA_FILE="sarasa-gothic-ttf-$SARASA_VER"
SARASA_URL="https://github.com/be5invis/Sarasa-Gothic/releases/download/v$SARASA_VER/$SARASA_FILE.7z"
cd /tmp
wget "$SARASA_URL"
7z x "$SARASA_FILE.7z"

DESTIN_DIR='/usr/share/fonts/truetype/sarasa-gothic/'

mkdir -p "$DESTIN_DIR"
mv sarasa-*-j-*.ttf "$DESTIN_DIR"
rm -rf sarasa-*
