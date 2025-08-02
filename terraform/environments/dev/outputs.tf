# Docker Container Outputs
output "container_id" {
  description = "The ID of the Docker container"
  value       = module.docker_app.container_id
}

output "container_name" {
  description = "The name of the Docker container"
  value       = module.docker_app.container_name
}

output "container_exit_code" {
  description = "The exit code of the Docker container"
  value       = module.docker_app.container_exit_code
}

output "network_id" {
  description = "The ID of the Docker network"
  value       = module.docker_app.network_id
}

output "network_name" {
  description = "The name of the Docker network"
  value       = module.docker_app.network_name
}

output "app_url" {
  description = "The URL to access the application"
  value       = module.docker_app.app_url
}

output "docker_image" {
  description = "The Docker image being used"
  value       = var.docker_image
} 