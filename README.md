# quickmailserver
Quick Mail Server Setup

## Install Terraform Ubuntu

wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install terraform

## Generate SSH Key

ssh-keygen
> /home/faccomichele/.ssh/id_rsa_quick_mail_server

## Import token

source do-token.sh

## Deploy using Terraform

terraform init
terraform plan
terraform apply -auto-approve


### [Digital Ocean Referral Program](https://m.do.co/c/906edecb7fdc)

Everyone who subscribes using the link below gets $200 in credit over 60 days.

[![DigitalOcean Referral Badge](https://web-platforms.sfo2.cdn.digitaloceanspaces.com/WWW/Badge%201.svg)](https://www.digitalocean.com/?refcode=906edecb7fdc&utm_campaign=Referral_Invite&utm_medium=Referral_Program&utm_source=badge)
