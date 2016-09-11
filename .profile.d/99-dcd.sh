DCD_EXCLUDES="/*/iPhoto Library*/*:/private:/*/Development/adt-bundle*:/*/Library/Application Support/*:*/node_modules/*:*/Development/*/target/*:/Library:*/Library/Caches:*/Library/Containers:*/tw/*/target/*"
DCD=`which dcd` && eval "`${DCD} --install-sh`" &&  eval "`${DCD} --install-sh d`"

eval "`~/Development/dcd.js/bin/dcd --install-sh dcdc`"

dcdp ()
{
    new_path="$(${HOME}/Development/oldies/dcd/dcd ${@})";
    case $? in
        0) echo -e "\\033[31m${new_path}\\033[0m";
           cd "${new_path}";
           ;;
        2) echo "dcd: directory '${@}' not found";
           echo "Try \`dcd -r\` to update db.";
           ;;
    esac
}

