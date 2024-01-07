#!/bin/bash

if [ -z "$OBSIDIAN_VAULT" ]
then
	echo -e "\033[0;31mThe OBSIDIAN_VAULT variable is unset. Please set it to path to your Obsidian vault that you want to sync and try again."
	exit 1
fi

rsync -avP ubuntu@piskiewicz.org:~/Obsidian "$OBSIDIAN_VAULT"

