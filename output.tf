output "resource_group_name" {
  value = azurerm_resource_group.rg-pdz.name
}

output "pdz_ids" {
  value = module.pdzs.pdz_ids
}