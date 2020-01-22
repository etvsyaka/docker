#!/usr/bin/env bash

task=$1

if [ "$task" = "up" ]
 then
    eval "docker-compose up -d"
  elif [ "$task" = "build" ]; then
    eval "docker-compose build"
  elif [ "$task" = "down" ]; then
    eval "docker-compose down"
  elif [ "$task" = "run" ]; then
    eval "docker-compose up -d"
    eval "docker exec -it app_php /bin/bash"
 fi