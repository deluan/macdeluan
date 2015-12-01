alias ll='ls -la'
alias webserver='python -m SimpleHTTPServer'
alias stree='open -a SourceTree'
alias st='stree'

export EDITOR=vi
export CLICOLOR=1
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"

export POSTGRES_APP=/Applications/Postgres93.app/Contents/MacOS
export JAVA_OPTS="-Xms256m -Xmx1024m -XX:PermSize=128m -XX:MaxPermSize=256m"
export MAVEN_OPTS="-Xmx512m -XX:MaxPermSize=256m"
export JAVA_HOME=$(/usr/libexec/java_home)
export ANDROID_HOME=/usr/local/opt/android-sdk

export PATH=~/bin:/usr/local/bin:$POSTGRES_APP/bin:$PATH
