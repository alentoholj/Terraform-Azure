<h1 align="center">☁️ Terraform on Azure – Hands-on Labs</h1>

<p align="center">
<img src="https://img.shields.io/badge/Terraform-7B42BC?style=for-the-badge&logo=terraform&logoColor=white" alt="Terraform"/>
<img src="https://img.shields.io/badge/Microsoft_Azure-0078D4?style=for-the-badge&logo=microsoftazure&logoColor=white" alt="Azure"/>
<img src="https://img.shields.io/badge/IaC-Infrastructure_as_Code-3ea6ff?style=for-the-badge" alt="IaC"/>
</p>

<p align="center">
Practical labs for building Azure infrastructure with Terraform: networking, compute, storage, databases and backup.
Every lab includes an architecture diagram, step-by-step instructions and a validation test.
</p>

---

## 📚 Labs

| Lab | What you build |
|---|---|
| [**azure-vnet-peering**](./azure-vnet-peering) | Two peered virtual networks with a VM in each, validated with ping |
| [**azure-global-vnet-peering**](./azure-global-vnet-peering) | Virtual networks in different regions connected with global peering, validated with ping |
| [**azure-scale-set**](./azure-scale-set) | A Virtual Machine Scale Set behind a Load Balancer, serving a web page via IIS |
| [**azure-backup-vm**](./azure-backup-vm) | A VM protected by a Recovery Services vault and a backup policy |
| [**azure-manage-storage**](./azure-manage-storage) | A storage account with a blob container and file share, accessed from a VM |
| [**azure-sql-server**](./azure-sql-server) | An Azure SQL server and database, accessed from a VM with SSMS |

Each lab has its own README with the architecture diagram, task details and validation steps.

## 🚀 How to use

**Prerequisites:** an Azure subscription, [Terraform](https://developer.hashicorp.com/terraform/install) and the [Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli).

```bash
az login
az account set --subscription <name-or-id>
cd azure-vnet-peering
terraform init
terraform validate
terraform plan
terraform apply
```

When you're done, remove the resources to avoid costs:

```bash
terraform destroy
```

## 🎯 What these labs cover

- Azure networking: virtual networks, subnets, regional and global peering
- Compute at scale with Virtual Machine Scale Sets and a Load Balancer
- Data protection with Azure Backup and Recovery Services vaults
- Blob storage, file shares and Azure SQL
- Structuring Terraform code in separate files per resource

---

<p align="center">
Made by <a href="https://alentoholj.dev">Alen Toholj</a> · Cloud Solution Architect · <a href="https://www.linkedin.com/in/alentoholj/">LinkedIn</a>
</p>
