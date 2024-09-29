# Add an A record for your domain in relation to this mail server
resource "digitalocean_record" "mail" {
  domain = var.domain-name
  type   = "A"
  name   = "mail.${var.subdomain}"
  value  = digitalocean_droplet.mailserver.ipv4_address
  ttl    = 1800
}

# Add a MX record for your domain
resource "digitalocean_record" "mx" {
  domain   = var.domain-name
  type     = "MX"
  name     = "${var.subdomain}"
  priority = 10
  value    = "mail.${var.subdomain}.${var.domain-name}."
  ttl      = 1800
}
