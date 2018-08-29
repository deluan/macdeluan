# Started using `bash-git-prompt`, less code to mantain
# last version of my custom code: 
# https://github.com/deluan/macdeluan/blob/0b5e7e302c25927f8ea63e622dffe555fe8cc97a/.profile.d/91-git_prompt.sh

GIT_PROMPT_THEME=Custom

BREW_PREFIX=`brew --prefix`
if [ -f "${BREW_PREFIX}/opt/bash-git-prompt/share/gitprompt.sh" ]; then
  __GIT_PROMPT_DIR=${BREW_PREFIX}/opt/bash-git-prompt/share
  source "${__GIT_PROMPT_DIR}/gitprompt.sh"
fi

