resource "azurerm_storage_account" "mystorageaccount" {
  name                     = "diagaccountvm"
  resource_group_name      = "${azurerm_resource_group.rg.name}"
  location                 = "eastus"
  account_replication_type = "LRS"
  account_tier             = "Standard"

  tags {
    environment = "Terraform Demo"
  }
}
