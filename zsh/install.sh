# zsh comes pre-installed, but oh-my-zsh doesn't

if [[ ! -d ~/.oh-my-zsh ]]; then
  # https://ohmyz.sh/#install
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# the installer links a default zshrc, so we should delete it so the bootstrapper works
# this checks if the file is a symlink- if it is, we're all set already
if [[ ! -h ~/.zshrc ]]; then
  rm ~/.zshrc
fi
