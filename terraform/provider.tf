terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }

  required_version = "~> 1.9"
}

# Configure the DigitalOcean Provider
# Set the variable value as environment variables DIGITALOCEAN_ACCESS_TOKEN
provider "digitalocean" {}

