
# 2. Key Vault with RBAC enabled
resource "azurerm_key_vault" "kv_jay" {
    for_each = var.key_vaults
  name                        = each.value.name
  location                    = each.value.location
  resource_group_name         = each.value.resource_group_name
  tenant_id                   = each.value.tenant_id
  sku_name                    = "standard"
  enable_rbac_authorization   = true  # <-- RBAC enabled
  public_network_access_enabled = true
  purge_protection_enabled    = true
  soft_delete_retention_days  = 7
  
  network_acls {
    bypass = "AzureServices"
    default_action = "Deny"
    
  }
}

