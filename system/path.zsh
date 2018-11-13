export PATH="/usr/local/bin:/usr/local/sbin:$DOTFILES/bin:$PATH"

export DROPBOX="$HOME/Dropbox"

if [[ $LOC = 'RIQ' ]]; then

    export PROJECTS_ROOT="$HOME/projects"
    export $GITHUB_CLONE_NAME="xavdid"

    export PATH="$PATH:$DROPBOX/Saves/bin"

elif [[ $LOC = 'TBP' ]]; then

    export PROJECTS_ROOT="$HOME/projects"
    export $GITHUB_CLONE_NAME="zapier"

elif [[ $LOC = 'TOR' ]]; then

else
    echo 'No LOC file found'
fi

if ![[ -z "$DROPBOX" ]]; then
    echo '!!warning!! $DROPBOX is not set'
fi
