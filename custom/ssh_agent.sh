# Set up ssh-agent

__ssh_agent_env="$HOME/.ssh/environment"

function __start_agent {
    echo "Initializing new SSH agent..."
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${__ssh_agent_env}"
    chmod 600 "${__ssh_agent_env}"
    . "${__ssh_agent_env}" > /dev/null
    if ! pgrep -q ssh-add; then
        /usr/bin/ssh-add
        /usr/bin/ssh-add ~/.ssh/vagrant_rsa
    fi
}

# Source SSH settings, if applicable
if [ -f "${__ssh_agent_env}" ]; then
    . "${__ssh_agent_env}" > /dev/null
    [ -n "`pgrep ssh-agent | grep $SSH_AGENT_PID 2>/dev/null`" ] || __start_agent
else
    __start_agent;
fi

unset __start_agent __ssh_agent_env

ssh_install_key() {
  cat ~/.ssh/id_rsa.pub | ssh $1 "mkdir -p ~/.ssh && cat >>  ~/.ssh/authorized_keys && chmod 600 ~/.ssh/authorized_keys"
}
