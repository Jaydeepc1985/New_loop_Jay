variable "dnszone" {
  description = "Map of private DNS zones"
  type        = map(object({
    name                = string
    resource_group_name = string
  }))
  
  
}

