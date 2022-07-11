if command -v pipx 1>/dev/null 2>&1; then
  # list pipx bins
  export PATH="$PATH:$HOME/.local/bin"
fi

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init --path)"
  eval "$(pyenv init -)"
fi

if command -v poetry 1>/dev/null 2>&1; then
  source $HOME/.poetry/env
  export PATH="$HOME/.poetry/bin:$PATH"
fi
