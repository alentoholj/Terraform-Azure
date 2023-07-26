#Fetch public ip

data "http" "myip" {
    url = "http://ipv4.icanhazip.com"
}


#Create a VNet

resource "azurerm_virtual_network" "azure-vnet-sql" {
    name                = var.vnet_name
    location            = var.location
    resource_group_name = azurerm_resource_group.azure-sql-rg.name
    address_space       = [var.address_space[0]]

    tags = var.tag
}

#Create a subnet inside the VNet for instance purpose

resource "azurerm_subnet" "azure-sql-subnet" {
    name                 = "${var.vnet_name}-subnet"
    virtual_network_name = azurerm_virtual_network.azure-vnet-sql.name
    resource_group_name  = azurerm_resource_group.azure-sql-rg.name
    address_prefixes     = [var.cidr_block[0]]
    service_endpoints    = ["Microsoft.Sql"]
}

#Create NSG for the newly created VNet

resource "azurerm_network_security_group" "azure-vnet-nsg" {
    name                = "${var.prefix}-nsg"
    location            = var.location
    resource_group_name = azurerm_resource_group.azure-sql-rg.name

        security_rule {
            name                       = "allow-RDP"
            priority                   = 1002
            direction                  = "Inbound"
            access                     = "Allow"
            protocol                   = "Tcp"
            source_port_range          = "*"
            destination_port_ranges    = ["3389"]
            source_address_prefix      = "${chomp(data.http.myip.body)}"
            destination_address_prefix = "*"
        }
}