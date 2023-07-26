#Display the public IP from Virtual Machine

output "show_public_ip_vm" {
    description = "The public IP from VM is:"
    value = azurerm_public_ip.azure-vm-ip.ip_address
}