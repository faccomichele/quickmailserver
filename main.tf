# Create a new SSH key
resource "digitalocean_ssh_key" "mailserver" {
  name       = "Quick Mail Server"
  public_key = file("/home/faccomichele/.ssh/id_rsa_quick_mail_server.pub")
}

# Create a new Droplet using the SSH key
resource "digitalocean_droplet" "mailserver" {
  image     = "ubuntu-24-04-x64"
  name      = "quick-mail-server"
  region    = "sgp1"
  size      = "s-1vcpu-1gb-amd"
  ssh_keys  = [digitalocean_ssh_key.mailserver.fingerprint]
  ipv6      = true
  tags      = [
    "automation:terraform",
  ]
  user_data = file("user-data.sh")
}
