DOTFILES=$HOME/.dotfiles
ZSH=~/.oh-my-zsh

# Enables oh-my-zsh plugins
plugins=(z git-flow mvn)

# Set ZSH Theme
ZSH_THEME="ruhtra"
. $ZSH/oh-my-zsh.sh

# Add syntax highlighting plugin
. $DOTFILES/zshrc/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh

# Import aliases from .dotfiles
. $DOTFILES/aliases/.aliases

# Import functions from .dotfiles
for function in $DOTFILES/myfunctions/*; do
  source $function
done

# Customize to your needs...
export PATH=$HOME/bin:/usr/local/bin:$PATH

#############################################################
###########################OPTIONS###########################

# If you type foo, and it isn't a command,
# and it is a directory in your cdpath go there
setopt AUTO_CD

# Allow comments even in interactive shells (especially for Muness)
setopt INTERACTIVE_COMMENTS

# Allow multiple terminal sessions to all append to one zsh command history
setopt APPEND_HISTORY

# Add comamnds as they are typed, don't wait until shell exit
setopt INC_APPEND_HISTORY 

# Do not write events to history that are duplicates of previous events
setopt HIST_IGNORE_DUPS

# When searching history don't display results already cycled through twice
setopt HIST_FIND_NO_DUPS

# Remove extra blanks from each command line being added to history
setopt HIST_REDUCE_BLANKS

# Include more information about when the command was executed, etc
setopt EXTENDED_HISTORY

# Allow completion from within a word/phrase
setopt COMPLETE_IN_WORD

# When completing from the middle of a word,
# move the cursor to the end of the word
setopt ALWAYS_TO_END

# Enable parameter expansion, command substitution,
# and arithmetic expansion in the prompt
setopt PROMPT_SUBST

# Do not want completion complettly and running throuh it wit TAB
unsetopt MENU_COMPLETE

# You only get the menu behaviour when you hit TAB again on the ambiguous
# completion
setopt AUTO_MENU

export EDITOR=/usr/bin/vim
export VISUAL=/usr/bin/vim
#############################################################
############################RVM OPTIONS######################
[[ -s "/usr/local/rvm/scripts/rvm" ]] && source "/usr/local/rvm/scripts/rvm"
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
