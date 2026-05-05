variable "subscription_id" {
  description = "Your Azure subscription ID. Find it with: az account show --query id -o tsv"
  type        = string
  sensitive   = true
}

variable "location" {
  description = "Azure region where resources will be created."
  type        = string
  default     = "eastus"
}

variable "environment" {
  description = "Environment label used in resource names (e.g. dev, staging, prod)."
  type        = string
  default     = "dev"
}

variable "project" {
  description = "Short project name used in resource names."
  type        = string
  default     = "lab"
}
