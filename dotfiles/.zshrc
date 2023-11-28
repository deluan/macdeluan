# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

if [[ ! -f $HOME/.zi/bin/zi.zsh ]]; then
  print -P "%F{33}▓▒░ %F{160}Installing (%F{33}z-shell/zi%F{160})…%f"
  command mkdir -p "$HOME/.zi" && command chmod go-rwX "$HOME/.zi"
  command git clone -q --depth=1 --branch "main" https://github.com/z-shell/zi "$HOME/.zi/bin" && \
    print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
    print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zi/bin/zi.zsh"
autoload -Uz _zi
(( ${+_comps} )) && _comps[zi]=_zi
# examples here -> https://wiki.zshell.dev/ecosystem/category/-annexes
zicompinit # <- https://wiki.zshell.dev/docs/guides/commands

zi ice depth=1; zi light romkatv/powerlevel10k

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

zi light changyuheng/fz
zi light rupa/z
zi light zsh-users/zsh-autosuggestions
zi light zsh-users/zsh-completions
zi light zsh-users/zsh-history-substring-search
zi light z-shell/F-Sy-H


source ~/macdeluan/custom/aliases.sh
zi snippet ~/macdeluan/custom/cdz.zsh
zi snippet ~/macdeluan/custom/direnv_loader.sh
zi snippet ~/macdeluan/custom/fnm_loader.sh
zi snippet ~/macdeluan/custom/golang_cd.sh

bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down
setopt HIST_IGNORE_SPACE

# eval "$(fnm env --use-on-cd)"

export PATH="/Applications/IntelliJ IDEA.app/Contents/MacOS":$PATH