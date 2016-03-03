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

}

################################


############## Main ############

backup_oldfiles
link_the_files

# download all the submodules
cd $HOME/.dotfiles
git submodule update

# enable all the .dotfiles
source ~/.zshrc

echo "Everything done try it out!"
################################

