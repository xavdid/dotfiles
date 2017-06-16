# !/bin/zsh
#
# nvm
#
#
if test ! $(which nvm)
then
  echo "  Installing nvm for you."
  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash
else
  echo 'nvm already installed!'
fi
