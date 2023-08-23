##############################################################################
# Management VPC Variables
##############################################################################

variable "tags" {
  description = "List of tags"
  type        = list(string)
}

variable "region" {
  description = "IBM Cloud Region where resources will be provisioned"
  type        = string
  validation {
    error_message = "Region must be in a supported IBM VPC region."
    condition     = contains(["us-south", "us-east", "br-sao", "ca-tor", "eu-gb", "eu-de", "jp-tok", "jp-osa", "au-syd"], var.region)
  }
}

variable "prefix" {
  description = "Name prefix that will be prepended to named resources"
  type        = string
  validation {
    error_message = "Prefix must begin with a lowercase letter and contain only lowercase letters, numbers, and - characters. Prefixes must end with a lowercase letter or number and be 16 or fewer characters."
    condition     = can(regex("^([a-z]|[a-z][-a-z0-9]*[a-z0-9])", var.prefix)) && length(var.prefix) <= 16
  }
}

variable "management_rg_id" {
  description = "ID for the resource group management-rg"
  type        = string
}

##############################################################################
