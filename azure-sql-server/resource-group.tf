#Create a resource group for the resources

resource "azurerm_resource_group" "azure-sql-rg" {
    name = "${var.prefix}-rg"
    location = var.location

    tags = var.tag
}