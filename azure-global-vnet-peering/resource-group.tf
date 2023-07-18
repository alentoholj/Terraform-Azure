#Create a Resource Group

resource "azurerm_resource_group" "azure-global-peering" {
    name = "${var.prefix}-rg"
    location = var.location[2]
    
    tags = var.tag
}