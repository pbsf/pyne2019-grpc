#!/bin/sh -e

docker-compose -f server-compose.yml down
docker-compose -f server-compose.yml up --build
