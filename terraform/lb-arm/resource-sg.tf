resource "azurerm_network_security_group" "sg1" {
  name                 = "sg1"
  resource_group_name  = "${azurerm_resource_group.rg1.name}"
  location             = "${var.arm_location}"
  tags {
    environment        = "${var.app_name}"
  }
}

resource "azurerm_network_security_group" "sg2" {
  name                 = "sg2"
  resource_group_name  = "${azurerm_resource_group.rg1.name}"
  location             = "${var.arm_location}"
  tags {
    environment        = "${var.app_name}"
  }
}

resource "azurerm_network_security_rule" "sg1_in_80" {
  name                        = "allow_in_80"
  resource_group_name         = "${azurerm_resource_group.rg1.name}"
  network_security_group_name = "${azurerm_network_security_group.sg1.name}"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "80"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
}

resource "azurerm_network_security_rule" "sg1_in_22" {
  name                        = "allow_in_22"
  resource_group_name         = "${azurerm_resource_group.rg1.name}"
  network_security_group_name = "${azurerm_network_security_group.sg1.name}"
  priority                    = 110
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
}

resource "azurerm_network_security_rule" "sg2_in_any-internet" {
  name                        = "deny_in_any-internet"
  resource_group_name         = "${azurerm_resource_group.rg1.name}"
  network_security_group_name = "${azurerm_network_security_group.sg2.name}"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Deny"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "Internet"
  destination_address_prefix  = "*"
}
