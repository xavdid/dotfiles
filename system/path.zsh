export PATH="./bin:/usr/local/bin:/usr/local/sbin:$ZSH/bin:$PATH"

function home()
{
    export DROPBOX=/Users/david/Dropbox
    export DOTFILES=$DROPBOX/Saves/dotfiles
    export PROJECTS_ROOT=$HOME/projects

    function mag() {
        # echo 'not right now'
        pbpaste > "$DROPBOX/To Plex/thing-$(date -u +"%Ss").magnet"
    }

    alias db="cd \$DROPBOX"

    ## CUSTOM GIT ##
    function clo() { git clone git@github.com:xavdid/"$1".git; }
}

function work()
{
    export DROPBOX=/Users/david/Dropbox
    export DOTFILES=$DROPBOX/Saves/dotfiles
    export PROJECTS_ROOT=$HOME/projects

    ## CUSTOM GIT ##
    function clo() { git clone git@github.com:zapier/"$1".git; }
}

if [[ $LOC = RIQ ]]; then
    work
elif [[ $LOC = TBP ]]; then
    home
fi
