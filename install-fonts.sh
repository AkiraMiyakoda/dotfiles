#!/usr/bin/env bash

if [ $(id -u) -ne 0 ]; then
    echo "Sudo requred."
    exit 1
fi

# Install Sarasa Gothic

SARASA_VER='0.32.14'
SARASA_FILE="sarasa-gothic-ttf-${SARASA_VER}.7z"
SARASA_URL="https://github.com/be5invis/Sarasa-Gothic/releases/download/v${SARASA_VER}/${SARASA_FILE}"

cd /tmp
wget "${SARASA_URL}"
7z x "${SARASA_FILE}"

DESTIN_DIR='/usr/share/fonts/truetype/sarasa-gothic/'

mkdir -p "${DESTIN_DIR}"
mv ./sarasa-*-j-*.ttf "${DESTIN_DIR}"
rm "${SARASA_FILE}"
rm ./sarasa-*

# Install IBM Plex Sans JP

PLEX_VER='5.2.1'
PLEX_FILE='TrueType.zip'
PLEX_URL="https://github.com/IBM/plex/releases/download/v${PLEX_VER}/${PLEX_FILE}"

wget "${PLEX_URL}"
7z x "${PLEX_FILE}"

DESTIN_DIR='/usr/share/fonts/truetype/plex/'

mkdir -p "$DESTIN_DIR"
mv ./TrueType/IBM-Plex-Sans-JP/hinted/*.ttf "$DESTIN_DIR"
rm "${PLEX_FILE}"
rm -rf ./TrueType

# Refresh font cache

fc-cache -f -v
