#              .____    .___ _______   ____ _______  ___
#              |    |   |   |\      \ |    |   \   \/  /
#              |    |   |   |/   |   \|    |   /\     /
#              |    |___|   /    |    \    |  / /     \
#              |_______ \___\____|__  /______/ /___/\  \
#                      \/           \/               \_/

alias la='ls -alh'
alias al='ls -alh'
alias vi='vim'
alias ev='$EDITOR ~/.vimrc'
alias sv='source ~/.vimrc'


alias k9='kill -9'
alias mkd='mkdir'
alias q='exit'

alias updateos='sudo apt-get update && sudo apt-get upgrade -f -y --force-yes && sudo apt-get autoclean'
alias open='gnome-open'
alias ping='ping -c 5'
alias cl='clear'
alias please='sudo'
alias aptinstall='apt-get install'

#                     ________.______________
#                    /  _____/|   \__    ___/
#                   /   \  ___|   | |    |
#                   \    \_\  \   | |    |
#                    \______  /___| |____|
#                           \/

alias ga='git add'
alias gaa='git add .'
alias gap='git add -p'
alias gb='git branch'
alias gcom='git checkout master'

alias gcod='git checkout development'
alias gcob='git checkout -b'
alias gc='git commit'
alias gcm='git commit -m'
alias gcam='git commit -am'

alias gpo='git push origin'
alias gpom='git push origin master'
alias gpod='git push origin development'
alias gd='git diff'
alias gs='git status'

alias glog='git log'
alias gunstage='git reset HEAD -- .'

#_______________ __________  ____________________.___________    _______    _________
#\_   _____/    |   \      \ \_   ___ \__    ___/|   \_____  \   \      \  /   _____/
# |    __) |    |   /   |   \/    \  \/ |    |   |   |/   |   \  /   |   \ \_____  \
# \___  /  |______/\____|__  /\______  /|____|   |___\_______  /\____|__  /_______  /
#     \/                   \/        \/                      \/         \/        \/


# Extract many types of compressed packages
# Credit: http://nparikh.org/notes/zshrc.txt
extract() {
  if [ -f "$1" ]; then
    case "$1" in
      *.tar.bz2)  tar -jxvf "$1"                        ;;
      *.tar.gz)   tar -zxvf "$1"                        ;;
      *.bz2)      bunzip2 "$1"                          ;;
      *.dmg)      hdiutil mount "$1"                    ;;
      *.gz)       gunzip "$1"                           ;;
      *.tar)      tar -xvf "$1"                         ;;
      *.tbz2)     tar -jxvf "$1"                        ;;
      *.tgz)      tar -zxvf "$1"                        ;;
      *.zip)      unzip "$1"                            ;;
      *.ZIP)      unzip "$1"                            ;;
      *.pax)      cat "$1" | pax -r                     ;;
      *.pax.Z)    uncompress "$1" --stdout | pax -r     ;;
      *.Z)        uncompress "$1"                       ;;
      *) echo "'$1' cannot be extracted/mounted via extract()" ;;
    esac
  else
     echo "'$1' is not a valid file to extract"
  fi
}


# Changes to a directory and lists its contents.
cdls () {
  builtin cd "$argv[-1]" && ls "${(@)argv[1,-2]}"
}


# Create a .tar.gz archive, using `zopfli`, `pigz` or `gzip` for compression
targz() {
  local tmpFile="${@%/}.tar";
  tar -cvf "${tmpFile}" --exclude=".DS_Store" "${@}" || return 1;

  size=$(
    stat -f"%z" "${tmpFile}" 2> /dev/null; # OS X `stat`
    stat -c"%s" "${tmpFile}" 2> /dev/null # GNU `stat`
  );

  local cmd="";
  if (( size < 52428800 )) && hash zopfli 2> /dev/null; then
    # the .tar file is smaller than 50 MB and Zopfli is available; use it
    cmd="zopfli";
  else
    if hash pigz 2> /dev/null; then
      cmd="pigz";
    else
      cmd="gzip";
    fi;
  fi;

  echo "Compressing .tar using \`${cmd}\`…";
  "${cmd}" -v "${tmpFile}" || return 1;
  [ -f "${tmpFile}" ] && rm "${tmpFile}";
  echo "${tmpFile}.gz created successfully.";
}


# Make directory and change into it.
mkdcd() {
  mkdir -p "$1"
  cd "$1"
}
