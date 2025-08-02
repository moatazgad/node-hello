terraform {
  required_version = ">= 1.0"
}

terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
    }
  }
}

# Docker Provider Configuration
provider "docker" {
  host = "unix:///var/run/docker.sock"

  registry_auth {
    address     = "registry-1.docker.io"
    username    = var.docker_username
    password    = var.docker_password
  }
}


# Docker Module
module "docker_app" {
  source = "../../modules/docker"

  project_name  = var.project_name
  environment   = var.environment
  docker_image  = var.docker_image
  app_port      = var.app_port
  external_port = var.external_port
  docker_username = var.docker_username
  docker_password = var.docker_password
  new_relic_license_key = var.new_relic_license_key
} 