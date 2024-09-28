#!/bin/bash

sudo apt update # && sudo apt upgrade -y

sudo apt install docker.io git -y

cd /opt && git clone https://github.com/faccomichele/quickmailserver.git && cd quickmailserver/docker
