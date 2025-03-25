if command -v pipx 1>/dev/null 2>&1; then
  # list pipx bins
  export PATH="$PATH:$HOME/.local/bin"
fi

# don't allow global pip
export PIP_REQUIRE_VIRTUALENV=1
