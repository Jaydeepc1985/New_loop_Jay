module "xyz" {
  source  = "../resource"
  rg_name = var.rg_name_x
}
module "abc" {
  source     = "../storage"
  stg        = var.stg_x
  cnt        = var.cnt_x
  depends_on = [module.xyz]
}
module "flexi_server" {
  source       = "../flexi server"
  flexi_server = var.flexi_server_x
  depends_on   = [module.xyz, module.VM]
}
module "Vnet" {
  source     = "../vnet"
  vnet_y     = var.vnet_x
  depends_on = [module.xyz]

}
module "subnet" {
  source     = "../subnet"
  sub_front  = var.sub_front_x
  depends_on = [module.Vnet]
  
}
module "public_ip" {
  source     = "../publicip"
  public_ip  = var.public_ip_x
  depends_on = [module.Vnet]

}
module "nic" {
  source       = "../nic"
  nic_config   = var.nic_config_x
  depends_on   = [module.subnet, module.public_ip]
}
module "VM" {
  source      = "../VM"
  frontend_vm = var.frontend_vm_x
  backend_vm  = var.backend_vm_x
  depends_on  = [module.nic, module.kv_admin_roles]

}
module "NSG" {
  source     = "../NSG" 
  NSG        = var.NSG_x
  depends_on = [module.nic, module.VM]
}

# module "sqlsrv" {
#   source     = "../sqlsrv"
#   sql-server = var.sql-server_x
#   depends_on = [module.abc]
# }
# module "sqldb" {
#   source       = "../sqldb"
#   sql-database = var.sql-database_x
#   depends_on   = [module.sqlsrv]
# }

module "key_vaults" {
  source                   = "../key-vaults"
  key_vaults               = var.key_vaults_x
  depends_on               = [module.xyz]
}

module "kv_admin_roles" {
  source                   = "../keyvault-role"
  kv_admin_roles           = var.kv_admin_roles_x
  depends_on               = [module.key_vaults]
}
# module "dnszone" {
#   source                   = "../private_DNS_zone"
#   dnszone                  = var.dnszone_x
#   depends_on               = [module.xyz, module.key_vaults, module.kv_admin_roles, module.Vnet, module.subnet]
  
# }
# module "dnslink" {
#   source                   = "../Privatednslink"
#   dnslink                  = var.dnslink_x
#   depends_on               = [module.dnszone]
# }
# module "kv-pe" {
#   source                   = "../privateendpoint"
#   kv_pe                    = var.kv_pe_x
#   depends_on               = [module.dnslink]
# }

