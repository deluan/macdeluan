export GOPATH=$HOME/go
folder=$(ls $HOME/go/ | grep go | sort -r | head -n 1)
export PATH=$PATH:$HOME/go/${folder}/bin:$GOPATH/bin
