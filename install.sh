#!/bin/sh
echo Starting dotfiles installation...
echo Checking operating system...
# later I will add support for other operating systems
system=$(( lsb_release -ds || cat /etc/*release || uname -om ) 2>/dev/null | head -n1)
if [ "$system" == "Manjaro Linux" ]
then
	echo Detected Manjaro
else
	echo kill
fi

