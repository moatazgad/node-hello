# This module manages Docker containers running locally


resource "docker_image" "my_image" {
  name         = var.docker_image
  keep_locally = true
}


# Docker Container Resource
resource "docker_container" "app" {
  name  = "${var.project_name}-${var.environment}"
  image = docker_image.my_image.image_id

  env = [
    "NEW_RELIC_LICENSE_KEY=${var.new_relic_license_key}",
    "NEW_RELIC_APP_NAME=${var.project_name}-${var.environment}",
    "NODE_ENV=${var.environment}",
    "PORT=${var.app_port}"
  ]

  ports {
    internal = var.app_port
    external = var.external_port
  }


  restart = "unless-stopped"

  networks_advanced {
    name = docker_network.app_network.name
  }

  labels {
    label = "project"
    value = var.project_name
  }

  labels {
    label = "environment"
    value = var.environment
  }

  labels {
    label = "managed_by"
    value = "terraform"
  }

}

# Docker Network
resource "docker_network" "app_network" {
  name = "${var.project_name}-network"
  
  driver = "bridge"
  
}

# Docker Volume for persistent data (if needed)
resource "docker_volume" "app_data" {
  count = var.create_volume ? 1 : 0
  
  name = "${var.project_name}-data-${var.environment}"
  driver = "local"
} 