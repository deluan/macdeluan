export GOPATH=$HOME/Development/go
export PATH=$PATH:/usr/local/opt/go/libexec/bin:$GOPATH/bin
export GO15VENDOREXPERIMENT=1

gcd() {
  if [ $1 ]; then
    PARAM="-q $1"
  fi
  cd `find $GOPATH/src -type d -not \( -path "*/.git*" -o -path "*/vendor/*" \) | fzf -1 $PARAM`
}