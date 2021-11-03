export PATH="/usr/local/bin:/usr/local/sbin:$DOTFILES/bin:$PATH"

export DROPBOX="$HOME/Dropbox"

if [[ $LOC = 'WRK' ]]; then

    export PROJECTS_ROOT="$HOME/projects"
    export GITHUB_CLONE_NAME="zapier"

elif [[ $LOC = 'TBP' ]]; then

    export PROJECTS_ROOT="$HOME/projects"
    export GITHUB_CLONE_NAME="xavdid"

    export PATH="$PATH:$DROPBOX/Saves/bin"

elif [[ $LOC = 'TOR' ]]; then

else
    echo 'No LOC file found; add one at ~/.loc'
fi

if [[ -z "$DROPBOX" ]]; then
    echo '!!warning!! $DROPBOX is not set'
fi
