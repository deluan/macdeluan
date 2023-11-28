export GOPATH=$HOME/sdk
folder=$(ls $HOME/sdk/ | grep go | sort -r | head -n 1)
export PATH=$PATH:$HOME/sdk/${folder}/bin:$GOPATH/bin
