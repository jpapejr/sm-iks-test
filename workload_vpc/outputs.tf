##############################################################################
# Workload VPC Outputs
##############################################################################

output "id" {
  value = ibm_is_vpc.workload_vpc.id
}

output "crn" {
  value = ibm_is_vpc.workload_vpc.crn
}

output "vsi_zone_1_id" {
  value = ibm_is_subnet.workload_vsi_zone_1.id
}

output "vsi_zone_1_crn" {
  value = ibm_is_subnet.workload_vsi_zone_1.crn
}

output "vsi_zone_2_id" {
  value = ibm_is_subnet.workload_vsi_zone_2.id
}

output "vsi_zone_2_crn" {
  value = ibm_is_subnet.workload_vsi_zone_2.crn
}

output "vsi_zone_3_id" {
  value = ibm_is_subnet.workload_vsi_zone_3.id
}

output "vsi_zone_3_crn" {
  value = ibm_is_subnet.workload_vsi_zone_3.crn
}

output "vpe_zone_1_id" {
  value = ibm_is_subnet.workload_vpe_zone_1.id
}

output "vpe_zone_1_crn" {
  value = ibm_is_subnet.workload_vpe_zone_1.crn
}

output "vpe_zone_2_id" {
  value = ibm_is_subnet.workload_vpe_zone_2.id
}

output "vpe_zone_2_crn" {
  value = ibm_is_subnet.workload_vpe_zone_2.crn
}

output "vpe_zone_3_id" {
  value = ibm_is_subnet.workload_vpe_zone_3.id
}

output "vpe_zone_3_crn" {
  value = ibm_is_subnet.workload_vpe_zone_3.crn
}

output "workload_vpe_id" {
  value = ibm_is_security_group.workload_vpc_workload_vpe_sg.id
}

##############################################################################
