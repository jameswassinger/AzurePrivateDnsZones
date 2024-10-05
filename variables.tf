variable "subscription_id" {
  description = "The Azure subscription ID"
  type        = string
}

variable "mgmt_subscription_id" {
  description = "The Azure subscription ID for management resources"
  type        = string
}

variable "tenant_id" {
  description = "The Azure tenant ID"
  type        = string
}

variable "location" {
  description = "The Azure region"
  type        = string
  default     = "East US"

  validation {
    condition     = contains(["East US2", "Central US"], var.location)
    error_message = "Location must be East US2 or Central US"
  }
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "private_dns_zone_names" {
  description = "The name of the private DNS zone"
  type        = list(string)
}
