export ZPLUG_HOME=~/.zplug
source $ZPLUG_HOME/init.zsh
zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# Theme
zplug "romkatv/powerlevel10k", as:theme
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_to_last"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir vcs status)
#POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(root_indicator background_jobs history time)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()
POWERLEVEL9K_STATUS_OK=false
POWERLEVEL9K_STATUS_CROSS=true

# Plugins
zplug "yous/vanilli.sh"
# zplug "robbyrussell/oh-my-zsh",                    use:"lib"
# zplug "plugins/ssh-agent",                         from:oh-my-zsh
# zplug "modules/ssh", from:prezto, depth:1
zplug "changyuheng/fz",                            defer:1
zplug "rupa/z",                                    use:z.sh
zplug "supercrabtree/k"
zplug "laggardkernel/zsh-iterm2"
zplug "micrenda/zsh-nohup"
zplug "docker/cli",                                use:"contrib/completion/zsh"
zplug "docker/compose",                            use:"contrib/completion/zsh"

zplug "~/Development/macdeluan/plugins/macos-jdk", from:local, if:"[[ $OSTYPE == *darwin* ]]"
zplug "~/Development/macdeluan/.profile.d",        from:local, use:60-golang.sh

zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting",         defer:2
zplug "lukechilds/zsh-better-npm-completion",      defer:2

zplug load

# Custom
export DEFAULT_USER=deluan
export PATH=~/bin:/usr/local/sbin:~/.fnm:$PATH
[ -f ~/.cdpath ] && CDPATH=`cat ~/.cdpath`:$CDPATH

alias vauth='vault login --method=github'
alias pstree='pstree -g 2'
alias l='ls -lah'
alias la='ls -lAh'
alias ll='ls -lh'
alias ls='ls -G'
alias lsa='ls -lah'
alias grep='grep  --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn}'

type direnv 2>&1 > /dev/null && eval "$(direnv hook zsh)"

# fnm
eval "$(fnm env --multi --shell=zsh --use-on-cd)"
alias nvm=fnm

# Gradle Auto-Wraper
gradle() {
  if [ -x ./gradlew ]; then
    ./gradlew $*;
  else
    command gradle $*
  fi
}

# new_cd()
# {
#     if [ -d "$1" -o $1 = '-' -o $1 = '..' ]; then
#         builtin cd "$1"
#     else
#         z "$1"
#     fi
# }

# if type z > /dev/null; then
#   alias cd=new_cd
# else
#   echo "Z command not found. Won't install the CD hook"
# fi
