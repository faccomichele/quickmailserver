variable "domain-name" {
  type    = string
}

# Add an A record to the domain for www.example.com.
# resource "digitalocean_record" "www" {
#   domain = var.domain-name
#   type   = "A"
#   name   = "www"
#   value  = "192.168.0.11"
# }

# Add a MX record for the example.com domain itself.
# resource "digitalocean_record" "mx" {
#   domain   = var.domain-name
#   type     = "MX"
#   name     = "@"
#   priority = 10
#   value    = "mail.example.com."
# }
