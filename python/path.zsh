# i'm not positive I need this? I'm on 3.8

# export PATH="/Users/david/Library/Python/3.7/bin:$PATH"


if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

source $HOME/.poetry/env
export PATH="$HOME/.poetry/bin:$PATH"
