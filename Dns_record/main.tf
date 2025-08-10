resource "azurerm_private_dns_a_record" "kv_record" {
    for_each = var.kv_record
  name                = data.azurerm_key_vault.kvi.name
  zone_name           = data.azurerm_private_dns_zone.dzone.name
  resource_group_name = each.value.resource_group_name
  ttl                 = 300
  records             = [azurerm_private_endpoint.kv_pe.private_service_connection[0].private_ip_address]
}