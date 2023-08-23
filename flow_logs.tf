##############################################################################
# Flow Logs Resources
##############################################################################

resource "ibm_iam_authorization_policy" "flow_logs_to_cos_object_storage_policy" {
  source_service_name         = "is"
  source_resource_type        = "flow-log-collector"
  description                 = "Allow flow logs write access cloud object storage instance"
  target_service_name         = "cloud-object-storage"
  target_resource_instance_id = ibm_resource_instance.cos_object_storage.guid
  roles = [
    "Writer"
  ]
}

resource "ibm_is_flow_log" "management_flow_log_collector" {
  name           = "${var.prefix}-management-vpc-logs"
  target         = module.management_vpc.id
  active         = true
  storage_bucket = ibm_cos_bucket.cos_object_storage_management_bucket_bucket.bucket_name
  resource_group = ibm_resource_group.management_rg.id
  tags = [
  ]
  depends_on = [
    ibm_iam_authorization_policy.flow_logs_to_cos_object_storage_policy
  ]
}

resource "ibm_is_flow_log" "workload_flow_log_collector" {
  name           = "${var.prefix}-workload-vpc-logs"
  target         = module.workload_vpc.id
  active         = true
  storage_bucket = ibm_cos_bucket.cos_object_storage_workload_bucket_bucket.bucket_name
  resource_group = ibm_resource_group.workload_rg.id
  tags = [
  ]
  depends_on = [
    ibm_iam_authorization_policy.flow_logs_to_cos_object_storage_policy
  ]
}

##############################################################################
