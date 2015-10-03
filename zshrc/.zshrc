
# Set ZSH Theme
ZSH=/home/w1nd/.oh-my-zsh/
ZSH_THEME="ruhtra"
source $ZSH/oh-my-zsh.sh

# Import aliases from .dotfiles
source /home/w1nd/.dotfiles/aliases/.aliases
# Customize to your needs...
export PATH=/opt/local/bin:/opt/local/sbin:/usr/local/bin:/usr/local/sbin/:/opt/local/bin:/opt/local/sbin:/usr/local/bin:/usr/local/sbin/:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:/usr/local/cuda/bin:/usr/local/cuda/bin:/opt/local/bin:/opt/local/sbin

#############################################################
###########################OPTIONS###########################


# ===== Basics

# If you type foo, and it isn't a command, and it is a directory in your cdpath, go there
setopt AUTO_CD

# Allow comments even in interactive shells (especially for Muness)
setopt INTERACTIVE_COMMENTS

# ===== History

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

# ===== Completion 

# Allow completion from within a word/phrase
setopt COMPLETE_IN_WORD 

# When completing from the middle of a word, move the cursor to the end of the word
setopt ALWAYS_TO_END            

# ===== Prompt

# Enable parameter expansion, command substitution, and arithmetic expansion in the prompt
setopt PROMPT_SUBST


unsetopt MENU_COMPLETE
setopt AUTO_MENU

#############################################################
############################RVM OPTIONS######################
[[ -s "/usr/local/rvm/scripts/rvm" ]] && source "/usr/local/rvm/scripts/rvm"
