export GOPATH=$HOME/Development/go
export PATH=$PATH:/usr/local/opt/go/libexec/bin:$GOPATH/bin

gocd() {
  if [ $1 ]; then
    PARAM="-q $1 -1"
  fi
  cd `find $GOPATH -type d | fzf $PARAM`
}
