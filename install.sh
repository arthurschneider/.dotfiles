#! /bin/bash

# This script installs and enables my dotfiles

dir=~/.dotfiles
olddir=~/.dotfiles_old
files="vimrc zshrc"
user=$USERNAME


backup_old_files(){
 mkdir -p $olddir
 cd $dir

 for file in $files; do
     echo "Moving any existing dotfiles from ~ to $olddir"
     mv ~/.$file ~/.dotfiles_old/
 done
}

link_the_files(){
  for file in $files; do
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file/.$file ~/.$file
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
  sudo apt-get install xdg-utils
  sudo apt-get install nodejs-legacy
  sudo apt-get install curl

  mkdir -p ~/.vim/after/ftplugin/markdown/

  sudo npm -g install instant-markdown-d

  wget -t 2 https://raw.githubusercontent.com/suan/vim-instant-markdown/master/after/ftplugin/markdown/instant-markdown.vim

  mv instant-markdown.vim ~/.vim/after/ftplugin/markdown/
}

enable_my_configs(){
  source ~/.zshrc
}

backup_old_files

link_the_files

link_gitconfig

install_oh_my_zsh

set_my_zsh_theme

enable_my_configs

echo "Everything done try it out!"

