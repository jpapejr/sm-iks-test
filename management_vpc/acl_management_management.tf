##############################################################################
# Management Management ACL
##############################################################################

resource "ibm_is_network_acl" "management_management_acl" {
  name           = "${var.prefix}-management-management-acl"
  vpc            = ibm_is_vpc.management_vpc.id
  resource_group = var.management_rg_id
  tags = [
  ]
  rules {
    source      = "161.26.0.0/16"
    action      = "allow"
    destination = "10.0.0.0/8"
    direction   = "inbound"
    name        = "allow-ibm-inbound"
  }
  rules {
    source      = "10.0.0.0/8"
    action      = "allow"
    destination = "161.26.0.0/16"
    direction   = "outbound"
    name        = "allow-ibm-outbound"
  }
  rules {
    source      = "10.0.0.0/8"
    action      = "allow"
    destination = "10.0.0.0/8"
    direction   = "inbound"
    name        = "allow-all-network-inbound"
  }
  rules {
    source      = "10.0.0.0/8"
    action      = "allow"
    destination = "10.0.0.0/8"
    direction   = "outbound"
    name        = "allow-all-network-outbound"
  }
}

##############################################################################
