#!/bin/bash

SRC_DIR=$(cd $(dirname $0) && pwd)

AURORAE_DIR="$HOME/.local/share/aurorae/themes"
SCHEMES_DIR="$HOME/.local/share/color-schemes"
PLASMA_DIR="$HOME/.local/share/plasma/desktoptheme"
LOOKFEEL_DIR="$HOME/.local/share/plasma/look-and-feel"
LAYOUT_DIR="$HOME/.local/share/plasma/layout-templates"
KVANTUM_DIR="$HOME/.config/Kvantum"

THEME_NAME=ChromeOS

install() {
  local name=${1}

  mkdir -p                                                                           ${AURORAE_DIR}
  mkdir -p                                                                           ${SCHEMES_DIR}
  mkdir -p                                                                           ${PLASMA_DIR}
  mkdir -p                                                                           ${LOOKFEEL_DIR}
  mkdir -p                                                                           ${LAYOUT_DIR}
  mkdir -p                                                                           ${KVANTUM_DIR}

  cp -r ${SRC_DIR}/aurorae/*                                                         ${AURORAE_DIR}
  cp -r ${SRC_DIR}/color-schemes/*.colors                                            ${SCHEMES_DIR}
  cp -r ${SRC_DIR}/Kvantum/*                                                         ${KVANTUM_DIR}
  cp -r ${SRC_DIR}/plasma/desktoptheme/*                                             ${PLASMA_DIR}
  cp -r ${SRC_DIR}/plasma/layout-templates/*                                         ${LAYOUT_DIR}
  cp -r ${SRC_DIR}/color-schemes/${name}Dark.colors                                  ${PLASMA_DIR}/${name}/colors
  cp -r ${SRC_DIR}/color-schemes/${name}Light.colors                                 ${PLASMA_DIR}/${name}-light/colors
  cp -r ${SRC_DIR}/plasma/look-and-feel/*                                            ${LOOKFEEL_DIR}
}

echo "Installing '${THEME_NAME} kde themes'..."

install "${name:-${THEME_NAME}}"

echo "Install finished..."
