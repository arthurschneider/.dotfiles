#!/bin/bash

set -euo pipefail
IFS=$'\n\t'

#/ Usage: just start the script. You will be asked to put in your root password. Do it!
#/
#/ Description: This script will install some packages or download some software.
#/
#/ Examples: -
#/
#/ Options:
#/    --help: Display this help message
usage() { grep '^#/' "$0" | cut -c4- ; exit 0; }
expr "$*" : ".*--help" > /dev/null && usage


readonly LOG_FILE="./$(basename "$0").log"
info()    { echo "[INFO]    $*" | tee -a "$LOG_FILE" >&2 ; }
warning() { echo "[WARNING] $*" | tee -a "$LOG_FILE" >&2 ; }
error()   { echo "[ERROR]   $*" | tee -a "$LOG_FILE" >&2 ; }
fatal()   { echo "[FATAL]   $*" | tee -a "$LOG_FILE" >&2 ; exit 1 ; }

####################################################################################################
####################################################################################################
####################################################################################################

USER="arthur"

install_package(){
    echo ""
    echo "INSTALING $1 AND SETTING IT UP...!"
    echo ""
    sleep 1
    sudo apt-get install -y "$2"
}

install_ranger(){
  sudo apt update
  sudo apt install ranger caca-utils highlight atool w3m poppler-utils mediainfo

  ranger&
  kill -9 $(pgrep ranger)
  ranger --copy-config=all
}

echo "Starting the Setup ...!"

sudo apt-get update; sudo apt-get upgrade -f -y --force-yes

install_package FIREFOX firefox

install_package THUNDERBIRD thunderbird

install_package KEEPASS keepassx

install_package TMUX tmux

install_package CURL curl

install_package XDG-UTILS xdg-utils

install_package VIM vim

install_package VIM-GTK vim-gtk

install_package ZSH zsh

install_package GIT git

install_package HTOP htop

install_package NCDU ncdu

install_package DROPBOX nautilus-dropbox

install_package WORKBENCH mysql-workbench

install_package DMENU dmenu

install_package GIT_FLOW git-flow

install_package NMAP nmap

chsh -s /bin/zsh
chsh -s /bin/zsh $USER

sudo npm install --global trash-cli

install_ranger

echo ""
echo "PACKAGES THAT ARE NOT NEEDED ANYMORE WILL BE REMOVED"
echo ""
sleep 1
sudo apt-get autoremove
sudo apt-get autoclean

