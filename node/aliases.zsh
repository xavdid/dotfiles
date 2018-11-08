# Tries to run an app in development mode
function nod()
{
    if [ -f ./Procfile.dev ]; then
        foreman start -f Procfile.dev
    elif [[ -f package.json && $(jq '.scripts.dev' package.json) != 'null' ]];then
        npm run dev
    else
        nodemon
    fi
}
alias pj="cat package.json | jq"

function renpm()
{
    rm -rf node_modules && npm i
}

function b() {
    if [ -f build.sh ];then
        ./build.sh "$@"
    elif [ -f build ];then
        ./build "$@"
    elif [ -f package.json ] && [ "$(jq '.scripts.build' package.json)" != "null" ];then
        if [ -f yarn.lock ];then
          yarn build
        else
          npm run build
        fi
    else
        echo "Can't guess build method, do it yourself"
    fi
}

function t() {
    if [ -f spec/test.rb ];then
        ruby spec/test.rb "$@"
    elif [[ -f package.json && $(jq '.dependencies["zapier-platform-core"]' package.json) != 'null' ]];then
        # nice wrapper for npm test
        zapier test "$@"
    elif [ -f package.json ];then
      if [ -f yarn.lock ];then
        yarn test "$@"
      else
        # could check if test key is defined, but since npm supplies it by default, it's fine
        npm test "$@"
      fi
    elif [ -f tests.py ];then # for crypto, not sure what the standard name is
        python tests.py
    else
        echo "Can't guess testing method, do it yourself"
    fi
}

alias wj="warriorjs"
alias sf="standard --fix"

export NVM_DIR="/Users/david/.nvm"
# alias nvmwrite="nvm alias default $(nvm current) && $(nvm version default) > ~/.nvm_default"

[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
# see: https://github.com/creationix/nvm/issues/110#issuecomment-190125863
# autoload -U add-zsh-hook
# load-nvmrc() {
#     if [[ -f .nvmrc && -r .nvmrc ]]; then
#         if [[ $(nvm current) != $(cat .nvmrc) ]];then
#             nvm use
#         fi
#     elif [[ $(nvm current) != $(cat ~/.nvm_default) ]]; then
#         # need to update when I update nvm default version
#         nvm use default
#     fi
# }
# add-zsh-hook chpwd load-nvmrc
