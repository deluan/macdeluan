export GOPATH=$HOME/Development/go
export PATH=$PATH:/usr/local/opt/go/libexec/bin:$GOPATH/bin
export GO15VENDOREXPERIMENT=1

gcd() {
  if [ $1 ]; then
    PARAM="-q $1 -1"
  fi
  cd `find $GOPATH -type d | fzf $PARAM`
}


gfmt() {
  gofmtcmd=`which goimports || echo "gofmt"`

  gofiles=$(git diff --name-only --diff-filter=ACM | grep '.go$')
  [ -z "$gofiles" ] && return

  unformatted=`$gofmtcmd -l $gofiles`
  [ -z "$unformatted" ] && return

  for f in $unformatted; do
      $gofmtcmd -w -l "$f"
      gofmt -s -w -l "$f"
  done
}
