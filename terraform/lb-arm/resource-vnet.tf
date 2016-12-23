resource "azurerm_virtual_network" "vnet1" {
  name                 = "vnet1"
  resource_group_name  = "${azurerm_resource_group.rg1.name}"
  address_space        = ["${var.arm_vnet1_segment}"]
  location             = "${var.arm_location}"
  tags {
    environment        = "${var.app_name}"
  }
}

resource "azurerm_subnet" "public_subnet1" {
  name                 = "public_subnet1"
  resource_group_name  = "${azurerm_resource_group.rg1.name}"
  virtual_network_name = "${azurerm_virtual_network.vnet1.name}"
  address_prefix       = "${var.arm_vnet1_subnet1_segment}"
}

resource "azurerm_subnet" "private_subnet1" {
  name                 = "private_subnet1"
  resource_group_name  = "${azurerm_resource_group.rg1.name}"
  virtual_network_name = "${azurerm_virtual_network.vnet1.name}"
  address_prefix       = "${var.arm_vnet1_subnet2_segment}"
}
