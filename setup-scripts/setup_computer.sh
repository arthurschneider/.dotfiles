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

echo "Starting the Setup ...!"

sudo apt-get update; sudo apt-get upgrade -f -y --force-yes

install_package FIREFOX firefox

install_package THUNDERBIRD thunderbird

install_package KEEPASS keepassx

install_package TMUX tmux

install_package NODEJS nodejs

install_package VAGRANT vagrant

install_package VIRTUALBOX_5.0 virtualbox_5.0

install_package CURL curl

install_package XDG-UTILS xdg-utils

install_package VIM vim

install_package ZSH zsh

install_package GIT git

install_package NODEJS nodejs

install_package NODEJS-DEV nodejs-dev

install_package NODEJS-LEGACY nodejs-legacy

install_package NPM npm

install_package HTOP htop

install_package NCDU ncdu

install_package MIDNIGHT-COMMANDER mc

install_package CMATRIX cmatrix

install_package DROPBOX nautilus-dropbox

install_package TERMINATOR terminator

install_package WORKBENCH mysql-workbench

chsh -s /bin/zsh
chsh -s /bin/zsh $USER

sudo npm install --global trash-cli

echo ""
echo "PACKAGES THAT ARE NOT NEEDED ANYMORE WILL BE REMOVED"
echo ""
sleep 1
sudo apt-get autoremove
sudo apt-get autoclean

