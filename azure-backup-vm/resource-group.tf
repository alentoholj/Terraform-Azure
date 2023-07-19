#Create a Resource Group

resource "azurerm_resource_group" "azure-backup-vm" {
    name     = "${var.prefix}-rg"
    location = var.location
    
    tags = "${var.tag}"
}