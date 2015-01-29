GRAILS_BASE_DIR=~/Applications/grails/
if [ -d $GRAILS_BASE_DIR ]; then
  LATEST_GRAILS=`ls -t ${GRAILS_BASE_DIR} | tail -n 1`
fi

if [ -z $LATEST_GRAILS ]; then
  LATEST_GRAILS=.
fi

export GRAILS_HOME=${GRAILS_BASE_DIR}${LATEST_GRAILS}

# export GRIFFON_HOME=~/Applications/griffon/`ls  ~/Applications/griffon/ | tail -n 1`
