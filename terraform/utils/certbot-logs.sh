# Print out cerbot logs via SSH, this relies on Terraform output so it must be executed within the terraform folder

ssh -o StrictHostKeyChecking=no -i ~/.ssh/id_rsa_quick_mail_server root@$(terraform output -json | jq -r .mailserver.value.ipv4) cat /opt/quickmailserver/docker/docker-data/certbot/logs/*.log
