#!/bin/zsh

#
# Some basic docker functions that could come in handy.
# These are different from those listed in ./.zsh/functions/docker
# because those zsh functions cannot be imported into the usr-local-bin
# project
#

is_docker_service_healthy() {
    service="$1"
    container_id="$(docker ps -q -f name=$service)"

    if [ "$container_id" = "" ]; then
        return 1
    fi

    health_status="$(docker inspect -f "{{.State.Status}}" "$container_id")"

    if [ "$health_status" = "running" ] || [ "$health_status" = 'starting' ]; then
        return 0
    else
        return 1
    fi
}

stop_all_running_containers() {
    docker stop $(docker ps -a -q)
}
