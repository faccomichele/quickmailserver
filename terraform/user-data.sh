#!/bin/bash

set -xe

sudo apt update # && sudo apt upgrade -y

sudo apt install docker.io git -y

cd /opt && git clone https://github.com/faccomichele/quickmailserver.git && cd quickmailserver/docker
docker compose up -d
# docker exec -ti <CONTAINER NAME> setup email add user@example.com
docker-compose exec mailserver setup email add admin@example.com
docker-compose exec mailserver setup email add info@example.com
