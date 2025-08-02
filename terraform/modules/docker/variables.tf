variable "project_name" {
  description = "Name of the project"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "docker_image" {
  description = "Docker image to run (from Docker Hub)"
  type        = string
}

variable "app_port" {
  description = "Internal port the application runs on"
  type        = number
  default     = 3000
}

variable "external_port" {
  description = "External port to expose the application on"
  type        = number
  default     = 3000
}

variable "create_volume" {
  description = "Whether to create a Docker volume for persistent data"
  type        = bool
  default     = false
}

variable "container_name" {
  description = "Custom name for the container"
  type        = string
  default     = null
} 

variable "docker_username" {
  description = "Docker Hub username"
  type        = string
}

variable "docker_password" {
  description = "Docker Hub token"
  type        = string
  sensitive   = true
}

variable "new_relic_license_key" {
  type        = string
  sensitive   = true
}