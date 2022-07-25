export EDITOR='vim'

FANCY_EDITOR="code"

alias zshconfig="$FANCY_EDITOR ~/.zshrc"
alias gitconfig="$FANCY_EDITOR ~/.gitconfig"
alias envedit="$FANCY_EDITOR ~/.env"
alias dotedit="$FANCY_EDITOR $DOTFILES"
# special case for code, which runs a line of python
# if there's a python-version, it fails unless it's installed
# needs to match the default python version
alias c="PYENV_VERSION=$(pyenv global) code ."
