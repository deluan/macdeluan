export BREW_PREFIX=`brew --prefix`

COMPLETIONS=`ls ${BREW_PREFIX}/etc/bash_completion.d`

for cmd in $COMPLETIONS; do
	eval "${cmd}(){ unset -f ${cmd}; . ${BREW_PREFIX}/etc/bash_completion; ${cmd} \$@; }"
done