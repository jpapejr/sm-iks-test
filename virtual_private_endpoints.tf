##############################################################################
# Management VPE Resources
##############################################################################

resource "ibm_is_subnet_reserved_ip" "management_vpc_vpe_zone_1_subnet_vpe_ip" {
  subnet = module.management_vpc.vpe_zone_1_id
}

resource "ibm_is_subnet_reserved_ip" "management_vpc_vpe_zone_2_subnet_vpe_ip" {
  subnet = module.management_vpc.vpe_zone_2_id
}

resource "ibm_is_subnet_reserved_ip" "management_vpc_vpe_zone_3_subnet_vpe_ip" {
  subnet = module.management_vpc.vpe_zone_3_id
}

resource "ibm_is_virtual_endpoint_gateway" "management_vpc_cos_vpe_gateway" {
  name           = "${var.prefix}-management-cos-vpe-gw"
  vpc            = module.management_vpc.id
  resource_group = ibm_resource_group.management_rg.id
  tags = []
  security_groups = [
    module.management_vpc.management_vpe_id
  ]
  target {
    crn           = "crn:v1:bluemix:public:cloud-object-storage:global:::endpoint:s3.direct.${var.region}.cloud-object-storage.appdomain.cloud"
    resource_type = "provider_cloud_service"
  }
}

resource "ibm_is_virtual_endpoint_gateway_ip" "management_vpc_cos_gw_vpe_zone_1_gateway_ip" {
  gateway     = ibm_is_virtual_endpoint_gateway.management_vpc_cos_vpe_gateway.id
  reserved_ip = ibm_is_subnet_reserved_ip.management_vpc_vpe_zone_1_subnet_vpe_ip.reserved_ip
}

resource "ibm_is_virtual_endpoint_gateway_ip" "management_vpc_cos_gw_vpe_zone_2_gateway_ip" {
  gateway     = ibm_is_virtual_endpoint_gateway.management_vpc_cos_vpe_gateway.id
  reserved_ip = ibm_is_subnet_reserved_ip.management_vpc_vpe_zone_2_subnet_vpe_ip.reserved_ip
}

resource "ibm_is_virtual_endpoint_gateway_ip" "management_vpc_cos_gw_vpe_zone_3_gateway_ip" {
  gateway     = ibm_is_virtual_endpoint_gateway.management_vpc_cos_vpe_gateway.id
  reserved_ip = ibm_is_subnet_reserved_ip.management_vpc_vpe_zone_3_subnet_vpe_ip.reserved_ip
}

##############################################################################

##############################################################################
# Workload VPE Resources
##############################################################################

resource "ibm_is_subnet_reserved_ip" "workload_vpc_vpe_zone_1_subnet_vpe_ip" {
  subnet = module.workload_vpc.vpe_zone_1_id
}

resource "ibm_is_subnet_reserved_ip" "workload_vpc_vpe_zone_2_subnet_vpe_ip" {
  subnet = module.workload_vpc.vpe_zone_2_id
}

resource "ibm_is_subnet_reserved_ip" "workload_vpc_vpe_zone_3_subnet_vpe_ip" {
  subnet = module.workload_vpc.vpe_zone_3_id
}

resource "ibm_is_virtual_endpoint_gateway" "workload_vpc_cos_vpe_gateway" {
  name           = "${var.prefix}-workload-cos-vpe-gw"
  vpc            = module.workload_vpc.id
  resource_group = ibm_resource_group.workload_rg.id
  tags = []
  security_groups = [
    module.workload_vpc.workload_vpe_id
  ]
  target {
    crn           = "crn:v1:bluemix:public:cloud-object-storage:global:::endpoint:s3.direct.${var.region}.cloud-object-storage.appdomain.cloud"
    resource_type = "provider_cloud_service"
  }
}

resource "ibm_is_virtual_endpoint_gateway_ip" "workload_vpc_cos_gw_vpe_zone_1_gateway_ip" {
  gateway     = ibm_is_virtual_endpoint_gateway.workload_vpc_cos_vpe_gateway.id
  reserved_ip = ibm_is_subnet_reserved_ip.workload_vpc_vpe_zone_1_subnet_vpe_ip.reserved_ip
}

resource "ibm_is_virtual_endpoint_gateway_ip" "workload_vpc_cos_gw_vpe_zone_2_gateway_ip" {
  gateway     = ibm_is_virtual_endpoint_gateway.workload_vpc_cos_vpe_gateway.id
  reserved_ip = ibm_is_subnet_reserved_ip.workload_vpc_vpe_zone_2_subnet_vpe_ip.reserved_ip
}

resource "ibm_is_virtual_endpoint_gateway_ip" "workload_vpc_cos_gw_vpe_zone_3_gateway_ip" {
  gateway     = ibm_is_virtual_endpoint_gateway.workload_vpc_cos_vpe_gateway.id
  reserved_ip = ibm_is_subnet_reserved_ip.workload_vpc_vpe_zone_3_subnet_vpe_ip.reserved_ip
}

##############################################################################
