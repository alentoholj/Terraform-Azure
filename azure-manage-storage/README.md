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

## Step 3: Validation tests

To validate that both virtual machines can communicate between themselves, you need to do this:
1. Validation test for the storage File Share
    - RDP on the virtual machine
    - From the Azure portal, copy the connect script for the storage file share and run the script on the virtual machine through PS
<br></br>
      ![storage-file-share](https://github.com/alentoholj/Terraform-Azure/assets/82238804/d5719978-c366-4dc9-9244-d94cfe983f9e)
    - If it is everything okay, you will see a file share as a network location
<br></br>
      ![storage-map-drive](https://github.com/alentoholj/Terraform-Azure/assets/82238804/0848c3c5-dd00-4273-af68-2a3addbe9a36)
    - Open the network location and you will see file with name LICENCES
<br></br>
      ![storag-share-file-licence](https://github.com/alentoholj/Terraform-Azure/assets/82238804/0fd21bb9-3530-46dd-aa7f-5a76810f03a2)
<br></br>
2. Validation test for the blob storage
    - From the Azure Portal you need to copy URL to the blob storage
<br></br>
      ![storage-blob-path](https://github.com/alentoholj/Terraform-Azure/assets/82238804/bea5f86d-cbf6-4794-9505-2151d233a3a6)
    - Paste URL at the browser on the Virtual Machine
<br></br>
      ![open-link](https://github.com/alentoholj/Terraform-Azure/assets/82238804/d9bc4b46-c3ea-4b01-bb67-99ee895f9c33)
<br></br>
    - If it is everything okay, after you open the URL, you will be able to download LICENCES file from the storage container
<br></br>
      ![storage-blob-download](https://github.com/alentoholj/Terraform-Azure/assets/82238804/2e6b82a7-495d-4882-bf4d-de83a39f3932)

## Step 4: Delete the resources
After validation passed, you need to destroy all the resources which you provisioned on the Azure previously. To do that, execute the next command:
```
terraform destroy
```
