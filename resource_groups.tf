##############################################################################
# Resource Groups
##############################################################################

resource "ibm_resource_group" "service_rg" {
  name = "${var.prefix}-service-rg"
  tags = [
  ]
}

resource "ibm_resource_group" "management_rg" {
  name = "${var.prefix}-management-rg"
  tags = [
  ]
}

resource "ibm_resource_group" "workload_rg" {
  name = "${var.prefix}-workload-rg"
  tags = [
  ]
}

##############################################################################
