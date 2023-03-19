# replace `ls`
# https://github.com/Peltoche/lsd
if $(lsd &>/dev/null); then
  alias ls="lsd"
elif $(gls &>/dev/null); then
  # thesre are important so ls is readable
  # installed via the brew coreutils
  alias ls="gls -F --color"
  alias l="gls -lAh --color"
  alias ll="gls -l --color"
  alias la='gls -A --color'
fi

# replace `cat`
# https://github.com/sharkdp/bat
if $(bat -h &>/dev/null); then
  alias cat="bat --paging=never"
fi

function mip()
{
  echo -e "local: $(ipconfig getifaddr en0)\npublic: $(curl -s http://checkip.dyndns.org/ | sed 's/[a-zA-Z<>/ :]//g')"
}

alias ip="curl http://ipecho.net/plain ;echo"

alias cda="cd -"

# load a .env file into local ENV
function ee()
{
  export $(cat .env)
}

# https://askubuntu.com/a/146643
alias hoist="find . -mindepth 2 -type f -exec mv {} . \;"

# usage: ng 1234
alias ng="ngrok http --subdomain xavdid"

function backup-obsidian() {(
  require-variables DROPBOX || exit 1
  cp -r $DROPBOX/Apps/Obsidian ~/Desktop && echo 'Done!'
)}

# big jumps up
alias ...="cd ../.."
alias ....="cd ../../.."

# yarn global add trash-cli
alias rm="trash"
