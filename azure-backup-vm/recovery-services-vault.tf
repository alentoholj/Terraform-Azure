#Create a Service Vault for backup VM

resource "azurerm_recovery_services_vault" "backup-vault" {
  name                = "${var.prefix}-vault"
  location            = var.location
  resource_group_name = azurerm_resource_group.azure-backup-vm.name
  sku                 = "Standard"
  storage_mode_type   = "LocallyRedundant"
  soft_delete_enabled = true

  tags = var.tag
}

#Create backup policy for the virtual machine

resource "azurerm_backup_policy_vm" "backup-vm-policy" {
    name = "${var.prefix}-policy"
    resource_group_name = azurerm_resource_group.azure-backup-vm.name
    recovery_vault_name = azurerm_recovery_services_vault.backup-vault.name

        backup {
          frequency           = "Daily"
          time                = "23:00"
        }

        retention_daily {
          count    = 7
        }

        retention_weekly {
          count    = 4
          weekdays = ["Saturday"]
        }

        retention_monthly {
          count     = 6
          weeks     = ["Last"]
          weekdays = ["Saturday"]
        }
}


#Associate backup policy and vault to the VM

resource "azurerm_backup_protected_vm" "backup-vm1" {
    resource_group_name = azurerm_resource_group.azure-backup-vm.name
    recovery_vault_name = azurerm_recovery_services_vault.backup-vault.name
    source_vm_id        = azurerm_windows_virtual_machine.azure-vm1.id
    backup_policy_id = azurerm_backup_policy_vm.backup-vm-policy.id
}