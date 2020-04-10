<p align="center">
  <img src="https://raw.githubusercontent.com/arthurschneider/.dotfiles/master/dotfiles_logo.png" alt=".dotfiles Logo"/>
</p>

### Collection of my dotfiles

#### Setup
 First step is to download the files from repository.
 Go to your XDG_CONFIG_HOME directory and run:
```bash
git clone git@github.com:arthurschneider/.dotfiles.git
```

After that you can put the config files into places.

##### Vim
To install vim plugins run:
```bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
Then start vim and run:
:PlugInstall


##### Tmux
To install tmux plugins run:
```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Then load .tmux.conf file and press "Prefix |"
