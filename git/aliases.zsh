# Use `hub` as our git wrapper:
#   https://github.com/github/hub

# this outputs "alias git=hub"
eval "$(hub alias -s)"

# alias g="git"
alias purr="git pull --rebase"
alias gs="git status"
alias gp="git push"
alias gd="git diff"
alias gt="git log --graph --oneline --decorate"
alias gb="git branch"
alias gm="git merge"
alias gc="git commit"

alias ch="git checkout"

function ggg() { git add --all .; git commit -m "$1"; }
function gug() { git add -u .; git commit -m "$1"; }

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

# push and set upstream branch
# this doesn't work with my config?
# function gpu() {
#     BRANCH=$(git rev-parse --abbrev-ref HEAD)
#     echo $BRANCH
#     git push -u origin "$BRANCH"
# }

# update remote to match new username
# function rem() {
#     [[ $(git remote get-url origin) =~ /(.*)\.git$ ]] &&
#     # this breaks if we pay attention to shellcheck
#     git remote set-url origin "git@github.com:xavdid/$match[1].git"
# }

# pulled from https://docs.gitignore.io/install/command-line
function gi() {
    curl -sLw "\n" "https://www.toptal.com/developers/gitignore/api/$@" > .gitignore
}

function gilist()
{
    curl "https://www.toptal.com/developers/gitignore/api/list"
    VAL=$(curl https://www.gitignore.io/api/"$*")
}
