#Create a storage account

resource "azurerm_storage_account" "azure-storage-account" {
    name = var.storage_account
    resource_group_name = azurerm_resource_group.azure-storage-rg.name
    location = "${var.location[0]}"
    account_tier = "Standard"
    account_replication_type = "LRS"
    access_tier = "Cool"
    allow_nested_items_to_be_public = true
    public_network_access_enabled = true
    
    tags = var.tag
}

#Create a container in Storage Account

resource "azurerm_storage_container" "azure-storage-container" {
    name                  = "${var.prefix[1]}-container"
    storage_account_name  = azurerm_storage_account.azure-storage-account.name
    container_access_type = "container"
    depends_on = [azurerm_storage_account.azure-storage-account]
}

#Create blob in the container

resource "azurerm_storage_blob" "azure-storage-blob" {
    name                   = "LICENSE"
    storage_account_name   = azurerm_storage_account.azure-storage-account.name
    storage_container_name = azurerm_storage_container.azure-storage-container.name
    type                   = "Block"
    source                 = "./LICENSE"
    depends_on = [azurerm_storage_container.azure-storage-container]
}

data "azurerm_storage_account_sas" "azure-storage-account-sas" {
  connection_string = azurerm_storage_account.azure-storage-account.primary_connection_string
  https_only        = true
  ip_addresses = azurerm_public_ip.azure-vm-ip.ip_address
        
        resource_types {
          service   = true
          container = true
          object    = false
        }

        services {
          blob  = true
          queue = false
          table = false
          file  = false
        }

  start  = "2023-07-24T00:00:00Z"
  expiry = "2023-07-30T00:00:00Z"

          permissions {
            read    = true
            write   = true
            delete  = false
            list    = false
            add     = true
            create  = true
            update  = false
            process = false
            tag     = false
            filter  = false
          }
  depends_on = [azurerm_storage_blob.azure-storage-blob]
}


#Create Storage File Share

resource "azurerm_storage_share" "azure-storage-share" {
  name = "${var.prefix[1]}-share"
  storage_account_name = azurerm_storage_account.azure-storage-account.name
  quota = 5
  enabled_protocol = "SMB"
  access_tier = "Hot"
  depends_on = [azurerm_storage_account.azure-storage-account]
}

#Upload file to File share

resource "azurerm_storage_share_file" "azure-storage-share-file" {
  name = "LICENCES"
  storage_share_id = azurerm_storage_share.azure-storage-share.id
  source = "./LICENSE"
  depends_on = [azurerm_storage_share.azure-storage-share]
}

#Create a network rules for access to the storage account
resource "azurerm_storage_account_network_rules" "azure-storage-rules" {
  storage_account_id = azurerm_storage_account.azure-storage-account.id
  default_action             = "Deny"
  ip_rules = [azurerm_public_ip.azure-vm-ip.ip_address]
  virtual_network_subnet_ids = [azurerm_subnet.azure-vm-subnet.id]
  bypass = ["AzureServices"]
  depends_on = [azurerm_storage_account.azure-storage-account]
}