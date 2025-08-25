variable "client_id" {
  type        = string
  description = "Client Secret for subscription1"

}

variable "client_secret" {
  type        = string
  description = "Client Secret for subscription1"

}

variable "tenant_id" {
  type        = string
  description = "Client Secret for subscription1"

}

variable "subscription_id" {
  type        = string
  description = "Client Secret for subscription1"

}

variable "resource_group" {
  type        = string
  description = "Primary resource group"
}

variable "location" {
  type        = string
  description = "location of primary resource group and region"
}

variable "virtual_network_name" {
  type        = string
  description = "location of primary resource group and region"
}

variable "virtual_network_addressspace" {
  type        = list(string)
  description = "location of primary resource group and region"
}

variable "subnet1_name" {
  type        = string
  description = "location of primary resource group and region"
}

variable "subnet2_name" {
  type        = string
  description = "location of primary resource group and region"
}

variable "subnet1_addressprefix" {
  type        = list(string)
  description = "location of primary resource group and region"
}

variable "subnet2_addressprefix" {
  type        = list(string)
  description = "location of primary resource group and region"
}

variable "network_securitygroup_name" {
  type        = string
  description = "NSG For both the subnets"
}

variable "vm1_nic" {
  type        = string
  description = "NSG For both the subnets"

}

variable "number_of_vms" {
    type = number
    description = "number of VM's to be created"
}

variable "environment" {
    type = string
    description = "Environment Dev or Prod"
}
