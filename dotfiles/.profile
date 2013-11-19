#!/bin/sh

for PROFILE_SCRIPT in $( ls ~/.profile.d/*.sh ); do
  [ -x $PROFILE_SCRIPT ] && . $PROFILE_SCRIPT
done
