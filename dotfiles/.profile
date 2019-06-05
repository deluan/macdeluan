#!/bin/sh

for PROFILE_SCRIPT in $( ls ~/.profile.d/*.sh ); do
        if [ -f ~/.debug ]; then
                [ -x $PROFILE_SCRIPT ] && echo "Loading $PROFILE_SCRIPT" && time . $PROFILE_SCRIPT
                echo ""
        else
                [ -x $PROFILE_SCRIPT ] && . $PROFILE_SCRIPT
        fi
done