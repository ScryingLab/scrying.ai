resource "azurerm_resource_group" "tfstate" {
  name     = "rg-tfstate"
  location = "East US"
}

resource "azurerm_storage_account" "tfstate" {
  name                     = "stscryingtfstate"
  resource_group_name      = azurerm_resource_group.tfstate.name
  location                 = azurerm_resource_group.tfstate.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "tfstate" {
  name                  = "shared"
  storage_account_name  = azurerm_storage_account.tfstate.name
}

# Admin-only access to shared state
# resource "azurerm_role_assignment" "tfstate_admins" {
#   scope                = azurerm_storage_account.tfstate.id
#   role_definition_name = "Storage Blob Data Owner"
#   principal_id         = var.admin_group_id  # Only Admins can modify
# }

# resource "azurerm_role_assignment" "tfstate_read_only" {
#   scope                = azurerm_storage_account.tfstate.id
#   role_definition_name = "Storage Blob Data Reader"
#   principal_id         = var.developer_group_id  # Devs can only read
# }
