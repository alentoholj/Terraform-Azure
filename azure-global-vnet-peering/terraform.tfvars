prefix = "azure-global-peering"

location = ["westeurope","uksouth","ukwest"]

tag = {
  "Environment" = "Lab"
  "CreatedBy" = "carpel"
  "Project" = "VNet-Global-Peering"
}

vnet_name = "azure-vnet"

address_space = ["10.1.0.0/16","10.2.0.0/16"]

cidr_block = ["10.1.0.0/24","10.2.0.0/24"]


size = "Standard_D2s_v3"

admin = "adminadmin"

password = "YourPassword2023!"

disk = "Standard_LRS"

publisher = ["MicrosoftWindowsDesktop","MicrosoftWindowsServer","OpenLogic","Canonical"]

offer = ["Windows-10","WindowsServer","CentOS","UbuntuServer"]

sku = ["rs5-pro","2022-Datacenter","7.5","16.04-LTS"]