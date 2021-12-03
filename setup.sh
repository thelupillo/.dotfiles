#!/bin/bash

set -ex

DOTFILES_DIRECTORY=${HOME}/.dotfiles
DOTSCRIPTS_DIRECTORY=${DOTFILES_DIRECTORY}/.scripts
LIB_FILE=${DOTSCRIPTS_DIRECTORY}/lib.sh
if [ -f $LIB_FILE ]; then
	. $LIB_FILE
fi

DOTFILES_PROGRAMS=("bash" "git" "ssh" "vim")
BASE_PROGRAMS=("stow" "${DOTFILES_PROGRAMS[@]}")

echo "Installing base programs..."
${DOTSCRIPTS_DIRECTORY}/install.sh ${BASE_PROGRAMS[@]}

echo "Stow dot files..."
${DOTSCRIPTS_DIRECTORY}/stow.sh ${DOTFILES_PROGRAMS[@]}

