# Architecture Diagram
![azure-global-peering](https://github.com/alentoholj/Terraform-Azure/assets/82238804/0c916541-8143-4985-b344-1d45c3c6019c)

## Prerequisites
Before you begin ensure that you have the folowing requirements:

- An Azure subscription.
- Azure CLI installed on the local machine.
- Terraform installed on the local machine.

## Task Details

1. Sign in to Azure
2. Create a TF files:
    - Create Virtual Networks
    - Peer the Virtual Networks
    - Create a Virtual Machines
    - Establishe Communication between Virtual Machines
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

![azure-after-deployment](https://github.com/alentoholj/Terraform-Azure/assets/82238804/6efe4167-4a23-49b9-8889-5d2187c92cf7)

## Step 3: Validation tests

To validate that both virtual machines can communicate between themselves, you need to do this:
- RDP on the both virtual machines
- Execute ping between both virtual machines
<br></br>
**Validation passed!**
<br></br>
- Ping from VM1 to VM2 and ping from VM2 to VM1
<br></br>
![validate](https://github.com/alentoholj/Terraform-Azure/assets/82238804/70dc2006-fd92-419d-8d91-57ff158b7377)
