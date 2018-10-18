resource "azurerm_virtual_network" "myterraformnetwork" {
  name                = "myVnet"
  address_space       = ["10.0.0.0/16"]
  location            = "eastus"
  resource_group_name = "testResourceGroup"

  tags {
    environment = "Terraform Demo"
    Billing     = "Test"
  }
}
