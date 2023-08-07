#Create a LB

resource "azurerm_lb" "vmss" {
  name                = "${var.prefix}-lb"
  location            = var.location
  resource_group_name = azurerm_resource_group.vmss.name

  frontend_ip_configuration {
    name                 = "PublicIPConfig"
    public_ip_address_id = azurerm_public_ip.vmss.id
  }
}

#Create a backend pool

resource "azurerm_lb_backend_address_pool" "vmss" {
  loadbalancer_id = azurerm_lb.vmss.id
  name            = "BackEndAddressPool"
}

#Create a NAT rule for RDP

resource "azurerm_lb_nat_pool" "vmss" {
  name                           = "RDPAccess"
  resource_group_name            = azurerm_resource_group.vmss.name
  loadbalancer_id                = azurerm_lb.vmss.id
  protocol                       = "Tcp"
  frontend_port_start            = 50000
  frontend_port_end              = 50100
  backend_port                   = 3389
  frontend_ip_configuration_name = "PublicIPConfig"
}

#Create a LB rule

resource "azurerm_lb_rule" "vmss" {
  loadbalancer_id                = azurerm_lb.vmss.id
  name                           = "HTTP"
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = "PublicIPConfig"
}

resource "azurerm_lb_probe" "vmss" {
  loadbalancer_id = azurerm_lb.vmss.id
  name            = "rdp-probe"
  protocol        = "Tcp"
  port            = 3389
}
