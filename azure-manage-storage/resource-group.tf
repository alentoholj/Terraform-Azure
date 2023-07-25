#Create a Resource Group for Virtual Machine

resource "azurerm_resource_group" "azure-vm-rg" {
    name = "${var.prefix[0]}-rg"
    location = "${var.location[0]}"

    tags = var.tag
}

#Create a Resource Group for Storage Account

resource "azurerm_resource_group" "azure-storage-rg" {
    name = "${var.prefix[1]}-rg"
    location = "${var.location[0]}"

    tags = var.tag
}