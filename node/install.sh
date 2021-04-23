# !/bin/zsh
#
# nodenv
#
#
if test ! $(which nodenv)
then
  echo "  Run brew install nodenv."
else
  echo 'nodenv already installed!'
fi

echo 'install a version of node now!'
