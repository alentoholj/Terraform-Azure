#Generate random string

resource "random_string" "suffix" {
  length  = 4
  special = false
  upper   = false
}

#Create a SQL server

resource "azurerm_mssql_server" "azure-sql-server" {
    name                = "${var.prefix}-server-${random_string.suffix.result}"
    resource_group_name = azurerm_resource_group.azure-sql-rg.name
    location            = var.location
    version             = "12.0"
    administrator_login          = var.admin
    administrator_login_password = var.password

    tags = var.tag
}

#Creating a SQL database

resource "azurerm_mssql_database" "azure-sql-database" {
    name         = "${var.prefix}-db-${random_string.suffix.result}"
    server_id    = azurerm_mssql_server.azure-sql-server.id
    collation    = "SQL_LATIN1_GENERAL_CP1_CI_AS"
    sku_name = "S1"
    max_size_gb = 5
}

#Create virtual network rule, this rule will enable access from our subnet to the SQL server

resource "azurerm_mssql_virtual_network_rule" "azure-sql-rule" {
    name                 = "${var.prefix}-vnet-rule-${random_string.suffix.result}"
    server_id            = azurerm_mssql_server.azure-sql-server.id
    subnet_id           = azurerm_subnet.azure-sql-subnet.id
}


