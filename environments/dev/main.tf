resource "azurerm_resource_group" "rg1" {
  name     = var.resource_group
  location = var.location

}

module "virtual_network" {
  source                       = "../../modules/network"
  resource_group               = azurerm_resource_group.rg1.name
  location                     = var.location
  virtual_network_name         = var.virtual_network_name
  virtual_network_addressspace = var.virtual_network_addressspace
  subnet1_name                 = var.subnet1_name
  subnet2_name                 = var.subnet2_name
  subnet1_addressprefix        = var.subnet1_addressprefix
  subnet2_addressprefix        = var.subnet2_addressprefix
  network_securitygroup_name   = var.network_securitygroup_name
  vm1_nic                      = var.vm1_nic
   environment                 = var.environment
  number_of_vms                = var.number_of_vms

}

# Grab the NIC IDs from network module
output "nic_ids" {
  value = module.virtual_network.nic_ids
}

module "virtual_machine" {
  source = "../../modules/vm"
  resource_group               = azurerm_resource_group.rg1.name
  location                     = var.location
  environment                  = var.environment
  number_of_vms                = var.number_of_vms
  nic_ids        = module.virtual_network.nic_ids

 
}