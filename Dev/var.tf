variable "rg_name_x" {
  type = map(object({
    name     = string
    location = string
  }))

}
variable "stg_x" {
  type = map(object({
    name                     = string
    resource_group_name      = string
    location                 = string
    account_tier             = string
    account_replication_type = string
  }))
}

variable "cnt_x" {
  type = map(object({
    name                  = string
    storage_account_id    = string
    container_access_type = string
  }))

}
variable "flexi_server_x" {
  type = map(object({
    name                   = string
    resource_group_name    = string
    location               = string
    administrator_login    = string
    administrator_password = string
    sku                    = string
    version                = string
    tags                   = map(string)
  }))

}
variable "vnet_x" {
  type = map(object({
    name                = string
    address_space       = list(string)
    location            = string
    resource_group_name = string
  }))

}

variable "sub_front_x" {
  type = map(object({
    name                 = string
    resource_group_name  = string
    virtual_network_name = string
    address_prefixes     = list(string)

  }))

}

variable "public_ip_x" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    allocation_method   = string
    sku                 = string
  }))
}
variable "nic_config_x" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    subnet_name         = string
    public_ip_name      = string
    ip_configuration    = list(object({
      name                          = string
      private_ip_address_allocation = string
    }))
  }))
}

variable "frontend_vm_x" {
  type = map(object({
    name                            = string
    location                        = string
    resource_group_name             = string
    size                            = string
    admin_username                  = string
    admin_password                  = string
    disable_password_authentication = bool
    network_interface_ids           = list(string)
    os_disk = map(object({
      name                 = string
      caching              = string
      storage_account_type = string
      disk_size_gb         = number
    }))
    source_image_reference = map(object({
      publisher = string
      offer     = string
      sku       = string
      version   = string
    }))

  }))

}
variable "backend_vm_x" {
  type = map(object({
    name                            = string
    location                        = string
    resource_group_name             = string
    size                            = string
    admin_username                  = string
    admin_password                  = string
    disable_password_authentication = bool
    network_interface_ids           = list(string)
    os_disk = map(object({
      name                 = string
      caching              = string
      storage_account_type = string
      disk_size_gb         = number
    }))
    source_image_reference = map(object({
      publisher = string
      offer     = string
      sku       = string
      version   = string
    }))

  }))

}
variable "NSG_x" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    security_rule = map(object({
      name                       = string
      priority                   = number
      direction                  = string
      access                     = string
      protocol                   = string
      source_port_range          = string
      destination_port_range     = string
      source_address_prefix      = string
      destination_address_prefix = string
    }))
    tags = map(string)
  }))

}
variable "sql-server_x" {
  description = "Map of SQL Server configurations"
  type = map(object({
    name                         = string
    resource_group_name          = string
    location                     = string
    version                      = string
    administrator_login          = string
    administrator_login_password = string
    minimum_tls_version          = string
    tags                         = map(string)
  }))

}
variable "sql-database_x" {
  description = "Map of SQL Database configurations"
  type = map(object({
    name         = string
    server_id    = string
    max_size_gb  = number
    sku_name     = string
    enclave_type = string
    tags         = map(string)
  }))
}
variable "key_vaults_x" {
  description = "Map of Key Vault configurations"
  type        = map(object({
    name                = string
    resource_group_name = string
    location            = string
    sku_name            = string
    tenant_id           = string
    tags                = map(string)
  }))
}

variable "kv_admin_roles_x" {
  description = "Map of Key Vault admin roles"
  type = map(object({
    principal_id         = string
    role_definition_name = string
  }))
  
}
variable "dnszone_x" {
  description = "Map of private DNS zones"
  type        = map(object({
    name                = string
    resource_group_name = string
  }))
}
variable "dnslink_x" {
  description = "Map of DNS zone virtual network links"
  type        = map(object({
    name                  = string
    resource_group_name   = string
    private_dns_zone_name = string
    virtual_network_id    = string
  }))
  
}
variable "kv_pe_x" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    subnet_name         = string
    key_vault_name      = string

    private_service_connection = map(object({
      name                           = string
      private_connection_resource_id = string
      subresource_names              = list(string)
      is_manual_connection           = bool
    }))

    private_dns_zone_group = map(object({
      name                 = string
      private_dns_zone_ids = list(string)
    }))
  }))
}
