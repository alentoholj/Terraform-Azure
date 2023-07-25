variable "prefix" {
    description = "Prefix for each name in this LAB"
    type = list
}

variable "location" {
    description = "Location where we will put our resources"
    type = list
}

variable "tag" {
    description = "Tags that will be attached to the resources"
    type = map(string)
}

variable "vnet_name" {
    description = "VNet's names"
    type = string
}

variable "address_space" {
    description = "Defined an address space for the VNet's"
    type = list
}

variable "cidr_block" {
    description = "Defined cidr block's for VNet's"
    type = list
}

variable "size" {
    description = "Defined size for the VM"
    type = string
}

variable "admin" {
    description = "Defined admin username for the RDP on the VM"
    type = string
    sensitive = true
}

variable "password" {
    description = "Defined admin password"
    type = string
    sensitive = true
}

variable "disk" {
    description = "Defined a type of disk for the virtual machine"
    type = string
}

variable "publisher" {
    description = "Defined all publisher which we want to use"
    type = list
}

variable "offer" {
    description = "Defined offer for VM image"
    type = list
}

variable "sku" {
    description = "Defined sku for the VM"
    type = list
}

variable "storage_account" {
    description = "Storage account name"
    type = string
}