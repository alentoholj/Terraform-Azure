# Architecture Diagram
![sql-server-diagram](https://github.com/alentoholj/Terraform-Azure/assets/82238804/705b4a1b-a0ce-4c24-8de8-9b144e069fed)


## Prerequisites
Before you begin ensure that you have the folowing requirements:

- An Azure subscription.
- Azure CLI installed on the local machine.
- Terraform installed on the local machine.

## Task Details

1. Sign in to Azure
2. Create a TF files:
    - Create a Resource Group for Virtual Machine and SQL server
    - Create Virtual Network
    - Create a Virtual Machine
    - Create a SQL Server
    - Create a database inside the SQL server instance
    - Establishe Communication between Virtual Machine and Azure SQL Server instance
3. Validation test
4. Delete the resources

## Step 1: Sign in to Azure

1. First step of this lab is to login to the Azure. Login to the Azure account using Azure CLI by running the folowing command in the terminal:

```
az login
```
You need to be careful, if you have more subscriptions attached to your account, before you provision anything on the Azure, check which subscription you are using. You can do this with next command:

```
az account list --output table
```

To choose correct one, use this command:

```
az account set --subscription <name or id>
```

## Step 2: Create a TF files

I created a separate files for each Azure resources, as you can see:
- resource-group.tf
- network.tf
- virtualmachine.tf
- provider.tf
- variable.tf
- sqlserver.tf
- output.tf
