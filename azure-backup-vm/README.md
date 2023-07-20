# Architecture Diagram

![vmbackup-architecture](https://github.com/alentoholj/Terraform-Azure/assets/82238804/5f6d82e8-abd5-4ca9-9926-266b0129d6b5)

## Prerequisites
Before you begin ensure that you have the folowing requirements:

- An Azure subscription.
- Azure CLI installed on the local machine.
- Terraform installed on the local machine.

## Task Details

1. Sign in to Azure
2. Create a TF files:
    - Create Virtual Network
    - Create a Virtual Machine
    - Create a Backup Vault
    - Associate Backup policy to the Virtual Machine
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
- recovery-services-vault.tf
- variable.tf
- provider.tf

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
![after-backup](https://github.com/alentoholj/Terraform-Azure/assets/82238804/a80b8dda-49dc-4c01-8d1b-1325a6893d73)

## Step 3: Validation tests

To validate that we have created backup policy and backup for the mentioned virtual machine, you need to:
- Go to Azure Portal
- Open the Backup Center
- On the left pane, you have a Vault, click it
- Click on the newly created vault
- On the left pane, under the Protected Items, click on Backup Items, and then click on the Azure Virtual Machine
- Confirm that backup is there for the virtual machine which we created through terraform

**Validation passed!**
<br></br>
![validation-backup](https://github.com/alentoholj/Terraform-Azure/assets/82238804/8cb14671-c5a0-4988-8871-909ef8cf1e10)

