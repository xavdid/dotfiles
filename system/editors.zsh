export EDITOR='code'
alias zshconfig="$EDITOR ~/.zshrc"
alias gitconfig="$EDITOR ~/.gitconfig"
alias envedit="$EDITOR ~/.env"
alias dotedit="$EDITOR $DOTFILES"
# special case for code, which runs a line of python
# if there's a python-version, it fails unless it's installed
# needs to match the default python version
alias c="PYENV_VERSION=3.10.0 code ."
