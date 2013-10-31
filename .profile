#!/bin/sh

for PROFILE_SCRIPT in $( ls ~/.profile.d/*.sh ); do
  . $PROFILE_SCRIPT
done
