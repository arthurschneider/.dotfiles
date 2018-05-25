# -*- sh -*- vim:set ft=sh ai et sw=4 sts=4:

function pwds(){
  echo "%{$FG[202]%}%2~"
}

function asset() {
  echo "$FG[214]%m:"
}

function user() {
  echo "$FG[226]%n"
}

function spacer() {
  echo "$FG[220]@"
}

function gits() {
  echo "$(git_prompt_info)"
}

function ends() {
  echo "$FG[208] \n %(!.=>.>>) %{$reset_color%}"
}


PROMPT='$(user)$(spacer)$(asset) $(pwds) $(gits)$(ends) '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$FG[196]%}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="›%{$reset_color%}"
