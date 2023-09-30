# !/bin/zsh

# if test ! $(which poetry)
# then
#   echo   installing poetry
#   curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python -
# else
#   echo 'poetry already installed!'
# fi

# python-based tools I use regularly
# can only install one at a time; https://github.com/pypa/pipx/issues/971
packages=(black datasette hacker-news-to-sqlite litecli odmpy ptpython reddit-user-to-sqlite sqlite-utils tox universal-test-runner)
for p in $packages;
  do pipx install $p
done
