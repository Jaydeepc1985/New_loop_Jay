data "azurerm_key_vault" "kvi" {
  name                = "jaydeep-key-vault"
  resource_group_name = "jaydeep_rg"
}

resource "azurerm_role_assignment" "kv_admin" {
  for_each             = var.kv_admin_roles
  principal_id         = each.value.principal_id
  role_definition_name = each.value.role_definition_name
  scope                = data.azurerm_key_vault.kvi.id
}

