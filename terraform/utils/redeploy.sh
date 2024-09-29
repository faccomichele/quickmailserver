# NOTE: When taking the server down and recreating it, sometimes certbot fails to obtain the certificate, because it still relies on
#       the old IP address. Digital Ocean only allows you to specify 1800 seconds for TTL, which is 30 minutes. This means tha if
#       certbot tried to resolve you previous server name, if will store the record as valid for 30 minutes time, and there is no
#       alternative, but to wait that the change propagates. So, I create this script to manually restart the deployment. But, the
#       cheapest option is, taking down the server, going for a coffee or a walk and come back later and create a brand new deployment.

# Redeploy the application via SSH, this relies on Terraform output so it must be executed within the terraform folder

ssh -o StrictHostKeyChecking=no -i ~/.ssh/id_rsa_quick_mail_server root@$(terraform output -json | jq -r .mailserver.value.ipv4) 'cd /opt/quickmailserver/docker && docker-compose down'
ssh -o StrictHostKeyChecking=no -i ~/.ssh/id_rsa_quick_mail_server root@$(terraform output -json | jq -r .mailserver.value.ipv4) 'cd /opt/quickmailserver/docker && docker-compose up -d'