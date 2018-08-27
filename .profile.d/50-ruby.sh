export RVM_ORIGINAL_PROMPT_COMMAND=$PROMPT_COMMAND

rvm() {
    unset -f rvm
    [ -f ~/.rvm/scripts/rvm ] && source ~/.rvm/scripts/rvm 
    rvm "$@"
}

_rvm_prompt_hook() {
    if [ -f .ruby-version ]; then
        unset -f rvm
        [ -f ~/.rvm/scripts/rvm ] && source ~/.rvm/scripts/rvm 
        PROMPT_COMMAND=$RVM_ORIGINAL_PROMPT_COMMAND
    fi
};

__add_prompt_command "_rvm_prompt_hook"
