# CD completion
setopt auto_cd
typeset -U -gx cdpath

zstyle ':completion:*' group-name ''
zstyle ':completion:*:descriptions' format %d
zstyle ':completion:*:descriptions' format %B%d%b
zstyle ':completion:*:complete:(cd|pushd):*' tag-order \
        'local-directories named-directories directory-stack path-directories'

# Load external cdpath list, if found
[ -f ~/.cdpath ] && cdpath=(`cat ~/.cdpath`)

# My Smart CD (cd+z)
local called_z=0 # To avoid recursive call from z to cd
cd() {
  if [ "$called_z" = "1" -o -z "$1" -o -d $1 -o "$1" = ".." -o "$1" = "-" ]; then
    builtin cd $1
  else
    called_z=1
    z $1 && echo $PWD
    called_z=0
  fi
}
