# Workaround for Z Plugin: 
# mv: rename /Users/mhluska/.z.12601 to /Users/mhluska/.z: No such file or directory
# See: https://github.com/robbyrussell/oh-my-zsh/issues/7094

if [ "$_Z_NO_RESOLVE_SYMLINKS" ]; then
    _z_precmd() {
        (_z --add "${PWD:a}" &)
		: $RANDOM
    }
else
    _z_precmd() {
        (_z --add "${PWD:A}" &)
		: $RANDOM
    }
fi