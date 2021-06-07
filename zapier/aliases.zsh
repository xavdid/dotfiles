
function fupdate() {
    DTE=$(date +%-Y-%m-%d)
    FNAME="/Users/david/Dropbox/Apps/Editorial/Zapier/$DTE.md"
    # this part is covered by Zapier now
    # echo "## This Week\n\n* \n\n## Next Week\n\n* \n\n## Offline\n\n* \n\ntldr()" > $FNAME
    open $FNAME
}

function finn() {
    # DTE is still set from before
    UPDATE_PATH="/Users/david/Dropbox/Apps/Editorial/Zapier"
    mv "$UPDATE_PATH/$DTE.md" "$UPDATE_PATH/friday/$DTE.md"
    if [ $? -eq 0 ]; then
        echo "Done! Slack message soon"
    fi
}

alias bastion="cd /Users/david/projects/zapier/zapier/web && make lab-production-exec/38389"
alias rebastion="cd /Users/david/projects/zapier/zapier && git checkout develop && git pull && git checkout develop-d3217a0a082e9bf0d1d22a6883fb12289fabfcfa && git merge develop --ff && git push"

# CLI
alias zcliprod="cp ~/.zapierrc.prod ~/.zapierrc && export export ZAPIER_BASE_ENDPOINT=''"
alias zclipers="cp ~/.zapierrc.personal ~/.zapierrc && export export ZAPIER_BASE_ENDPOINT=''"
alias zclilocal="cp ~/.zapierrc.local ~/.zapierrc && export ZAPIER_BASE_ENDPOINT='http://localhost:8000'"
alias zdev="DISABLE_ZAPIER_ANALYTICS=1 $PROJECTS_ROOT/zapier/platform/packages/cli/src/bin/run"

# django
alias djm="docker-compose run --rm web python backend/manage.py"
alias dtest="djm test --keepdb --skip-checks --skip-db-setup"
