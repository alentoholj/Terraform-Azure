# Architecture Diagram
![azure-manage-storage](https://github.com/alentoholj/Terraform-Azure/assets/82238804/e30784cd-c9e1-4806-ba5b-cb3228da4b4d)

## Prerequisites
Before you begin ensure that you have the folowing requirements:

- An Azure subscription.
- Azure CLI installed on the local machine.
- Terraform installed on the local machine.

## Task Details

1. Sign in to Azure
2. Create a TF files:
    - Create a Resource Groups for Virtual Machine and Storage Account
    - Create Virtual Network
    - Create a Virtual Machine
    - Create a Storage Account
    - Create a container inside the storage account and upload file
    - Create a share inside the storage account and upload a file
    - Establishe Communication between Virtual Machine and Azure Storage
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
- storage-account-tf
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
![after-deployment](https://github.com/alentoholj/Terraform-Azure/assets/82238804/1fabced6-77f4-4b3a-9641-5e8f8ba9613e)
![storage-rg](https://github.com/alentoholj/Terraform-Azure/assets/82238804/3c732bd7-1658-438a-bfb1-a747caf16d1f)
![vm-rg](https://github.com/alentoholj/Terraform-Azure/assets/82238804/73463185-66b2-45bc-bee7-5bb2b803736e)


