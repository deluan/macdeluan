zkill() {
  local param
  if [ $1 ]; then
    param="-q $1"
  fi
  ( 
    PS=`ps -eo pid=,command= | grep -v fzf | fzf $param` && \
      echo "Sending SIGTERM to process $PS" && \
      kill `echo $PS | awk '{print $1}'`
  )
}