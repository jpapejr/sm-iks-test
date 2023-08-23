##############################################################################
# Management VPC
##############################################################################

resource "ibm_is_vpc" "management_vpc" {
  name                        = "${var.prefix}-management-vpc"
  resource_group              = var.management_rg_id
  tags                        = var.tags
  address_prefix_management   = "manual"
  default_network_acl_name    = null
  default_security_group_name = null
  default_routing_table_name  = null
}

resource "ibm_is_vpc_address_prefix" "management_management_zone_1_prefix" {
  name = "${var.prefix}-management-management-zone-1"
  vpc  = ibm_is_vpc.management_vpc.id
  zone = "${var.region}-1"
  cidr = "10.10.0.0/22"
}

resource "ibm_is_vpc_address_prefix" "management_management_zone_2_prefix" {
  name = "${var.prefix}-management-management-zone-2"
  vpc  = ibm_is_vpc.management_vpc.id
  zone = "${var.region}-2"
  cidr = "10.20.0.0/22"
}

resource "ibm_is_vpc_address_prefix" "management_management_zone_3_prefix" {
  name = "${var.prefix}-management-management-zone-3"
  vpc  = ibm_is_vpc.management_vpc.id
  zone = "${var.region}-3"
  cidr = "10.30.0.0/22"
}

resource "ibm_is_subnet" "management_vsi_zone_1" {
  vpc             = ibm_is_vpc.management_vpc.id
  name            = "${var.prefix}-management-vsi-zone-1"
  zone            = "${var.region}-1"
  resource_group  = var.management_rg_id
  tags            = var.tags
  network_acl     = ibm_is_network_acl.management_management_acl.id
  ipv4_cidr_block = "10.10.0.0/29"
  depends_on = [
    ibm_is_vpc_address_prefix.management_management_zone_1_prefix
  ]
}

resource "ibm_is_subnet" "management_vpn_zone_1" {
  vpc             = ibm_is_vpc.management_vpc.id
  name            = "${var.prefix}-management-vpn-zone-1"
  zone            = "${var.region}-1"
  resource_group  = var.management_rg_id
  tags            = var.tags
  network_acl     = ibm_is_network_acl.management_management_acl.id
  ipv4_cidr_block = "10.10.0.16/28"
  depends_on = [
    ibm_is_vpc_address_prefix.management_management_zone_1_prefix
  ]
}

resource "ibm_is_subnet" "management_vsi_zone_2" {
  vpc             = ibm_is_vpc.management_vpc.id
  name            = "${var.prefix}-management-vsi-zone-2"
  zone            = "${var.region}-2"
  resource_group  = var.management_rg_id
  tags            = var.tags
  network_acl     = ibm_is_network_acl.management_management_acl.id
  ipv4_cidr_block = "10.20.0.0/29"
  depends_on = [
    ibm_is_vpc_address_prefix.management_management_zone_2_prefix
  ]
}

resource "ibm_is_subnet" "management_vsi_zone_3" {
  vpc             = ibm_is_vpc.management_vpc.id
  name            = "${var.prefix}-management-vsi-zone-3"
  zone            = "${var.region}-3"
  resource_group  = var.management_rg_id
  tags            = var.tags
  network_acl     = ibm_is_network_acl.management_management_acl.id
  ipv4_cidr_block = "10.30.0.0/29"
  depends_on = [
    ibm_is_vpc_address_prefix.management_management_zone_3_prefix
  ]
}

resource "ibm_is_subnet" "management_vpe_zone_1" {
  vpc             = ibm_is_vpc.management_vpc.id
  name            = "${var.prefix}-management-vpe-zone-1"
  zone            = "${var.region}-1"
  resource_group  = var.management_rg_id
  tags            = var.tags
  network_acl     = ibm_is_network_acl.management_management_acl.id
  ipv4_cidr_block = "10.10.0.48/29"
  depends_on = [
    ibm_is_vpc_address_prefix.management_management_zone_1_prefix
  ]
}

resource "ibm_is_subnet" "management_vpe_zone_2" {
  vpc             = ibm_is_vpc.management_vpc.id
  name            = "${var.prefix}-management-vpe-zone-2"
  zone            = "${var.region}-2"
  resource_group  = var.management_rg_id
  tags            = var.tags
  network_acl     = ibm_is_network_acl.management_management_acl.id
  ipv4_cidr_block = "10.20.0.16/29"
  depends_on = [
    ibm_is_vpc_address_prefix.management_management_zone_2_prefix
  ]
}

resource "ibm_is_subnet" "management_vpe_zone_3" {
  vpc             = ibm_is_vpc.management_vpc.id
  name            = "${var.prefix}-management-vpe-zone-3"
  zone            = "${var.region}-3"
  resource_group  = var.management_rg_id
  tags            = var.tags
  network_acl     = ibm_is_network_acl.management_management_acl.id
  ipv4_cidr_block = "10.30.0.16/29"
  depends_on = [
    ibm_is_vpc_address_prefix.management_management_zone_3_prefix
  ]
}

##############################################################################
