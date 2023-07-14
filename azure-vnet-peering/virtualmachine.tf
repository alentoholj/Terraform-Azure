#Create a NIC for the virtual machine in the VNet1
resource "azurerm_network_interface" "azure-vm1-nic" {
    name                = "${var.prefix}-VM1-NIC"
    location            = var.location
    resource_group_name = azurerm_resource_group.azure-vnet-peering.name

        ip_configuration {
          name                          = "ipconfig-vm1"
          subnet_id                     = azurerm_subnet.azurerm-vnet1-subnet.id
          private_ip_address_allocation = "Dynamic"
          public_ip_address_id = azurerm_public_ip.azure-vm1-ip.id
        }

    tags = var.tag
}


#Create public IP for VM1
resource "azurerm_public_ip" "azure-vm1-ip" {
    name                         = "${var.prefix}-VM1-IP"
    location                     = var.location
    resource_group_name          = azurerm_resource_group.azure-vnet-peering.name
    allocation_method            = "Static"

    tags = var.tag
}


#Associate NSG to the NIC
resource "azurerm_network_interface_security_group_association" "azure-vm1-nsg1" {
    network_interface_id = azurerm_network_interface.azure-vm1-nic.id
    network_security_group_id = azurerm_network_security_group.azure-vnet1-nsg.id
}


#Create a virtual machine in VNet1
resource "azurerm_windows_virtual_machine" "azure-vm1" {
    name                  = "${var.prefix}-VM1"
    location              = var.location
    resource_group_name   = azurerm_resource_group.azure-vnet-peering.name
    size = var.size
    admin_username = var.admin
    admin_password = var.password
    computer_name = "VM1"

    network_interface_ids = [azurerm_network_interface.azure-vm1-nic.id]

        os_disk {
          caching           = "ReadWrite"
          storage_account_type = var.disk
        }

        source_image_reference {
          publisher = "${var.publisher[1]}"
          offer     = "${var.offer[1]}"
          sku       = "${var.sku[1]}"
          version   = "latest"
        }
    
    tags = var.tag
}


#Create a NIC for the virtual machine in the VNet2
resource "azurerm_network_interface" "azure-vm2-nic" {
    name                = "${var.prefix}-VM2-NIC"
    location            = var.location
    resource_group_name = azurerm_resource_group.azure-vnet-peering.name

        ip_configuration {
          name                          = "ipconfig-vm2"
          subnet_id                     = azurerm_subnet.azurerm-vnet2-subnet.id
          private_ip_address_allocation = "Dynamic"
          public_ip_address_id = azurerm_public_ip.azure-vm2-ip.id
        }

    tags = var.tag
}


#Create public IP for VM2
resource "azurerm_public_ip" "azure-vm2-ip" {
    name                         = "${var.prefix}-VM2-IP"
    location                     = var.location
    resource_group_name          = azurerm_resource_group.azure-vnet-peering.name
    allocation_method            = "Static"

    tags = var.tag
}

#Associate NSG to the NIC
resource "azurerm_network_interface_security_group_association" "azure-vm2-nsg2" {
    network_interface_id = azurerm_network_interface.azure-vm2-nic.id
    network_security_group_id = azurerm_network_security_group.azure-vnet2-nsg.id
}

#Create a virtual machine in VNet2
resource "azurerm_windows_virtual_machine" "azure-vm2" {
    name                  = "${var.prefix}-VM2"
    location              = var.location
    resource_group_name   = azurerm_resource_group.azure-vnet-peering.name
    size = var.size
    admin_username = var.admin
    admin_password = var.password
    computer_name = "VM2"
    network_interface_ids = [azurerm_network_interface.azure-vm2-nic.id]

        os_disk {
          caching           = "ReadWrite"
          storage_account_type = var.disk
        }

        source_image_reference {
          publisher = "${var.publisher[1]}"
          offer     = "${var.offer[1]}"
          sku       = "${var.sku[1]}"
          version   = "latest"
        }

    tags = var.tag
}