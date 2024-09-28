# Create a new SSH key
resource "digitalocean_ssh_key" "mailserver" {
  name       = "quick-mail-server"
  public_key = file("/home/faccomichele/.ssh/id_rsa_quick_mail_server.pub")
}

# Create a new Droplet using the SSH key
resource "digitalocean_droplet" "mailserver" {
  image     = "ubuntu-24-04-x64"
  name      = "mail.${var.subdomain}.${var.domain-name}"
  region    = "sgp1"
  size      = "s-1vcpu-1gb-amd"
  ssh_keys  = [digitalocean_ssh_key.mailserver.fingerprint]
  ipv6      = true
  tags      = [ "terraform", "quick-mail-server" ]
  user_data = file("user-data.sh")
}

resource "digitalocean_firewall" "mailserver" {
  name          = "quick-mail-server"
  droplet_ids   = [digitalocean_droplet.mailserver.id]

  dynamic "inbound_rule" {
    for_each = var.inbound-ports
    content {
      protocol         = "tcp"
      port_range       = inbound_rule.value
      source_addresses = ["0.0.0.0/0", "::/0"]
    }
  }

  # No restrictions outbound
  outbound_rule {
    protocol              = "tcp"
    port_range            = "1-65535"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }
  outbound_rule {
    protocol              = "udp"
    port_range            = "1-65535"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }
  outbound_rule {
    protocol              = "icmp"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }
}

output "mailserver" {
  value = {
    "ipv4" = digitalocean_droplet.mailserver.ipv4_address
    "ipv6" = digitalocean_droplet.mailserver.ipv6_address
  }
}
