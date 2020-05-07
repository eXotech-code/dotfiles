#!/bin/sh
echo Installing git, stow and sudo
pacman --noconfirm -Syu && pacman --noconfirm -S sudo git stow
echo Installing all dependencies...
sudo pacman --needed --noconfirm -S $( cat requirements.txt )

