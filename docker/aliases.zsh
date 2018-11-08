
alias dc="docker-compose"
alias dcud="docker-compose up -d"
alias dcl="dc logs -f --tail=\"500\" web worker"
alias docker-clean="docker ps -a -q -f status=exited | xargs docker rm && docker images -q --filter \"dangling=true\" | xargs docker rmi"

# fix docker drift!
# alias drift="docker run --rm --privileged alpine hwclock -s"

# takes tag of a docker container and runs bash in said container
# investigate a container
function inv()
{
    docker run -it --rm "$1" bash
}

function run()
{
    docker run --rm "$1"
}
