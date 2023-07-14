#Create a first VNet
resource "azurerm_virtual_network" "azure-vnet1" {
    name                = "${var.vnet_name}-01"
    resource_group_name = azurerm_resource_group.azure-vnet-peering.name
    location            = var.location
    address_space = [var.address_space[0]]

    tags = var.tag
}

#Create a subnet into vnet1
resource "azurerm_subnet" "azurerm-vnet1-subnet" {
    name                 = "${var.prefix}-vnet1-subnet"
    virtual_network_name = azurerm_virtual_network.azure-vnet1.name
    resource_group_name  = azurerm_resource_group.azure-vnet-peering.name
    address_prefixes     = [var.cidr_block[0]]
}

#Create a NSG for the VM in VNet1
resource "azurerm_network_security_group" "azure-vnet1-nsg" {
    name                = "${var.prefix}-nsg1"
    location            = var.location
    resource_group_name = azurerm_resource_group.azure-vnet-peering.name

        security_rule {
            name                       = "allow_RDP"
            priority                   = 101
            direction                  = "Inbound"
            access                     = "Allow"
            protocol                   = "Tcp"
            source_port_range          = "*"
            destination_port_ranges    = ["3389"]
            source_address_prefix      = "*"
            destination_address_prefix = "*"
        }
    
    tags = var.tag
}

#Create a second VNet
resource "azurerm_virtual_network" "azure-vnet2" {
    name = "${var.vnet_name}-02"
    location        = var.location
    resource_group_name   = azurerm_resource_group.azure-vnet-peering.name
    address_space       = [var.address_space[1]]

    tags = var.tag
}

#Create a subnet into VNet2
resource "azurerm_subnet" "azurerm-vnet2-subnet" {
    name                 = "${var.prefix}-vnet2-subnet"
    virtual_network_name = azurerm_virtual_network.azure-vnet2.name
    resource_group_name  = azurerm_resource_group.azure-vnet-peering.name
    address_prefixes     = [var.cidr_block[1]]
}


#Create a NSG for the VM in VNet2

resource "azurerm_network_security_group" "azure-vnet2-nsg" {
    name                = "${var.prefix}-nsg2"
    location            = var.location
    resource_group_name = azurerm_resource_group.azure-vnet-peering.name

        security_rule {
            name                       = "allow_RDP"
            priority                   = 101
            direction                  = "Inbound"
            access                     = "Allow"
            protocol                   = "Tcp"
            source_port_range          = "*"
            destination_port_ranges    = ["3389"]
            source_address_prefix      = "*"
            destination_address_prefix = "*"
        }

    tags = var.tag
}


#Create a peer between VNet1-VNet2
resource "azurerm_virtual_network_peering" "azure-peer-vnet1-vnet2" {
    name                      = "VNet1-VNet2"
    resource_group_name = azurerm_resource_group.azure-vnet-peering.name
    virtual_network_name     = azurerm_virtual_network.azure-vnet1.name
    remote_virtual_network_id = azurerm_virtual_network.azure-vnet2.id
}

#Create a peer between VNet2-VNet1
resource "azurerm_virtual_network_peering" "azure-peer-vnet2-vnet1" {
    name                      = "VNet2-VNet1"
    resource_group_name = azurerm_resource_group.azure-vnet-peering.name
    virtual_network_name     = azurerm_virtual_network.azure-vnet2.name
    remote_virtual_network_id = azurerm_virtual_network.azure-vnet1.id
}