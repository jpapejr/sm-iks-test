##############################################################################
# IBM Cloud Provider
##############################################################################

provider "ibm" {
  ibmcloud_api_key = var.ibmcloud_api_key
  region           = var.region
  ibmcloud_timeout = 60
}

##############################################################################

##############################################################################
# Management VPC Module
##############################################################################

module "management_vpc" {
  source           = "./management_vpc"
  region           = var.region
  prefix           = var.prefix
  management_rg_id = ibm_resource_group.management_rg.id
  tags = [
  ]
}

##############################################################################

##############################################################################
# Workload VPC Module
##############################################################################

module "workload_vpc" {
  source         = "./workload_vpc"
  region         = var.region
  prefix         = var.prefix
  workload_rg_id = ibm_resource_group.workload_rg.id
  tags = [
  ]
}

##############################################################################
