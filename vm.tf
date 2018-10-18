resource "azurerm_virtual_machine" "myterraformvm" {
  name                  = "myVM"
  location              = "eastus"
  resource_group_name   = "${azurerm_resource_group.rg.name}"
  network_interface_ids = ["${azurerm_network_interface.myterraformnic.id}"]
  vm_size               = "Standard_DS1_v2"

  storage_os_disk {
    name              = "myOsDisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Premium_LRS"
  }

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04.0-LTS"
    version   = "latest"
  }

  os_profile {
    computer_name  = "myvm"
    admin_username = "azureuser"
  }

  os_profile_linux_config {
    disable_password_authentication = true

    ssh_keys {
      path     = "/home/azureuser/.ssh/authorized_keys"
      key_data = "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEA0bDypp2aqea02m+Cz2HgMCN6MLK/00LeiaKFd7yfn/xiYlyJm2Qdvzlrdl0p09ZjpAdwDbMIqQqBCMREae6K0vx0CJG/Ph3CCejNXcQ5zpXILO4cd2qrkJ5Hz//g97rgyE1iStTGIXE15slVUMaNUqzwRdIpcpzkFuno/k4IizxfHkHZa1RKXCcYu3LiZ70Ly6p0DKlMkXWkE5FjH0idx19Cpxl1qXdKv/TIsrR0K/bQMo13UyJQnKiud9fr65mdCSJQzp7F88anDzIktqtqRRD89h9/4SSQIegAvZ+YLXyU5q49Vw3YIwQnwjiq4V3KSzj65/oySga1/GZTb+2jOw== rsa-key-20181005"
    }
  }

  boot_diagnostics {
    enabled     = "true"
    storage_uri = "${azurerm_storage_account.mystorageaccount.primary_blob_endpoint}"
  }

  tags {
    environment = "Terraform Demo"
  }
}
