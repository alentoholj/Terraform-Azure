#Create a NIC for the Virtual Machine

resource "azurerm_network_interface" "azure-vm-nic" {
    name                = "${var.prefix}-nic"
    location            = var.location
    resource_group_name = azurerm_resource_group.azure-sql-rg.name

        ip_configuration {
          name                          = "ipconfig-vm"
          subnet_id                     = azurerm_subnet.azure-sql-subnet.id
          private_ip_address_allocation = "Dynamic"
          public_ip_address_id         = azurerm_public_ip.azure-vm-ip.id
        }
    
    tags = var.tag
}

#Create public IP for VM

resource "azurerm_public_ip" "azure-vm-ip" {
    name                         = "${var.prefix}-pip"
    location                     = "${var.location}"
    resource_group_name          = azurerm_resource_group.azure-sql-rg.name
    allocation_method            = "Static"

    tags = var.tag
}

#Associate NSG to the NIC

resource "azurerm_network_interface_security_group_association" "azure-vm-nsg" {
    network_interface_id      = azurerm_network_interface.azure-vm-nic.id
    network_security_group_id = azurerm_network_security_group.azure-vnet-nsg.id
}


#Create a Virtual Machine in VNET

resource "azurerm_windows_virtual_machine" "azure-vm" {
    name                  = "${var.prefix}-01"
    location              = "${var.location}"
    resource_group_name = azurerm_resource_group.azure-sql-rg.name
    size = var.size
    admin_username        = var.admin
    admin_password        = var.password
    computer_name         = "VM"

    network_interface_ids = [azurerm_network_interface.azure-vm-nic.id]
    
        os_disk {
          caching               = "ReadWrite"
          storage_account_type  = var.disk
        }

        source_image_reference {
          publisher = "${var.publisher[1]}"
          offer     = "${var.offer[1]}"
          sku       = "${var.sku[1]}"
          version = "latest"
        }

    tags = var.tag
}