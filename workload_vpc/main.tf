##############################################################################
# Workload VPC
##############################################################################

resource "ibm_is_vpc" "workload_vpc" {
  name                        = "${var.prefix}-workload-vpc"
  resource_group              = var.workload_rg_id
  tags                        = var.tags
  address_prefix_management   = "manual"
  default_network_acl_name    = null
  default_security_group_name = null
  default_routing_table_name  = null
}

resource "ibm_is_vpc_address_prefix" "workload_workload_zone_1_prefix" {
  name = "${var.prefix}-workload-workload-zone-1"
  vpc  = ibm_is_vpc.workload_vpc.id
  zone = "${var.region}-1"
  cidr = "10.40.0.0/22"
}

resource "ibm_is_vpc_address_prefix" "workload_workload_zone_2_prefix" {
  name = "${var.prefix}-workload-workload-zone-2"
  vpc  = ibm_is_vpc.workload_vpc.id
  zone = "${var.region}-2"
  cidr = "10.50.0.0/22"
}

resource "ibm_is_vpc_address_prefix" "workload_workload_zone_3_prefix" {
  name = "${var.prefix}-workload-workload-zone-3"
  vpc  = ibm_is_vpc.workload_vpc.id
  zone = "${var.region}-3"
  cidr = "10.60.0.0/22"
}

resource "ibm_is_subnet" "workload_vsi_zone_1" {
  vpc             = ibm_is_vpc.workload_vpc.id
  name            = "${var.prefix}-workload-vsi-zone-1"
  zone            = "${var.region}-1"
  resource_group  = var.workload_rg_id
  tags            = var.tags
  network_acl     = ibm_is_network_acl.workload_workload_acl.id
  ipv4_cidr_block = "10.40.0.0/28"
  depends_on = [
    ibm_is_vpc_address_prefix.workload_workload_zone_1_prefix
  ]
}

resource "ibm_is_subnet" "workload_vsi_zone_2" {
  vpc             = ibm_is_vpc.workload_vpc.id
  name            = "${var.prefix}-workload-vsi-zone-2"
  zone            = "${var.region}-2"
  resource_group  = var.workload_rg_id
  tags            = var.tags
  network_acl     = ibm_is_network_acl.workload_workload_acl.id
  ipv4_cidr_block = "10.50.0.0/28"
  depends_on = [
    ibm_is_vpc_address_prefix.workload_workload_zone_2_prefix
  ]
}

resource "ibm_is_subnet" "workload_vsi_zone_3" {
  vpc             = ibm_is_vpc.workload_vpc.id
  name            = "${var.prefix}-workload-vsi-zone-3"
  zone            = "${var.region}-3"
  resource_group  = var.workload_rg_id
  tags            = var.tags
  network_acl     = ibm_is_network_acl.workload_workload_acl.id
  ipv4_cidr_block = "10.60.0.0/28"
  depends_on = [
    ibm_is_vpc_address_prefix.workload_workload_zone_3_prefix
  ]
}

resource "ibm_is_subnet" "workload_vpe_zone_1" {
  vpc             = ibm_is_vpc.workload_vpc.id
  name            = "${var.prefix}-workload-vpe-zone-1"
  zone            = "${var.region}-1"
  resource_group  = var.workload_rg_id
  tags            = var.tags
  network_acl     = ibm_is_network_acl.workload_workload_acl.id
  ipv4_cidr_block = "10.40.0.32/29"
  depends_on = [
    ibm_is_vpc_address_prefix.workload_workload_zone_1_prefix
  ]
}

resource "ibm_is_subnet" "workload_vpe_zone_2" {
  vpc             = ibm_is_vpc.workload_vpc.id
  name            = "${var.prefix}-workload-vpe-zone-2"
  zone            = "${var.region}-2"
  resource_group  = var.workload_rg_id
  tags            = var.tags
  network_acl     = ibm_is_network_acl.workload_workload_acl.id
  ipv4_cidr_block = "10.50.0.32/29"
  depends_on = [
    ibm_is_vpc_address_prefix.workload_workload_zone_2_prefix
  ]
}

resource "ibm_is_subnet" "workload_vpe_zone_3" {
  vpc             = ibm_is_vpc.workload_vpc.id
  name            = "${var.prefix}-workload-vpe-zone-3"
  zone            = "${var.region}-3"
  resource_group  = var.workload_rg_id
  tags            = var.tags
  network_acl     = ibm_is_network_acl.workload_workload_acl.id
  ipv4_cidr_block = "10.60.0.32/29"
  depends_on = [
    ibm_is_vpc_address_prefix.workload_workload_zone_3_prefix
  ]
}

##############################################################################
