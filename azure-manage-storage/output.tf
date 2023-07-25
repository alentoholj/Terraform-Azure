#Show public IP of VM

output "public-ip-vm" {
    description = "The VM public IP is:"
    value = azurerm_public_ip.azure-vm-ip.ip_address
}