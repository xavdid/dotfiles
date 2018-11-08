
function gemdeploy()
{
    rm ./*.gem
    gem build "$(echo ./*.gemspec)"
    read -r "push?Do you want to push to RubyGems? "
    # shellcheck disable=SC2154
    if [[ "$push" =~ ^[Yy]$ ]]
    then
        gem push "$(echo ./*.gem)"
    fi
}

# who's on my port?
alias cig='lsof -i :4567'

function sin()
{
    if [ -f ./Procfile.dev ]; then
        foreman start -f Procfile.dev
    else
        sinatra
    fi
}

function sinatra()
{
    if [ -f ./config.ru ]; then
        rerun "bundle exec rackup -p 4567" -p "**/*.{rb,js,coffee,css,scss,erb,html,haml,ru,yml,json}"
    else
        rerun "bundle exec ruby ${PWD##*/}.rb" -p "**/*.{rb,js,coffee,css,scss,erb,html,haml,ru,yml,json}"
    fi
}
