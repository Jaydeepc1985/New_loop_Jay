variable "kv_record" {
  description = "Map of Key Vault DNS records"
  type        = map(object({
    name                = string
    resource_group_name = string
  }))
  
}