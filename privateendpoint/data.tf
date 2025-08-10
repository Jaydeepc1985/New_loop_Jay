data "azurerm_key_vault" "kvi" {
  for_each = var.kv_pe

  name                = each.value.key_vault_name
  resource_group_name = "jaydeep_rg"
}


data "azurerm_private_dns_zone" "kv" {
  name                = "privatelink.vaultcore.azure.net"
  resource_group_name = "jaydeep_rg1"
}
data "azurerm_subnet" "subnetd" {
  for_each = var.kv_pe

  name                 = each.value.subnet_name
  virtual_network_name = "JaydeepVnet"
  resource_group_name  = each.value.resource_group_name
}