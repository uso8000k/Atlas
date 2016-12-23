resource "azurerm_resource_group" "rg1" {
  name                   = "${var.arm_resource_group_name1}"
  location               = "${var.arm_location}"
  tags {
    environment          = "${var.app_name}"
  }
}

resource "azurerm_virtual_machine_scale_set" "nodes1" {
  name                   = "${var.arm_resource_group_name1}"
  resource_group_name    = "${azurerm_resource_group.rg1.name}"
  location               = "${var.arm_location}"
  upgrade_policy_mode    = "Manual"
  sku {
    name                 = "Standard_A0"
    tier                 = "Standard"
    capacity             = 1
  }
  os_profile {
    computer_name_prefix = "nodes1"
    admin_username       = "${var.admin_user}"
    admin_password       = "${var.admin_pass}"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
  network_profile {
    name                 = "Nodes1NetworkProfile"
    primary              = true
    ip_configuration { 
      name               = "IPConfiguration"
      subnet_id          = "${azurerm_subnet.public_subnet1.id}"
    }
  }
  storage_profile_os_disk {
    name                 = "OsDiskProfile"
    caching              = "ReadWrite"
    create_option        = "FromImage"
    vhd_containers       = ["${azurerm_storage_account.storage1.primary_blob_endpoint}${azurerm_storage_container.container1.name}"]
  }
  storage_profile_image_reference {
    publisher            = "Canonical"
    offer                = "UbuntuServer"
    sku                  = "14.04.5-LTS"
    version              = "latest"
  }
}

resource "azurerm_virtual_machine_scale_set" "nodes2" {
  name                   = "${var.arm_resource_group_name1}"
  resource_group_name    = "${azurerm_resource_group.rg1.name}"
  location               = "${var.arm_location}"
  upgrade_policy_mode    = "Manual"
  sku {
    name                 = "Standard_A0"
    tier                 = "Standard"
    capacity             = 1
  }
  os_profile {
    computer_name_prefix = "nodes2"
    admin_username       = "${var.admin_user}"
    admin_password       = "${var.admin_pass}"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
  network_profile {
    name                 = "Nodes2NetworkProfile"
    primary              = true
    ip_configuration { 
      name               = "IPConfiguration"
      subnet_id          = "${azurerm_subnet.private_subnet1.id}"
    }
  }
  storage_profile_os_disk {
    name                 = "OsDiskProfile"
    caching              = "ReadWrite"
    create_option        = "FromImage"
    vhd_containers       = ["${azurerm_storage_account.storage1.primary_blob_endpoint}${azurerm_storage_container.container2.name}"]
  }
  storage_profile_image_reference {
    publisher            = "Canonical"
    offer                = "UbuntuServer"
    sku                  = "14.04.5-LTS"
    version              = "latest"
  }
}

