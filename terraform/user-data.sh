#!/bin/bash

set -xe

sudo apt update # && sudo apt upgrade -y

sudo apt install docker.io git -y

sudo curl -L "https://github.com/docker/compose/releases/download/v2.29.7/docker-compose-$(uname -s)-$(uname -m)" -o /usr/bin/docker-compose
sudo chmod +x /usr/bin/docker-compose

cd /opt && git clone https://github.com/faccomichele/quickmailserver.git && cd quickmailserver/docker

DOMAIN=$(hostname -f | cut -d '.' -f2-)
echo "HOSTNAME=$(hostname -f)" > .env
echo "DOMAIN=$DOMAIN" >> .env
docker-compose up -d

SECURE_PASSWORD=$(openssl rand -base64 32)
docker-compose exec mailserver setup email add admin@$DOMAIN $SECURE_PASSWORD
docker-compose exec mailserver setup email add info@$DOMAIN $SECURE_PASSWORD
