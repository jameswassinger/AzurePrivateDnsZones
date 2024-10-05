variable "existing_resource_group_name" {
  description = "The name of the existing resource group"
  type        = string

}

variable "private_dns_zone_name" {
  description = "The name of the private DNS zone"
  type        = string

}

variable "managment_vnet_id" {
  description = "The ID of the management VNet"
  type        = string

}

variable "management_vnet_name" {
  description = "The name of the management VNet"
  type        = string

}