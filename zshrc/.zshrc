export XDG_CONFIG_HOME=$HOME/.config

export EDITOR=/usr/bin/vim
export VISUAL=/usr/bin/vim

# export NVIM_TUI_ENABLE_TRUE_COLOR=1
export TERM=xterm-256color
export COLORTERM=truecolor

# Set ZSH Theme
export ZSH=$XDG_CONFIG_HOME/.oh-my-zsh/oh-my-zsh
plugins=(colored-man-pages mvn git-prompt)
ZSH_THEME="ruhtra"
source $ZSH/oh-my-zsh.sh


# import aliases from .dotfiles
source $XDG_CONFIG_HOME/.dotfiles/aliases/.aliases

for function in $XDG_CONFIG_HOME/.dotfiles/myfunctions/*; do
  source $function
done

# source autojump
source /usr/share/autojump/autojump.sh

# Add syntax highlighting plugin
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# customize to your needs...
export PATH=$HOME/bin:/usr/local/bin:~/.local/share:$PATH

#############################################################
###########################OPTIONS###########################
# set up default emacs keybindigs
set -o emacs

# uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"
autoload -U compinit
compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

setopt share_history
# keep a lot of history
HISTFILE=~/.zhistory
HISTSIZE=5000
SAVEHIST=5000

# if you type foo, and it isn't a command,
# and it is a directory in your cdpath go there
setopt AUTO_CD

# allow comments even in interactive shells (especially for Muness)
setopt INTERACTIVE_COMMENTS

# allow multiple terminal sessions to all append to one zsh command history
setopt APPEND_HISTORY

# add comamnds as they are typed, don't wait until shell exit
setopt INC_APPEND_HISTORY

# do not write events to history that are duplicates of previous events
setopt HIST_IGNORE_DUPS

# when searching history don't display results already cycled through twice
setopt HIST_FIND_NO_DUPS

# remove extra blanks from each command line being added to history
setopt HIST_REDUCE_BLANKS

# include more information about when the command was executed, etc
setopt EXTENDED_HISTORY

# allow completion from within a word/phrase
setopt COMPLETE_IN_WORD

# when completing from the middle of a word,
# move the cursor to the end of the word
setopt ALWAYS_TO_END

# enable parameter expansion, command substitution,
# and arithmetic expansion in the prompt
setopt PROMPT_SUBST

# do not want completion complettly and running throuh it wit TAB
unsetopt MENU_COMPLETE

# you only get the menu behaviour when you hit TAB again on the ambiguous
# completion
setopt AUTO_MENU


####################### FZF (fuzzy-finder####################
#############################################################
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
#############################################################

