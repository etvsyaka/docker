#!/usr/bin/env bash

$isCoverageEnabled=$1;

if [ "$isCoverageEnabled" = "true" ]; then
	eval "docker exec -ti app_php ./var/www/symfony/phpunit  \
	-c ./var/www/symfony/phpunit.xml.dist \
	--coverage-html /var/www/symfony/docs/coverage/";
else
	eval "docker exec -ti app_php ./var/www/symfony/phpunit  \
	-c ./var/www/symfony/phpunit.xml.dist";
fi;