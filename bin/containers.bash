#!/usr/bin/env bash

task=$1
option=$2

if [ "$task" = "start" ]
 then
    if [ "$DEBUG_MODE" = 1 ]
    then
      eval "docker-compose up -d";
    else
      eval "docker-compose -f docker-compose-prod.yml up -d";
    fi;
  elif [ "$task" = "stop" ]; then
    eval "docker-compose down";
  elif [ "$task" = "build" ]; then
    if [ "$DEBUG_MODE" = 1 ] 
    then
      eval "docker-compose up -d";
    else
      eval "docker-compose -f docker-compose-prod.yml build -d";
    fi;
  elif [ "$task" = "restart" ]; then
    eval "docker-compose restart";
  elif [ "$task" = "status" ]; then
    eval "docker ps";
  elif [ "$task" = "bash" ]; then
    eval "docker exec -it app_php /bin/bash";
    fi;