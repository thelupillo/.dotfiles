#!/bin/bash

echo ${@}

DOTFILES_DIRECTORY=${HOME}/.dotfiles
DOTSCRIPTS_DIRECTORY=${DOTFILES_DIRECTORY}/.scripts
LIB_FILE=${DOTSCRIPTS_DIRECTORY}/lib.sh
if [ -f $LIB_FILE ]; then
	. $LIB_FILE
fi

PROGRAMS_FOLDER="${DOTSCRIPTS_DIRECTORY}/programs"

for program in $(ls ${PROGRAMS_FOLDER}); do
	#echo $(getInstallCommand) $(${PROGRAMS_FOLDER}/${program})
	PROGRAMS2INSTALL+=" $(${PROGRAMS_FOLDER}/${program})"
done

if [[ -n $PROGRAMS2INSTALL ]]; then
	echo $(getInstallCommand)${PROGRAMS2INSTALL[*]}
fi
