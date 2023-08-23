##############################################################################
# Management VPC Outputs
##############################################################################

output "id" {
  value = ibm_is_vpc.management_vpc.id
}

output "crn" {
  value = ibm_is_vpc.management_vpc.crn
}

output "vsi_zone_1_id" {
  value = ibm_is_subnet.management_vsi_zone_1.id
}

output "vsi_zone_1_crn" {
  value = ibm_is_subnet.management_vsi_zone_1.crn
}

output "vpn_zone_1_id" {
  value = ibm_is_subnet.management_vpn_zone_1.id
}

output "vpn_zone_1_crn" {
  value = ibm_is_subnet.management_vpn_zone_1.crn
}

output "vsi_zone_2_id" {
  value = ibm_is_subnet.management_vsi_zone_2.id
}

output "vsi_zone_2_crn" {
  value = ibm_is_subnet.management_vsi_zone_2.crn
}

output "vsi_zone_3_id" {
  value = ibm_is_subnet.management_vsi_zone_3.id
}

output "vsi_zone_3_crn" {
  value = ibm_is_subnet.management_vsi_zone_3.crn
}

output "vpe_zone_1_id" {
  value = ibm_is_subnet.management_vpe_zone_1.id
}

output "vpe_zone_1_crn" {
  value = ibm_is_subnet.management_vpe_zone_1.crn
}

output "vpe_zone_2_id" {
  value = ibm_is_subnet.management_vpe_zone_2.id
}

output "vpe_zone_2_crn" {
  value = ibm_is_subnet.management_vpe_zone_2.crn
}

output "vpe_zone_3_id" {
  value = ibm_is_subnet.management_vpe_zone_3.id
}

output "vpe_zone_3_crn" {
  value = ibm_is_subnet.management_vpe_zone_3.crn
}

output "management_vpe_id" {
  value = ibm_is_security_group.management_vpc_management_vpe_sg.id
}

output "management_vsi_id" {
  value = ibm_is_security_group.management_vpc_management_vsi_sg.id
}

##############################################################################
