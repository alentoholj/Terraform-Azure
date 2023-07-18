# Architecture Diagram

![azure-vnet-peering](https://github.com/alentoholj/Terraform-Azure/assets/82238804/7061d950-8d8e-4c28-b533-20bda8051ecd)



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
![azure-after-creation](https://github.com/alentoholj/Terraform-Azure/assets/82238804/f08dd052-8d9a-463c-bd07-ef9bc37d655f)

## Step 3: Validation tests
To validate that both virtual machines can communicate between themselves, you need to do this:
- RDP on the both virtual machines
- Open command prompt as a Administrator
- Execute command from the **allow-icmp.ps1** script to open ICMP on the Firewall
<br></br>
  ![add-firewall-rule](https://github.com/alentoholj/Terraform-Azure/assets/82238804/f683e0ae-34af-4e1e-af0d-6d9f12c5813a)

- Execute ping between both virtual machines
<br></br>

Validation passed!
<br></br>
- Ping from VM1 to VM2
<br></br>
![VM1](https://github.com/alentoholj/Terraform-Azure/assets/82238804/c5a40bdd-3d7b-415c-96b7-511caa74b81a)

<br></br>
- Ping from VM2 to VM1
<br></br>
![VM2](https://github.com/alentoholj/Terraform-Azure/assets/82238804/dafcc27d-98ee-45e7-929e-ff13a40cc64c)

## Step 4: Delete the resources
After validation passed, you need to destroy all the resources which you provisioned on the Azure previously. To do that, execute the next command:
```
terraform destroy
```
