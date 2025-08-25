## Provider Block for Azurerm

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "<=4.3"
    }
  }
}

provider "azurerm" {
  features {}
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
  subscription_id = var.subscription_id

}

## Remote state backend confirguration 

terraform {
  backend "azurerm" {
    resource_group_name  = "rg-tfm-restatefiles"
    storage_account_name = "tfdevrmstatestorageacc03"
    container_name       = "tfrmstate"
    key                  = "dev.tfstate"

  }

}
