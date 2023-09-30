alias purr="git pull --rebase"
alias gs="git status"
alias gp="git push"
alias gd="git diff"
alias gt="git log --graph --oneline --decorate"
alias gb="git branch"
alias gm="git merge"
alias gc="git commit"
alias ch="git checkout"

# stolen from Nick Quinlan
alias pushit="open -g spotify:track:0GugYsbXWlfLOgsmtsdxzg; git push"

# push new branch - usage: `pnb $BRANCH`
alias pnb="git push -u origin"

alias disc="git reset --hard"

# usage: chb new-branch
function chb() {
    git checkout -b "$1"
    git push -u origin "$1"
}

# run after renaming the default branch on GH
function unmaster() {
    git branch -m master main
    git fetch origin
    git branch -u origin/main main
    git remote set-head origin -a
}

# pulled from https://docs.gitignore.io/install/command-line
function gi() {
    if [[ $1 == 'list' ]];then
        curl -sLw "\n" "https://www.toptal.com/developers/gitignore/api/list"
    else
        curl -sLw "\n" "https://www.toptal.com/developers/gitignore/api/$@" > .gitignore
    fi;
}

function gilist()
{
    curl "https://www.toptal.com/developers/gitignore/api/list"
    VAL=$(curl https://www.gitignore.io/api/"$*")
}
