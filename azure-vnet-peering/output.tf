#Show public IP for the VM1
output "public_ip_VM1" {
    description = "The VM1 public IP is:"
    value = azurerm_public_ip.azure-vm1-ip.ip_address
}


#Show public IP for the VM2
output "public_ip_VM2" {
    description = "The VM2 public IP is:"
    value = azurerm_public_ip.azure-vm2-ip.ip_address
}