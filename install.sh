#!/bin/bash
#
# Script for automatic copy of files
#

PWD=$(pwd)

copy () {
    if 
    if [ -e $HOME/.$1 ]; then
	mv $HOME/.$1 $HOME/.$1.old."$(date +%d%m%y)"
    else
	cp -a $1 $HOME/.$1
    fi
}

error () {
    if (($?)); then
	echo "Something went wrong with $1"
	echo "exiting..."
	exit 1
    fi;
}

cd emacs
# coyping emacs
copy emacs
error emacs

copy emacs.d
error emacs.d

cd ..
# coyping Xressources
copy Xressources
error Xressources

# coyping Xmodmap
copy Xmodmap
error Xmodmap


# coyping mutt files
cd mail
## copying muttrc
copy muttrc
error muttrc

## copying mutt directory
copy mutt
 error mutt

## copying msmtprc
copy msmtprc
error msmtprc

## copying fetchmailrc
copy fetchmailrc
error fetchmailrc
chmod 600 $HOME/.fetchmailrc

## copying procmailrc
copy procmailrc
error procmailrc
chmod 600 $HOME/.procmailrc

# create Mail directory
mkdir -p $HOME/Mail/{gmail,ent,lapost,autre,insight,hotmail}/{cur,tmp,new}
error Mail_directory_main
mkdir -p $HOME/Mail/gmail/gut/{tmp,new,cur}
error Mail_directory_gut

# going up
cd ..

# copying zsh files
cd zsh

## copying zshrc
copy mainfile zshrc #zshrc
error zshrc

## copying zsh
copy main zsh #zshrc
error zsh


## copying dir_colors
copy dir_colors
error dir_colors

#going up

cd ..


echo "You should edit $HOME/.fetchmailrc, $HOME/.procmailrc and $HOME/.msmtprc"

exit 0



