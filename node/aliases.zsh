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
    elif [ -f justfile ] && [ "$(just --dump --dump-format json | jq '.recipes.build')" != "null" ];then
        just build
    else
        echo "Can't guess build method, do it yourself"
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
