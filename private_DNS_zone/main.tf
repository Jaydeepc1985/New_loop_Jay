resource "azurerm_private_dns_zone" "dns" {
    for_each = var.dnszone
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
}

