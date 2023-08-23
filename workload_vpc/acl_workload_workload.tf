##############################################################################
# Workload Workload ACL
##############################################################################

resource "ibm_is_network_acl" "workload_workload_acl" {
  name           = "${var.prefix}-workload-workload-acl"
  vpc            = ibm_is_vpc.workload_vpc.id
  resource_group = var.workload_rg_id
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
  rules {
    source      = "161.26.0.0/16"
    action      = "allow"
    destination = "0.0.0.0/0"
    direction   = "inbound"
    name        = "roks-create-worker-nodes-inbound"
  }
  rules {
    source      = "0.0.0.0/0"
    action      = "allow"
    destination = "161.26.0.0/16"
    direction   = "outbound"
    name        = "roks-create-worker-nodes-outbound"
  }
  rules {
    source      = "166.8.0.0/14"
    action      = "allow"
    destination = "0.0.0.0/0"
    direction   = "inbound"
    name        = "roks-nodes-to-service-inbound"
  }
  rules {
    source      = "0.0.0.0/0"
    action      = "allow"
    destination = "166.8.0.0/14"
    direction   = "outbound"
    name        = "roks-nodes-to-service-outbound"
  }
  rules {
    source      = "0.0.0.0/0"
    action      = "allow"
    destination = "0.0.0.0/0"
    direction   = "inbound"
    name        = "allow-app-incoming-traffic-requests"
    tcp {
      source_port_min = 30000
      source_port_max = 32767
      port_min        = null
      port_max        = null
    }
  }
  rules {
    source      = "0.0.0.0/0"
    action      = "allow"
    destination = "0.0.0.0/0"
    direction   = "outbound"
    name        = "allow-app-outgoing-traffic-requests"
    tcp {
      port_min        = 30000
      port_max        = 32767
      source_port_min = null
      source_port_max = null
    }
  }
  rules {
    source      = "0.0.0.0/0"
    action      = "allow"
    destination = "0.0.0.0/0"
    direction   = "inbound"
    name        = "allow-lb-incoming-traffic-requests"
    tcp {
      port_min        = 443
      port_max        = 443
      source_port_min = null
      source_port_max = null
    }
  }
  rules {
    source      = "0.0.0.0/0"
    action      = "allow"
    destination = "0.0.0.0/0"
    direction   = "outbound"
    name        = "allow-lb-outgoing-traffic-requests"
    tcp {
      source_port_min = 443
      source_port_max = 443
      port_min        = null
      port_max        = null
    }
  }
}

##############################################################################
