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
    storage_use_azuread = true
}

resource "azurerm_resource_group" "rg" {
  name     = "rg-atlantis2"
  location = "Central US"
}

resource "azurerm_storage_account" "atlantis" {
  name                     = "satlantis2333444555"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "atlantis"
  }
}
