##Azure Network configuration
resource "azurerm_virtual_network" "vnet" {
    name =var.virtual_network_name
    resource_group_name = var.resource_group
    location =  var.location
    address_space  = var.virtual_network_addressspace
    depends_on = [ var.resource_group ]
}
  
resource "azurerm_subnet" "subnet1" {
  name                 = var.subnet1_name
  resource_group_name  = var.resource_group
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.subnet1_addressprefix
  depends_on = [ azurerm_virtual_network.vnet ]

}

resource "azurerm_subnet" "subnet2" {
  name                 = var.subnet2_name
  resource_group_name  = var.resource_group
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.subnet2_addressprefix
  depends_on = [ azurerm_virtual_network.vnet ]

}
  


resource "azurerm_network_security_group" "nsg" {
  name                = var.network_securitygroup_name
  location            = var.location
  resource_group_name = var.resource_group
  depends_on = [ var.resource_group]
}

resource "azurerm_network_security_rule" "nsg_rdprule" {
  name                        = "AllowRDP"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "3389"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = var.resource_group
  network_security_group_name = var.network_securitygroup_name
  depends_on = [ var.resource_group,azurerm_network_security_group.nsg]
}

resource "azurerm_network_interface" "vm_nic" {
  count = var.number_of_vms
  name                = "${var.environment}VM${count.index}"
  location            = var.location
  resource_group_name = var.resource_group

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet1.id
    private_ip_address_allocation = "Dynamic"

  }
  depends_on = [ azurerm_subnet.subnet1 ]
}

output "nic_ids" {
  description = "List of NIC IDs created in this module"
  value       = azurerm_network_interface.vm_nic[*].id
}
