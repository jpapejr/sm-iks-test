##############################################################################
# VPN Gateways
##############################################################################

resource "ibm_is_vpn_gateway" "management_management_gateway_vpn_gw" {
  name           = "${var.prefix}-management-management-gateway-vpn-gw"
  subnet         = module.management_vpc.vpn_zone_1_id
  resource_group = ibm_resource_group.management_rg.id
  tags = [
  ]
  timeouts {
    delete = "1h"
  }
}

##############################################################################
