# grc overides for ls
#   Made possible through contributions from generous benefactors like
#   `brew install coreutils`
if $(gls &>/dev/null)
then
  alias ls="gls -F --color"
  alias l="gls -lAh --color"
  alias ll="gls -l --color"
  alias la='gls -A --color'
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

function book()
{
  upload_books "$(pbpaste)"
}

function audiobook()
{(
  # parens so the whole shell doesn't die on error
  if [ $# -eq 0 ]; then
      echo "ERR: Pass the path to the .odm file as the first (and only) arg"
      exit 1
  fi
  set -e
  odmpy dl "$1" --downloaddir ~/Downloads/audiobooks -mc --mergeformat m4b --nobookfolder
  echo -n "odmpy ret $1" | pbcopy
  echo "\nDone! The command to return the loan has been copied to the clipboard."
)}

alias obsidian-backup="cp -r $DROPBOX/Apps/Obsidian ~/Desktop && echo 'Done!'"
