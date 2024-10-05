data "azurerm_resource_group" "existing_rg" {
  name = var.existing_resource_group_name
}

resource "azurerm_private_dns_zone" "pdz" {
  name                = var.private_dns_zone_name
  resource_group_name = data.azurerm_resource_group.existing_rg.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "pdz_vnet_link" {
  name                  = "vnet-link-${var.management_vnet_name}-${var.private_dns_zone_name}"
  resource_group_name   = data.azurerm_resource_group.existing_rg.name
  private_dns_zone_name = azurerm_private_dns_zone.pdz.name
  virtual_network_id    = var.managment_vnet_id
}