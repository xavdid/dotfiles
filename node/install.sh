# !/bin/zsh

if test ! $(which yarn)
then
  echo "Installing yarn via npm"
  npm i -g yarn
else
  echo 'yarn already installed!'
fi
