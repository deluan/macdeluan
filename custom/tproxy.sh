PROXY_HOST="198.161.14.25"
PROXY_PORT="8080"
VPN_INTF="utun1"

sh_proxy() {
    local proxy_url="http://${PROXY_HOST}:${PROXY_PORT}"
    case "$1" in
        on)
            echo "Enabling proxy ${proxy_url} for command line tools"
            export http_proxy=$proxy_url
            export https_proxy="${proxy_url}"
            export GIT_SSH_COMMAND="ssh -o ProxyCommand=\"socat - PROXY:${PROXY_HOST}:%h:%p,proxyport=${PROXY_PORT}\" -o hostname=ssh.github.com -o port=443"
        ;;
        off) 
            echo "Disabling proxy for command line tools"
            unset http_proxy https_proxy GIT_SSH_COMMAND
        ;;
        *)
            if [ -z "${http_proxy}" ]; then
                echo "Proxy is not set\nUsage: tproxy [on|off]"
            else
                echo "Proxy configured to ${http_proxy}"
            fi
    esac
}

tproxy() {
    which socat >/dev/null || echo "Warning: socat not found, git won't work when VPN is on!"
    sh_proxy $1
}

# [ -n "`ifconfig | grep ${VPN_INTF}`" ] && \
#     echo "VPN detected. Enabling proxy ${PROXY_HOST} on port ${PROXY_PORT}" && \
#     tproxy on > /dev/null