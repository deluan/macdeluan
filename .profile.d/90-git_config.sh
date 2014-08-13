git config --global color.diff auto
git config --global color.status auto
git config --global color.branch auto
git config --global color.interactive auto
git config --global color.ui true
git config --global color.pager true
git config --global push.default matching
git config --global core.filemode false
git config --global core.autocrlf false
git config --global alias.st status
git config --global alias.co checkout
git config --global alias.ci commit
git config --global alias.pr "pull --rebase"
git config --global alias.lg "log --oneline"
git config --global alias.ls "log --pretty=format:'%C(yellow)%h%Cred%d\\ %Creset%s%Cblue\\ [%cn]' --decorate"
git config --global alias.ll "log --pretty=format:'%C(yellow)%h%Cred%d\\ %Creset%s%Cblue\\ [%cn]' --decorate --numstat"
git config --global alias.who '!f() { user=`git config user.name`; email=`git config user.email`; echo "$user <$email>"; }; f'
git config --global alias.undo-last-commit "reset --soft 'HEAD^'"
