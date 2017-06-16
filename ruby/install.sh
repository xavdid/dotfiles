#!/bin/zsh
#
# rvm
# install with a recent ruby
#
if test ! $(rvm -v)
then
  echo "  Installing rvm for you."
  curl -sSL https://get.rvm.io | bash -s stable --ruby
else
  echo ' rvm already installed!'
fi

