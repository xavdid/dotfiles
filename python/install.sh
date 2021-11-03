# !/bin/zsh

if test ! $(which poetry)
then
  echo "  installing poetry"
  curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python -
else
  echo 'poetry already installed!'
fi
