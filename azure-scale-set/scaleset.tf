#Create a Windows Virtual Machine Scale Set

resource "azurerm_windows_virtual_machine_scale_set" "vmss" {
  name                = "carpel"
  location            = var.location
  resource_group_name = azurerm_resource_group.vmss.name
  sku                 = "Standard_DS1_v2"
  instances           = 2
  admin_username      = var.admin
  admin_password      = var.password

  source_image_reference {
    publisher = var.publisher[1]
    offer     = var.offer[1]
    sku       = var.sku[1]
    version   = "latest"
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  network_interface {
    name    = "${var.prefix}-nic"
    primary = true
    network_security_group_id = azurerm_network_security_group.vmss.id

    ip_configuration {
      name                                   = "PublicIPConfig"
      subnet_id                              = azurerm_subnet.vmss.id
      primary                                = true
      load_balancer_backend_address_pool_ids = [azurerm_lb_backend_address_pool.vmss.id]
      load_balancer_inbound_nat_rules_ids    = [azurerm_lb_nat_pool.vmss.id]
    }
  }

  depends_on = [azurerm_lb_probe.vmss]
}
