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

After you're finished with coding, you need to initialize working directory which contains terraform files. You will do that with the next command:

```
terraform init
```

To validate your configuration, you can perform this command:
```
terraform validate
```

If you want to create an execution plan, which lets you preview all the changes which Terraform plan will make to your infrastructure, type this command:

```
terraform plan
```

Finally, to perform the action suggested by the **'terraform plan'**, it is necessary to execute this command:
```
terraform apply
```
After this, you can track deploy process on the Azure. After the deployment process is finished:
<br></br>
![sql-server-after-deployment](https://github.com/alentoholj/Terraform-Azure/assets/82238804/6f1a34de-503c-4be9-8fc6-74bc11d7bf89)

## Step 3: Validation tests

To validate that you are able to connect to the SQL instance, from virtual machine, you need to proceed with the next steps:
- RDP on the virtual machine
- Download the SSMS tool
- Install the SSMS tool
- Open the SSMS and fill out connection data (Server type, Server name, Authentification:SQL, Login and Password)
<br></br>
  ![sql-server-ssms](https://github.com/alentoholj/Terraform-Azure/assets/82238804/06d7d159-2a52-46df-861f-077c2a3f34f2)
- If it is everything okay, you will be connected to the SQL server instance and on the left side you will see your database
<br></br>
  ![sql-server-database-access](https://github.com/alentoholj/Terraform-Azure/assets/82238804/c729be25-e633-48ae-93cc-3681c19f1b0b)

## Step 4: Delete the resources
After validation passed, you need to destroy all the resources which you provisioned on the Azure previously. To do that, execute the next command:
```
terraform destroy
```
