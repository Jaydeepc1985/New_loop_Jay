resource "azurerm_private_dns_zone_virtual_network_link" "dnslink" {
    for_each = var.dnslink
  name                  = each.value.name
  resource_group_name   = each.value.resource_group_name
  private_dns_zone_name = each.value.private_dns_zone_name
  virtual_network_id    = data.azurerm_virtual_network.vnetd.id
}