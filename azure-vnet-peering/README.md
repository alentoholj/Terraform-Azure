# Archicteture Diagram

![azure-vnet-peering](https://github.com/alentoholj/Terraform-Azure/assets/82238804/7061d950-8d8e-4c28-b533-20bda8051ecd)



## Prerequisites
Before you begin ensure that you have the folowing requirements:

- An Azure subscription.
- Azure CLI installed on the local machine.
- Terraform installed on the local machine.

## Task Details

- Sign in to Azure
- Create Virtual Networks
- Peer the Virtual Networks
- Create a Virtual Machines
- Establishe Communication between Virtual Machines
- Validation test
- Delete the resources

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
