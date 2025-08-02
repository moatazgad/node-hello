# Project Configuration
variable "project_name" {
  description = "Name of the project"
  type        = string
  default     = "node-hello"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

# Docker Configuration
variable "docker_image" {
  description = "Docker image from Docker Hub"
  type        = string
}

variable "app_port" {
  description = "Internal application port"
  type        = number
  default     = 3000
}

variable "external_port" {
  description = "External port to expose"
  type        = number
  default     = 3000
}

variable "create_volume" {
  description = "Whether to create a Docker volume for persistent data"
  type        = bool
  default     = false
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