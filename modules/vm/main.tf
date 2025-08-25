resource "azurerm_windows_virtual_machine" "example" {
    count = var.number_of_vms
  name                = "${var.environment}VM${count.index}"
  resource_group_name = var.resource_group
  location            = var.location
  size                = "Standard_F2"
  admin_username      = "mahe"
  admin_password      = "MindSet@1am"
  network_interface_ids = [
    var.nic_ids[count.index]
  ]

  


  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
}