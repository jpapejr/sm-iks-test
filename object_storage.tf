##############################################################################
# Object Storage Instance Atracker Cos
##############################################################################

resource "random_string" "atracker_cos_random_suffix" {
  length  = 8
  special = false
  upper   = false
}

resource "ibm_resource_instance" "atracker_cos_object_storage" {
  name              = "${var.prefix}-atracker-cos-object-storage-${random_string.atracker_cos_random_suffix.result}"
  resource_group_id = ibm_resource_group.service_rg.id
  service           = "cloud-object-storage"
  location          = "global"
  plan              = "standard"
  tags = [
  ]
}

resource "ibm_iam_authorization_policy" "atracker_cos_cos_to_kms_kms_policy" {
  source_service_name         = "cloud-object-storage"
  source_resource_instance_id = ibm_resource_instance.atracker_cos_object_storage.guid
  description                 = "Allow COS instance to read from KMS instance"
  target_service_name         = "kms"
  target_resource_instance_id = ibm_resource_instance.kms.guid
  roles = [
    "Reader"
  ]
}

resource "ibm_cos_bucket" "atracker_cos_object_storage_atracker_bucket_bucket" {
  bucket_name          = "${var.prefix}-atracker-cos-atracker-bucket-${random_string.atracker_cos_random_suffix.result}"
  resource_instance_id = ibm_resource_instance.atracker_cos_object_storage.id
  storage_class        = "standard"
  endpoint_type        = "private"
  force_delete         = true
  region_location      = var.region
  key_protect          = ibm_kms_key.kms_atracker_key_key.crn
  depends_on = [
    ibm_iam_authorization_policy.atracker_cos_cos_to_kms_kms_policy
  ]
}

resource "ibm_resource_key" "atracker_cos_object_storage_key_cos_bind_key" {
  name                 = "${var.prefix}-atracker-cos-key-cos-bind-key-${random_string.atracker_cos_random_suffix.result}"
  resource_instance_id = ibm_resource_instance.atracker_cos_object_storage.id
  role                 = "Writer"
  tags = [
  ]
}

##############################################################################

##############################################################################
# Object Storage Instance Cos
##############################################################################

resource "random_string" "cos_random_suffix" {
  length  = 8
  special = false
  upper   = false
}

resource "ibm_resource_instance" "cos_object_storage" {
  name              = "${var.prefix}-cos-object-storage-${random_string.cos_random_suffix.result}"
  resource_group_id = ibm_resource_group.service_rg.id
  service           = "cloud-object-storage"
  location          = "global"
  plan              = "standard"
  tags = [
  ]
}

resource "ibm_iam_authorization_policy" "cos_cos_to_kms_kms_policy" {
  source_service_name         = "cloud-object-storage"
  source_resource_instance_id = ibm_resource_instance.cos_object_storage.guid
  description                 = "Allow COS instance to read from KMS instance"
  target_service_name         = "kms"
  target_resource_instance_id = ibm_resource_instance.kms.guid
  roles = [
    "Reader"
  ]
}

resource "ibm_cos_bucket" "cos_object_storage_management_bucket_bucket" {
  bucket_name          = "${var.prefix}-cos-management-bucket-${random_string.cos_random_suffix.result}"
  resource_instance_id = ibm_resource_instance.cos_object_storage.id
  storage_class        = "standard"
  endpoint_type        = "private"
  force_delete         = true
  region_location      = var.region
  key_protect          = ibm_kms_key.kms_key_key.crn
  depends_on = [
    ibm_iam_authorization_policy.cos_cos_to_kms_kms_policy
  ]
}

resource "ibm_cos_bucket" "cos_object_storage_workload_bucket_bucket" {
  bucket_name          = "${var.prefix}-cos-workload-bucket-${random_string.cos_random_suffix.result}"
  resource_instance_id = ibm_resource_instance.cos_object_storage.id
  storage_class        = "standard"
  endpoint_type        = "private"
  force_delete         = true
  region_location      = var.region
  key_protect          = ibm_kms_key.kms_key_key.crn
  depends_on = [
    ibm_iam_authorization_policy.cos_cos_to_kms_kms_policy
  ]
}

##############################################################################

