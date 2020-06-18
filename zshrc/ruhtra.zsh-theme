# -*- sh -*- vim:set ft=sh ai et sw=4 sts=4:

function user() {
  echo "$FG[226]%n"
}

function spacer() {
  echo "$FG[220]@"
}

function mhst() {
  echo "$FG[214]%m:"
}

function pwds(){
  echo "%{$FG[202]%}%2~"
}

function gits() {
  echo "$(git_prompt_info)"
}

function ends() {
  echo "$FG[160] %(!.=>.>>) %{$reset_color%}"
}


PROMPT='$(user)$(spacer)$(mhst) $(pwds)$(ends)'

RPROMPT='$(git_super_status)'
