if [ -f $(brew --prefix)/etc/bash_completion ]; then
	. $(brew --prefix)/etc/bash_completion
fi

if [ -f /usr/local/bin/aws ]; then
	complete -C aws_completer aws
fi
