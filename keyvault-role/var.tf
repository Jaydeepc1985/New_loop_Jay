variable "kv_admin_roles" {
  description = "Map of Key Vault admin roles"
  type = map(object({
    principal_id         = string
    role_definition_name = string
  }))
  
}