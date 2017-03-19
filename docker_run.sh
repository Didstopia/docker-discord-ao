#!/bin/bash

./docker_build.sh

docker run --env-file .env -v $(pwd)/data:/usr/src/app/storage --name discord-ao -it --rm didstopia/docker-discord-ao:latest
