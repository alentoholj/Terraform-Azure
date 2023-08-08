#Create a VNet

resource "azurerm_virtual_network" "vmss" {
  name                = "${var.vnet_name}-01"
  location            = var.location
  resource_group_name = azurerm_resource_group.vmss.name
  address_space       = [var.address_space[0]]

  tags = var.tag
}

#Create a subnet into VNET

resource "azurerm_subnet" "vmss" {
  name                 = "${var.prefix}-subnet"
  virtual_network_name = azurerm_virtual_network.vmss.name
  resource_group_name  = azurerm_resource_group.vmss.name
  address_prefixes     = [var.cidr_block[0]]
}

#Create NSg for the VM in VNET


#Create a public IP for the LB

resource "azurerm_public_ip" "vmss" {
  name                = "${var.prefix}-pip"
  location            = var.location
  resource_group_name = azurerm_resource_group.vmss.name
  allocation_method   = "Static"

  tags = var.tag
}

#Create a NSG

resource "azurerm_network_security_group" "vmss" {
  name                = "${var.prefix}-nsg-lb"
  location            = var.location
  resource_group_name = azurerm_resource_group.vmss.name

  security_rule {
    name                       = "HTTPandHTTPS"
    priority                   = 200
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_ranges    = ["80", "443", ]
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "RDP"
    description                = "Deny RDP traffic"
    priority                   = 195
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_ranges    = ["3389"]
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}
