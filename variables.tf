##############################################################################
# Variables
##############################################################################

variable "ibmcloud_api_key" {
  description = "The IBM Cloud platform API key needed to deploy IAM enabled resources."
  type        = string
  sensitive   = true
}

variable "region" {
  description = "IBM Cloud Region where resources will be provisioned"
  type        = string
  default     = "us-east"
  validation {
    error_message = "Region must be in a supported IBM VPC region."
    condition     = contains(["us-south", "us-east", "br-sao", "ca-tor", "eu-gb", "eu-de", "jp-tok", "jp-osa", "au-syd"], var.region)
  }
}

variable "prefix" {
  description = "Name prefix that will be prepended to named resources"
  type        = string
  default     = "iac"
  validation {
    error_message = "Prefix must begin with a lowercase letter and contain only lowercase letters, numbers, and - characters. Prefixes must end with a lowercase letter or number and be 16 or fewer characters."
    condition     = can(regex("^([a-z]|[a-z][-a-z0-9]*[a-z0-9])", var.prefix)) && length(var.prefix) <= 16
  }
}

variable "account_id" {
  description = "IBM Account ID where resources will be provisioned"
  type        = string
}

variable "secrets_manager_example_secret_arbitrary_secret_data" {
  description = "Data for example secret arbitrary secret data"
  type        = string
  sensitive   = true
  default     = "arbitrary"
}

variable "secrets_manager_example_secret_username" {
  description = "Example secret username"
  type        = string
  sensitive   = true
  default     = "username"
}

variable "secrets_manager_example_secret_password" {
  description = "Example secret password"
  type        = string
  sensitive   = true
  default     = "1VeryGoodPasword?"
}

##############################################################################
