terraform {
    required_providers {
        azurerm = {
            source  = "hashicorp/azurerm"
            version = "~> 4.0"
        }
    }

    backend "azurerm" {
        resource_group_name  = "rg-tfstate"
        storage_account_name = "sathecdtfstate"
        container_name       = "tfstate"
        key                  = "certranker-prod.tfstate"
        use_azuread_auth = true
    }
}
provider "azurerm" {
    features {}
    subscription_id = var.azure_subscription_id
    storage_use_azuread = true
}
