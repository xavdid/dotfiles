# !/bin/zsh

# if test ! $(which poetry)
# then
#   echo   installing poetry
#   curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python -
# else
#   echo 'poetry already installed!'
# fi

# python-based tools I use regularly
pipx install datasette hacker-news-to-sqlite litecli odmpy ptpython reddit-user-to-sqlite sqlite-utils tox universal-test-runner
# nightly build, which gets bugfixes regularly
pipx install --pip-args \'--pre\' yt-dlp
