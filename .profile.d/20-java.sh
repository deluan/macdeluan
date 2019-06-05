export JAVA_PERM_SIZE="-XX:PermSize=128m -XX:MaxPermSize=256m"
export JAVA_OPTS="-Xms256m -Xmx1024m"
export MAVEN_PERM_SIZE="-XX:MaxPermSize=256m"
export MAVEN_OPTS="-Xmx512m"
export JAVA_AVAILABLE_VERSIONS=

jdk() {
  if [ ! "$JAVA_AVAILABLE_VERSIONS" ]; then
    JAVA_AVAILABLE_VERSIONS=$(/usr/libexec/java_home -V 2>&1 >/dev/null | \
        grep x86_64 | cut -f 2 -dE | tr -d " " | cut -f 1 -d'"' | cut -f 1 -d "." | \
        sort | tr '\n\' ' ')
  fi

  if [[ $JAVA_AVAILABLE_VERSIONS =~ $1 ]]; then
    version=`/usr/libexec/java_home -V 2>&1 >/dev/null | grep "Java SE $1" | cut -f 1 -d ","`
    export JAVA_HOME=$(/usr/libexec/java_home -v $version)
    java -version 2>&1

    if [ $1 -lt 8 ]; then
      JAVA_OPTS="$JAVA_OPTS $JAVA_PERM_SIZE"
      MAVEN_OPTS="$MAVEN_OPTS $MAVEN_PERM_SIZE"
    fi
  else
    echo "Current version is `java -version 2>&1`"
    echo
    echo "Available java versions: $JAVA_AVAILABLE_VERSIONS"
    /usr/libexec/java_home -V 2>&1 >/dev/null | grep x86_64
    echo
  fi
}

[ ! "$JAVA_HOME" ] && export JAVA_HOME=$(/usr/libexec/java_home)

java() {
    unset -f java
    [ -f ~/.jdkversion ] && jdk `cat ~/.jdkversion`
    java "$@"
}

javac() {
    unset -f javac
    [ -f ~/.jdkversion ] && jdk `cat ~/.jdkversion`
    javac "$@"
}

jar() {
    unset -f jar
    [ -f ~/.jdkversion ] && jdk `cat ~/.jdkversion`
    jar "$@"
}

