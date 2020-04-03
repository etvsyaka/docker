#!/usr/bin/env bash

composerCommand=$1;
packege=$2;

if [ "$composerCommand" = "install" ]; then
    eval "docker exec -it app_php php /var/www/symfony/composer.phar install";
 elif [ "$composerCommand" = "require" ]; then
    eval "docker exec -it app_php php /var/www/symfony/composer.phar require $packege";
 elif [ "$composerCommand" = "update" ]; then
    eval "docker exec -it app_php php /var/www/symfony/composer.phar update";
 fi;