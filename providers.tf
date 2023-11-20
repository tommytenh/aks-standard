terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.7.0"
    }
    azapi = {
      source = "azure/azapi"
    }

  }

  # Update this block with the location of your terraform state file
  backend "azurerm" {
    resource_group_name  = "rg-aks-standard-terraform"
    storage_account_name = "aksstdterraform"
    container_name       = "stateprivate"
    key                  = "terraform.tfstate"
    use_oidc             = true
  }
}

provider "azurerm" {
  features {}
  use_oidc = true
}

provider "azapi" {
  use_oidc = true
}