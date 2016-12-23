resource "azurerm_availability_set" "az1" {
  name                = "az1"
  location            = "${var.arm_location}"
  resource_group_name = "${azurerm_resource_group.rg1.name}"
  tags {
    environment = "var.app_name"
  }
}

resource "azurerm_availability_set" "az2" {
  name                = "az1"
  location            = "${var.arm_location}"
  resource_group_name = "${azurerm_resource_group.rg1.name}"
  tags {
    environment = "var.app_name"
  }
}
