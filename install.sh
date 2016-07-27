#!/bin/bash

########## Variables ###########

dir=~/.dotfiles
olddir=~/.dotfiles_old
files="vimrc zshrc"
user=$USERNAME

################################


########## Functions ###########

backup_oldfiles(){
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

  echo "Creating symlink for .gitconfig in home directory."
  cd ~
  ln -s $dir/git/.gitconfig ~/.gitconfig


  echo "Creating symlink for my theme in oh-my-zsh directory"
  mkdir ~/.dotfiles/.oh-my-zsh/custom/themes/
  cd ~/.dotfiles/.oh-my-zsh/custom/themes/
  ln -s ~/.dotfiles/zshrc/ruhtra.zsh-theme ruhtra.zsh-theme

  echo "Creating symlinks for atom dotfiles"
  atom
  cd ~/.atom/
  ln -s ~/.dotfiles/atom/config.cson config.cson
  ln -s ~/.dotfiles/atom/init.coffee init.coffee
  ln -s ~/.dotfiles/atom/keymap.cson keymap.cson
  ln -s ~/.dotfiles/atom/snippets.cson snippets.cson
  ln -s ~/.dotfiles/atom/styles.less styles.less
}

################################


############## Main ############

# download all the submodules
cd $HOME/.dotfiles
git submodule update --init

backup_oldfiles
link_the_files

# enable all the .dotfiles
source ~/.zshrc

echo "Everything done try it out!"
################################

