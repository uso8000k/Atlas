resource "azurerm_storage_account" "storage1" {
  name                = "${var.app_name}1storage1"
  resource_group_name = "${azurerm_resource_group.rg1.name}"
  location            = "${var.arm_location}"

  account_type        = "Standard_LRS"
  tags {
    environment       = "${var.app_name}"
  }
}

resource "azurerm_storage_container" "container1" {
  name                  = "vhd1"
  resource_group_name   = "${azurerm_resource_group.rg1.name}"
  storage_account_name  = "${azurerm_storage_account.storage1.name}"
  container_access_type = "private"
}

resource "azurerm_storage_container" "container2" {
  name                  = "vhd2"
  resource_group_name   = "${azurerm_resource_group.rg1.name}"
  storage_account_name  = "${azurerm_storage_account.storage1.name}"
  container_access_type = "private"
}
