#Show the public ip of the LB

output "publicip" {
    description = "The public IP of the LB is:"
    value       = azurerm_public_ip.vmss.ip_address
}