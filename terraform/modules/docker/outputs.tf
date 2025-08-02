output "container_id" {
  description = "The ID of the Docker container"
  value       = docker_container.app.id
}

output "container_name" {
  description = "The name of the Docker container"
  value       = docker_container.app.name
}

output "container_exit_code" {
  description = "The exit code of the Docker container"
  value       = docker_container.app.exit_code
}

output "network_id" {
  description = "The ID of the Docker network"
  value       = docker_network.app_network.id
}

output "network_name" {
  description = "The name of the Docker network"
  value       = docker_network.app_network.name
}

output "app_url" {
  description = "The URL to access the application"
  value       = "http://localhost:${var.external_port}"
} 