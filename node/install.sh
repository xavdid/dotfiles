# !/bin/zsh
#
# nvm
#
#
if test ! $(which nvm)
then
  echo "  Installing nvm for you."
  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
else
  echo 'nvm already installed!'
fi

echo 'install a version of node now!'
