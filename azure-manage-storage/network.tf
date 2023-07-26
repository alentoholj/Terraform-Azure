#Create a VNet

resource "azurerm_virtual_network" "azure-vnet-storage" {
    name                = "${var.vnet_name}-01"
    location            = "${var.location[0]}"
    resource_group_name = azurerm_resource_group.azure-vm-rg.name
    address_space       = [var.address_space[0]]

    tags = var.tag
}

#Create a subnet into VNET

resource "azurerm_subnet" "azure-vm-subnet" {
    name                 = "${var.prefix[0]}-subnet"
    virtual_network_name = azurerm_virtual_network.azure-vnet-storage.name
    resource_group_name  = azurerm_resource_group.azure-vm-rg.name
    address_prefixes     = [var.cidr_block[0]]
    service_endpoints = ["Microsoft.Storage"]
}

#Create NSg for the VM in VNET

resource "azurerm_network_security_group" "azure-vm-nsg" {
    name                 = "${var.prefix[0]}-nsg"
    location             = "${var.location[0]}"
    resource_group_name  = azurerm_resource_group.azure-vm-rg.name

        security_rule {
            name                       = "AllowRDPInBound"
            priority                   = 101
            direction                  = "Inbound"
            access                     = "Allow"
            protocol                   = "Tcp"
            source_port_range          = "*"
            destination_port_ranges    = ["3389"]
            source_address_prefix      = "*"
            destination_address_prefix = "*"
        }
}