#!/usr/bin/env bash

task=$1
option=$2

if [ "$task" = "start" ]
 then
    eval "docker-compose -f docker-compose.dev.yml up -d"
  elif [ "$task" = "stop" ]; then
    eval "docker-compose down"
  elif [ "$task" = "build" ]; then
    eval "docker-compose -f docker-compose.dev.yml build -d"
  elif [ "$task" = "restart" ]; then
    eval "docker-compose restart"
  elif [ "$task" = "status" ]; then
    eval "docker ps"
  elif [ "$task" = "bash" ]; then
    eval "docker exec -it app_php /bin/bash"
  elif [ "$task" = "test" ]; then
    if [ "$option" = "coverage" ]; then
        eval "docker exec -ti app_php ./var/www/symfony/phpunit  \
        -c ./var/www/symfony/phpunit.xml.dist \
        --coverage-html /var/www/symfony/docs/coverage/"
    else
        eval "docker exec -ti app_php ./var/www/symfony/phpunit  \
        -c ./var/www/symfony/phpunit.xml.dist";
    fi;
  elif [ "$task" = "composer-install" ]; then
    eval "docker exec -it app_php php /var/www/symfony/composer.phar install";
  elif [ "$task" = "composer-require" ]; then
    eval "docker exec -it app_php php /var/www/symfony/composer.phar require $option";
  elif [ "$task" = "composer-update" ]; then
    eval "docker exec -it app_php php /var/www/symfony/composer.phar update";
 fi;