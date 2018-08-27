alias ll='ls -la'
alias webserver='python -m SimpleHTTPServer'

export EDITOR=vi
export CLICOLOR=1
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"
export HISTCONTROL=ignorespace

export ANDROID_HOME=/usr/local/opt/android-sdk

export PATH=~/bin:/usr/local/sbin:$PATH

[ -f ~/.cdpath ] && CDPATH=`cat ~/.cdpath`:$CDPATH

__add_prompt_command() {
    cmd=$1
    if ! [[ "$PROMPT_COMMAND" =~ $cmd ]]; then
      PROMPT_COMMAND="$cmd;$PROMPT_COMMAND";
    fi
}