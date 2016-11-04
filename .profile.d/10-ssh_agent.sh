# Set up ssh-agent
SSH_ENV="$HOME/.ssh/environment"

function __start_agent {
    echo "Initializing new SSH agent..."
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
    echo succeeded
    chmod 600 "${SSH_ENV}"
    . "${SSH_ENV}" > /dev/null
    /usr/bin/ssh-add
    /usr/bin/ssh-add ~/.ssh/vagrant_rsa
}

# Source SSH settings, if applicable
if [ -f "${SSH_ENV}" ]; then
    . "${SSH_ENV}" > /dev/null
    [ -n "`pgrep ssh-agent | grep $SSH_AGENT_PID 2>/dev/null`" ] || __start_agent
else
    __start_agent;
fi

unset __start_agent # to avoid overriding the settings accidentally 

ssh_install_key() {
  cat ~/.ssh/id_rsa.pub | ssh $1 "mkdir -p ~/.ssh && cat >>  ~/.ssh/authorized_keys && chmod 600 ~/.ssh/authorized_keys"
}
