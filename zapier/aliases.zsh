
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

alias bastion="ssh davidbrownman@bastion.zapier.com"
alias rebastion="ssh-keygen -R bastion.zapier.com"

# CLI
alias zcliprod="cp ~/.zapierrc.prod ~/.zapierrc && export export ZAPIER_BASE_ENDPOINT=''"
alias zclipers="cp ~/.zapierrc.personal ~/.zapierrc && export export ZAPIER_BASE_ENDPOINT=''"
alias zclilocal="cp ~/.zapierrc.local ~/.zapierrc && export ZAPIER_BASE_ENDPOINT='http://localhost:8000'"
alias zdev="DISABLE_ZAPIER_ANALYTICS=1 $PROJECTS_ROOT/zapier/platform/packages/cli/src/bin/run"

# django
alias djm="docker-compose run web python backend/manage.py"
