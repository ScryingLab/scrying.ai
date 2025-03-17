terraform {
  required_version = ">= 1.0.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "6f889e85-5bc7-4b1e-a897-17aa4d0794a1"  
}
