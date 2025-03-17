terraform {
  backend "azurerm" {
    resource_group_name   = "rg-tfstate"
    storage_account_name  = "stscryingtfstate"
    container_name        = "shared"
    key                   = "terraform.tfstate"
  }
}
