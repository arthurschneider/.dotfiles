#! /bin/bash

set -euo pipefail
IFS=$'\n\t'

#/ Usage: just start the script. You will be asked to put in your root password. Do it!
#/
#/ Description: This script will install some packages or download some software.
#/              It will also set some symlinks in your users home directory.
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

dir=~/.dotfiles
olddir=~/.dotfiles_old
files="vimrc zshrc tmux"

backup_old_files(){
 mkdir -p $olddir
 cd $dir

 for file in $files; do
     echo "Moving any existing dotfiles from ~ to $olddir"
     mv ~/."$file" $olddir
 done
}

link_the_files(){
  for file in $files; do
    echo "Creating symlink to $file in home directory."
    ln -s "$dir"/"$file"/."$file" ~/."$file"
  done
}

link_gitconfig(){
  echo "Creating symlink for .gitconfig in home directory."
  cd ~
  ln -s $dir/git/.gitconfig ~/.gitconfig
}

install_oh_my_zsh(){
  cd ~
  git clone git@github.com:robbyrussell/oh-my-zsh.git
}

set_my_zsh_theme(){
  echo "Creating symlink for my theme in oh-my-zsh directory"
  cd ~/oh-my-zsh/
  mkdir -p ~/oh-my-zsh/custom/themes/
  cd ~/oh-my-zsh/custom/themes/
  ln -s ~/.dotfiles/zshrc/ruhtra.zsh-theme ruhtra.zsh-theme
}

install_markdown_plugin_for_vim(){
  mkdir -p ~/.vim/after/ftplugin/markdown/

  sudo npm -g install instant-markdown-d

  wget -t 2 https://raw.githubusercontent.com/suan/vim-instant-markdown/master/after/ftplugin/markdown/instant-markdown.vim

  mv instant-markdown.vim ~/.vim/after/ftplugin/markdown/
}

install_vim_plug_tool(){
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
}

copy_ranger_dotfiles(){
  cp -R ~/.dotfiles/ranger ~/.config/ranger
}

enable_my_configs(){
  source ~/.zshrc
}

backup_old_files

link_the_files

link_gitconfig

install_oh_my_zsh

set_my_zsh_theme

install_markdown_plugin_for_vim

install_vim_plug_tool

copy_ranger_dotfiles

enable_my_configs

echo "Everything done try it out!"

