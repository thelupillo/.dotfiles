#!/bin/bash

DOTFILES_DIRECTORY=${HOME}/.dotfiles
DOTSCRIPTS_DIRECTORY=${DOTFILES_DIRECTORY}/.scripts
LIB_FILE=${DOTSCRIPTS_DIRECTORY}/lib.sh
if [ -f $LIB_FILE ]; then
	. $LIB_FILE
fi

if [ $(isProgramInstalled stow) -eq 0 ]; then
	${DOTSCRIPTS_DIRECTORY}/install.sh stow	
fi

for dotfile in ${@}; do
	echo "stow $dotfile"
	#stow $dotfile
done
