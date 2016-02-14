email=$(git config user.email)

if [ -z "$email" ]; then
  echo "NOTE: git email is not configured. Set it with:"
  echo "$ git config --system user.email deluan@deluan.com"
  echo
fi
