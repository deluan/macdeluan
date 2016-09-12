gradle() {
  if [ -x ./gradlew ]; then
    ./gradlew $*;
  else
    command gradle $*
  fi
}
