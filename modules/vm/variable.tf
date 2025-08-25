variable "resource_group" {
    type = string
    description = "Primary resource group"
}

variable "location" {
    type = string
    description = "location of primary resource group and region"
}

variable "number_of_vms" {
    type = number
    description = "number of VM's to be created"
}

variable "environment" {
    type = string
    description = "Environment Dev or Prod"
}

variable "nic_ids" {
  type        = list(string)
  description = "List of network interface IDs to attach to VMs"
}