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

alias mip="ifconfig |grep inet"
alias ip="curl http://ipecho.net/plain ;echo"

alias cda="cd -"

# load a .env file into local ENV
function ee()
{
    export $(cat .env)
}

# https://askubuntu.com/a/146643
alias hoist="find . -mindepth 2 -type f -exec mv {} . \;"
