#!/bin/bash 
sudo docker-compose up -d

sudo docker exec -i -t flydevtestapp composer install
sudo docker exec -i -t flydevtestapp composer dump-autoload
sudo docker exec -i -t flydevtestapp php artisan migrate --seed

sudo docker exec flydevtestapp php artisan serve --host=flydevtestapp --port=8000 &
