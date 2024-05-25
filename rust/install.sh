# !/bin/zsh

if test ! $(which rustup)
then
  echo   installing poetry
  # https://www.rust-lang.org/tools/install
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
else
  echo 'rust already installed!'
fi
