#!/bin/bash

function getDistroId() {
	if [ -f /etc/os-release ]; then
		while read line; do
			if [[ $line == ID=* ]]; then
				readarray -d = -t ID_ARRAY <<< "$line"
				DISTRO_ID=${ID_ARRAY[1]}
				echo $DISTRO_ID
				return 0
			fi
		done < /etc/os-release
	fi
	return 1
}

function getInstallCommand() {
	INSTALL_COMMAND="NULL"

	case "$(getDistroId)" in
		"redhat" | "fedora" | "almalinux" | "rocky" )
			if [ "$(command -v dnf)" == "/usr/bin/dnf" ]; then
				INSTALL_COMMAND="dnf install"
			elif [ "$(command -v yum)" == "/usr/bin/yum" ]; then
				INSTALL_COMMAND="yum install"
			fi
			;;
		"debian" | "ubuntu" )
			if [ "$(command -v apt)" == "/usr/bin/apt" ]; then
				INSTALL_COMMAND="apt install"
			fi
			;;
	esac
	
	if [ "$INSTALL_COMMAND" == "NULL" ]; then
		return 1
	fi
	
	if [ "$(whoami)" != "root" ]; then
		INSTALL_COMMAND="sudo $INSTALL_COMMAND"
	fi
	
	echo $INSTALL_COMMAND

	return 0
}

function isProgramInstalled() {
	if [[ $(command -v $1) =~ (^(\/).+(\/${1})$) ]]; then
		echo 1
	else
		echo 0
	fi
}
