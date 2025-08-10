data "azurerm_key_vault" "kvi" {
  name                = "jaydeep-key-vault"
  resource_group_name = "jaydeep_rg1"
}

data "azurerm_private_dns_zone" "dzone" {
  name                = "privatelink.vaultcore.azure.net"
  resource_group_name = "jaydeep_rg1"
}

data "azurerm_private_endpoint_connection" "pe_connection" {
  name                = "example-private-endpoint"
  resource_group_name = "example-rg"
}