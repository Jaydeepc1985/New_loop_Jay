
resource "azurerm_storage_container" "jaydeep-cnt" {
    for_each = var.cnt
    name                  = each.value.name
    storage_account_id    = azurerm_storage_account.jaydeepstg[each.value.storage_account_id].id
    container_access_type  = each.value.container_access_type
    
      
}