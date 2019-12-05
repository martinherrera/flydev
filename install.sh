#!/bin/bash 
sudo docker-compose up -d

sudo docker exec -i -t flydevtestapp composer create-project --prefer-dist laravel/laravel .
sudo docker exec -i -t flydevtestapp composer require aimeos/aimeos-laravel
