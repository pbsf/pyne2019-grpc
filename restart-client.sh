#!/bin/sh -e

docker ps -a | awk '{ print $1,$2 }' | grep pyne/client | awk '{print $1 }' | xargs -I {} docker rm {}
docker-compose -f client-compose.yml up --build
