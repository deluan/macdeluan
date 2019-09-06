export PATH=~/bin:/usr/local/sbin:$PATH
export ZSHRC=`echo ~/.zshrc(:A)`
export MACDELUAN_FOLDER=$(dirname `dirname $ZSHRC`)

# Zplug initialization
export ZPLUG_HOME=~/.zplug
source $ZPLUG_HOME/init.zsh
zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# Theme configuration
# zplug "dracula/zsh", as:theme
# zplug "${MACDELUAN_FOLDER}/dracula", from:local, as:theme
zplug "romkatv/powerlevel10k", as:theme
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_to_last"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs status custom_proxy)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()
POWERLEVEL9K_STATUS_OK=false
POWERLEVEL9K_STATUS_CROSS=true
POWERLEVEL9K_VCS_BACKENDS=(git hg)

POWERLEVEL9K_CUSTOM_PROXY="tproxy prompt 🐌"
POWERLEVEL9K_CUSTOM_PROXY_BACKGROUND="blue"
POWERLEVEL9K_CUSTOM_PROXY_FOREGROUND="yellow"

# Plugins
zplug "deluan/vanilli.sh"

zplug "modules/ssh",                          from:prezto
zplug "plugins/git-auto-fetch",               from:oh-my-zsh
zplug "changyuheng/fz",                       defer:1
zplug "rupa/z",                               use:z.sh
zplug "supercrabtree/k"
zplug "laggardkernel/zsh-iterm2"
zplug "micrenda/zsh-nohup"
zplug "docker/cli",                           use:"contrib/completion/zsh"
zplug "docker/compose",                       use:"contrib/completion/zsh"
zplug "gradle/gradle-completion"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-syntax-highlighting",    defer:2
zplug "lukechilds/zsh-better-npm-completion", defer:2

zplug "deluan/macos-jdk",                     depth:0
# zplug "~/Development/macos-jdk", from:local

# Load my customizations as plugins
if [ -d ${MACDELUAN_FOLDER}/custom ]; then
  zplug "${MACDELUAN_FOLDER}/custom", from:local, use:"*", defer:3
fi

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi
time zplug load #--verbose

bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

# # tabtab source for serverless package
# # uninstall by removing these lines or running `tabtab uninstall serverless`
# [[ -f /Users/deluan/.config/yarn/global/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/deluan/.config/yarn/global/node_modules/tabtab/.completions/serverless.zsh
# # tabtab source for sls package
# # uninstall by removing these lines or running `tabtab uninstall sls`
# [[ -f /Users/deluan/.config/yarn/global/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/deluan/.config/yarn/global/node_modules/tabtab/.completions/sls.zsh