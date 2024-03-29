#!/usr/bin/env bash

if [ $(id -u) -ne 0 ]; then
    echo "Sudo required."
    exit 1
fi

# Install required tool and my favorite font packages

apt install -y p7zip-full fonts-mplus fonts-cascadia-code

# Install Sarasa Gothic

SARASA_VER="1.0.0"
SARASA_FILE="Sarasa-TTF-${SARASA_VER}.7z"
SARASA_URL="https://github.com/be5invis/Sarasa-Gothic/releases/download/v${SARASA_VER}/${SARASA_FILE}"

cd /tmp
wget "${SARASA_URL}"
7z x "${SARASA_FILE}"

DESTIN_DIR="/usr/share/fonts/truetype/sarasa-gothic/"

mkdir -p "${DESTIN_DIR}"
mv ./Sarasa*J-*.ttf "${DESTIN_DIR}"
rm "${SARASA_FILE}"
rm ./sarasa-*

# Install IBM Plex Sans JP

PLEX_VER="6.3.0"
PLEX_FILE="TrueType.zip"
PLEX_URL="https://github.com/IBM/plex/releases/download/v${PLEX_VER}/${PLEX_FILE}"

wget "${PLEX_URL}"
7z x "${PLEX_FILE}"

DESTIN_DIR="/usr/share/fonts/truetype/plex/"

mkdir -p "$DESTIN_DIR"
mv ./TrueType/IBM-Plex-Sans-JP/hinted/*.ttf "$DESTIN_DIR"
rm "${PLEX_FILE}"
rm -rf ./TrueType

# Install MPlus nerd

NERD_VER="3.0.2"
MPLUS_NERD_FILE="MPlus.zip"
MPLUS_NERD_URL="https://github.com/ryanoasis/nerd-fonts/releases/download/v${NERD_VER}/${MPLUS_NERD_FILE}"

wget "${MPLUS_NERD_URL}"
7z x "${MPLUS_NERD_FILE}" -oMPlus

DESTIN_DIR="/usr/share/fonts/truetype/mplus-nerd/"

mkdir -p "$DESTIN_DIR"
mv ./MPlus/*.ttf "$DESTIN_DIR"
rm "${MPLUS_NERD_FILE}"
rm -rf ./MPlus

# Refresh font cache

fc-cache -f -v
