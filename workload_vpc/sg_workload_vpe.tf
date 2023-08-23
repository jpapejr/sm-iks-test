##############################################################################
# Security Group Workload VPE
##############################################################################

resource "ibm_is_security_group" "workload_vpc_workload_vpe_sg" {
  name           = "${var.prefix}-workload-workload-vpe-sg"
  vpc            = ibm_is_vpc.workload_vpc.id
  resource_group = var.workload_rg_id
  tags = [
  ]
}

resource "ibm_is_security_group_rule" "workload_vpc_workload_vpe_sg_rule_allow_ibm_inbound" {
  group     = ibm_is_security_group.workload_vpc_workload_vpe_sg.id
  remote    = "161.26.0.0/16"
  direction = "inbound"
}

resource "ibm_is_security_group_rule" "workload_vpc_workload_vpe_sg_rule_allow_vpc_inbound" {
  group     = ibm_is_security_group.workload_vpc_workload_vpe_sg.id
  remote    = "10.0.0.0/8"
  direction = "inbound"
}

resource "ibm_is_security_group_rule" "workload_vpc_workload_vpe_sg_rule_allow_vpc_outbound" {
  group     = ibm_is_security_group.workload_vpc_workload_vpe_sg.id
  remote    = "10.0.0.0/8"
  direction = "outbound"
}

resource "ibm_is_security_group_rule" "workload_vpc_workload_vpe_sg_rule_allow_ibm_tcp_53_outbound" {
  group     = ibm_is_security_group.workload_vpc_workload_vpe_sg.id
  remote    = "161.26.0.0/16"
  direction = "outbound"
  tcp {
    port_min = 53
    port_max = 53
  }
}

resource "ibm_is_security_group_rule" "workload_vpc_workload_vpe_sg_rule_allow_ibm_tcp_80_outbound" {
  group     = ibm_is_security_group.workload_vpc_workload_vpe_sg.id
  remote    = "161.26.0.0/16"
  direction = "outbound"
  tcp {
    port_min = 80
    port_max = 80
  }
}

resource "ibm_is_security_group_rule" "workload_vpc_workload_vpe_sg_rule_allow_ibm_tcp_443_outbound" {
  group     = ibm_is_security_group.workload_vpc_workload_vpe_sg.id
  remote    = "161.26.0.0/16"
  direction = "outbound"
  tcp {
    port_min = 443
    port_max = 443
  }
}

##############################################################################
