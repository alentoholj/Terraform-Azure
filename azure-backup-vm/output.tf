#Show public IP for the VM1
output "public_ip_VM1" {
    description = "The VM1 public IP is:"
    value = azurerm_public_ip.azure-vm1-ip.ip_address
}