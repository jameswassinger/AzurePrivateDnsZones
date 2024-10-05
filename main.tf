resource "azurerm_resource_group" "rg-pdz" {
  name     = "${var.resource_group_name}-${var.tier}"
  location = var.location
}

data "azurerm_virtual_network" "management" {
  provider            = azurerm.management
  name                = "vnet-management-cus"
  resource_group_name = "rg-CentralUSManagementNetwork"
}

module "pdzs" {
  source = "../../modules/pdz"
  # depends_on required to ensure the resource group is created before the private DNS zones
  depends_on = [azurerm_resource_group.rg-pdz]
  # The function toset() is used to convert the list of private DNS zone names to a set.
  for_each                     = toset(var.private_dns_zone_names)
  existing_resource_group_name = "${var.resource_group_name}-${var.tier}"
  private_dns_zone_name        = each.value
  managment_vnet_id            = data.azurerm_virtual_network.management.id
  management_vnet_name         = data.azurerm_virtual_network.management.name
}