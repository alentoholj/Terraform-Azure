#Create a Resource Group

resource "azurerm_resource_group" "azure-vnet-peering" {
    name     = "${var.prefix}-rg"
    location = var.location
    tags = "${var.tag}"
}