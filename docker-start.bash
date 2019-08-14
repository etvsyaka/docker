#!/usr/bin/env bash

task=$1

if [ "$task" = "run" ]
 then
    eval "docker exec -it docker_php_1 /bin/bash"
  elif [ "$task" = "build" ]; then
    eval "docker"
    fi
 fi