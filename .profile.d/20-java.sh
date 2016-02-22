export JAVA_PERM_SIZE="-XX:PermSize=128m -XX:MaxPermSize=256m"
export JAVA_OPTS="-Xms256m -Xmx1024m"
export MAVEN_PERM_SIZE="-XX:MaxPermSize=256m"
export MAVEN_OPTS="-Xmx512m"
export JAVA_AVAILABLE_VERSIONS=

jdk() {
  if [ ! "$JAVA_AVAILABLE_VERSIONS" ]; then
    JAVA_AVAILABLE_VERSIONS=$(/usr/libexec/java_home -V 2>&1 >/dev/null | grep x86_64 | cut -f 2 -d. | sort | tr '\n' ' ')
  fi

  if [[ $JAVA_AVAILABLE_VERSIONS =~ $1 ]]; then
    export JAVA_HOME=$(/usr/libexec/java_home -v 1.$1)
    java -version 2>&1

    if [ $1 -lt 8 ]; then
      JAVA_OPTS="$JAVA_OPTS $JAVA_PERM_SIZE"
      MAVEN_OPTS="$MAVEN_OPTS $MAVEN_PERM_SIZE"
    fi
  else
    echo "Available java versions: $JAVA_AVAILABLE_VERSIONS"
    /usr/libexec/java_home -V 2>&1 >/dev/null | grep x86_64
    echo 
    echo "Current version is `java -version 2>&1`"
  fi
}

[ -f ~/.jdkversion ] && . ~/.jdkversion > /dev/null
[ ! $JAVA_HOME ] && export JAVA_HOME=$(/usr/libexec/java_home)
