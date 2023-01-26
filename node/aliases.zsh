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
alias pj="<package.json | jq"

function scripts()
{
    if [ -f package.json ]; then
        echo "\n$(<package.json | jq --raw-output 'if .scripts then "  \(.scripts | keys[])" else "  no 'scripts' property in package.json" end')\n"
    else
        echo "No package.json file"
    fi
}


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
        if [ -f package-lock.json ];then
          npm run build
        else
          yarn build
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
      if [ -f package-lock.json ];then
        npm run test "$@"
      else
        # could check if test key is defined, but since npm supplies it by default, it's fine
        yarn test "$@"
      fi
    elif [ -f tests.py ];then # for cryptopals, not sure what the standard name is
        if [ -f poetry.lock ] ;then
            poetry run python tests.py
        else
            python tests.py
        fi
    # syntax highlighting on this line is off - the "#qN" is a valid glob pattern
    # see https://stackoverflow.com/a/41508466/1825390
    elif [[ -n *_test.go(#qN) ]];then
        go test
    else
        echo "Can't guess testing method, do it yourself"
    fi
}

# test:watch
function tw() {
    if [[ -f package.json && $(jq '.scripts["test:watch"]' package.json) != 'null' ]];then
      if [[ -f package-lock.json ]];then
        npm run test:watch "$@"
      else
        # could check if test key is defined, but since npm supplies it by default, it's fine
        yarn --silent test:watch "$@"
      fi
    else
        echo "No known test:watch method"
    fi
}

alias packing-list="echo '' && npm pack --dry-run --json | jq -r '.[0].files[].path' && echo ''"

# setup nodenv
eval "$(nodenv init -)"
# add global yarn to the path;
# do this here rather than a path file, once the path to yarn is available
export PATH="$(yarn global bin):$PATH"
