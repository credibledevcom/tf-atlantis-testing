terraform {
    required_providers {
        azurerm = {
            source  = "hashicorp/azurerm"
            version = "~> 4.0"
        }
    }

    backend "azurerm" {
        resource_group_name  = "rg-tfstate2323"
        storage_account_name = "sathecdtfstate"
        container_name       = "tfstate"
        key                  = "certranker-prod.tfstate"
        use_azuread_auth = true
    }
}
provider "azurerm" {
    features {}
    storage_use_azuread = true
}
