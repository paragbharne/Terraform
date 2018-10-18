resource "azurerm_public_ip" "myterraformpublicip" {
  name                         = "myPublicIP"
  location                     = "eastus"
  resource_group_name          = "testResourceGroup"
  public_ip_address_allocation = "dynamic"

  tags {
    environment = "Terraform Demo"
  }
}
