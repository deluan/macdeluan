alias ll='ls -la'
alias webserver='python -m SimpleHTTPServer' 
alias st='stree'

export PATH=~/bin:/usr/local/bin:$PATH
export EDITOR=vi
export CLICOLOR=1

export JAVA_OPTS="-Xms256m -Xmx1024m -XX:PermSize=128m -XX:MaxPermSize=256m"
export MAVEN_OPTS="-Xmx512m -XX:MaxPermSize=256m"
export JAVA_HOME=$(/usr/libexec/java_home)
export ANDROID_HOME=$HOME/Development/adt-bundle-mac-x86_64-20130219/sdk
export GRAILS_HOME=/Applications/grails/`ls  /Applications/grails/ | tail -n 1`
export GRIFFON_HOME=/Applications/griffon/`ls  /Applications/griffon/ | tail -n 1`
