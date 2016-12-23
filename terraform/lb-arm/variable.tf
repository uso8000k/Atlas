variable "app_name" {}

variable "arm_subscription_id" {}
variable "arm_client_id"       {}
variable "arm_client_secret"   {}
variable "arm_tenant_id"       {}
variable "arm_location"        { default = "Japan East" }

variable "arm_resource_group_name1"  { default = "resource1"}

variable "arm_vnet1_segment"         { default = "172.26.0.0/16" }
variable "arm_vnet1_subnet1_segment" { default = "172.26.1.0/24" }
variable "arm_vnet1_subnet2_segment" { default = "172.26.2.0/24" }

variable "admin_user" {}
variable "admin_pass" {}

