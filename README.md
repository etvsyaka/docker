# Docker containers VS. Bash scripting

## In this docker-compose project contains such containers as:

 * nginx:latest
 * MySQL
 * PHP 7.3
 * PhpMyAdmin
 * Mailcatcher
 * Elasticsearch
 * RabbitMQ
 * Redis

## Overview

Repository provides two docker-compose files. One for development environment and one for production.
In the root of repository located vca.bash script which allow to control docker containers such as:
start, build, down and some actions inside them as composer update/install, etc.

Nginx config is located at Nginx directory and Nginx's log files there too in directory logs.

php.ini file is located under php-fpm directory. Also it's available to modify PHP container's 
Dockerfile.

## Navigations

- Content
  * Installation
  * One ring for rule... | One script for control...
  * PHPUnit
  * Control status of Docker-compose containers
  * It's bigger inside than outside | Inside container
  * Composer
- Plan of improvements
- Authors

## Content

#### Installation

1. First go to the root folder of project which you'll be dockerized
2. Open terminal there and run command:

```
vasyltarasov@Vasyls-MBP ~ % git clone git@github.com:etvsyaka/docker.git
Cloning into 'docker'...
........................

vasyltarasov@Vasyls-MBP ~ % cd docker/

vasyltarasov@Vasyls-MBP ~ % ./bin/containers.bash build
vasyltarasov@Vasyls-MBP ~ % ./bin/containers.bash start
vasyltarasov@Vasyls-MBP ~ % ./bin/containers.bash bash
```

3. After containers was builded and runed we need to edit /etc/hosts file

```
sudo vim /etc/hosts

# Add after first lines this:

127.0.0.1						symfony.loc, www.symfony.loc
```

4. Now you can access your app via address http://symfony.loc/
5. PhpMyAdmin locates at http://localhost:801 
6. Default settings is:

```
ServerAddress: symfony.loc/


MySQL Root User: 'root'
MySQL Root Password: 'symfony'

RabbitMQ User: 'rabbitmq'
RabbitMQ User Password: 'rabbitmq_password'
```

#### One ring for rule... | One script for control...

Run vca.bash without any parameters. Actually it's quite useless example because in this case 
script will do nothing.

```
//you're in root of your repository
vasyltarasov@Vasyls-MBP toplist% cd docker/
./bin/containers.bash
```

#### Control status of Docker-compose containers

Script provides basic commands to control containers status.

```
# Run all containers
vasyltarasov@Vasyls-MBP toplist % ./bin/containers.bash start

# Stop all continaers
vasyltarasov@Vasyls-MBP toplist % ./bin/containers.bash stop

# Restart all containers
vasyltarasov@Vasyls-MBP toplist % ./bin/containers.bash restart

# Build containers 
vasyltarasov@Vasyls-MBP toplist % ./bin/containers.bash build 

# Containers status 
vasyltarasov@Vasyls-MBP toplist % ./bin/containers.bash status
```

#### PHPUnit

PHP Unit tests must run from container so it's possible to do by these commands.

```
# It will run tests without coverage
vasyltarasov@Vasyls-MBP toplist % ./bin/containers.bash test

# It's possible to set second paramter to run tests with coverage
vasyltarasov@Vasyls-MBP toplist % ./bin/containers.bash test coverage
```

#### It's bigger inside than outside | Inside container

If you need to go inside container with PHP to change something or just to take a look you'll
need to run this command.

```
vasyltarasov@Vasyls-MBP toplist % ./bin/containers.bash ssh
# ... after it you'll get inside container as root user
```

Also inside container exists alias for bin/console
```
# It's the same commands
php bin/console
# It's the same commands
symfony
```

#### Composer

It's available to run some Composer commands via the script.

```
# It will run composer.phar and install all dependecies
vasyltarasov@Vasyls-MBP toplist % composer-install 

# It will update the information about packages and update packages if it possible
vasyltarasov@Vasyls-MBP toplist % composer-update

# It allow to install package with name {packageName}
vasyltarasov@Vasyls-MBP toplist % composer-require {packageName}
```

### Plan of improvements



### Author
Say thanks and your ideas to:

Vasyl Tarasov
vasiltarasov704@gmail.com
Telegram: @mage_f1