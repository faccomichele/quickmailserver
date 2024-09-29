# Install Terraform Ubuntu

```bash
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install terraform
```

# Generate SSH Key

```bash
ssh-keygen
```

You need to set absolute path to `~/.ssh/id_rsa_quick_mail_server`, password is optional, but suggested

# Import token

```bash
source do-token.sh
```

# Deploy using Terraform

```bash
terraform init
terraform plan
terraform apply -auto-approve -var "domain-name=example.com"
terraform output
```

# Connect to the host instance

**_NOTE_:** You want to install `jq` before running these scripts!

All the scripts are located under the utils folder

# Test DNS Records

```bash
dig @1.1.1.1 +short MX test.example.com
dig @1.1.1.1 +short A mail.test.example.com
dig @1.1.1.1 +short -x IP_ADDRESS_FROM_A_QUERY_ABOVE
```

# Troubleshooting

`Error: Error creating droplet: POST https://api.digitalocean.com/v2/droplets: 404 (request "xxxxxx-xxxx-xxxx-xxxx-xxxxxxxxx") subnet status is not available`

The above means the Default VPC for the region has not being created just yet, retry in a few minutes.
