##############################################################################
# Key Management Authorizations
##############################################################################

resource "ibm_iam_authorization_policy" "secrets_manager_to_kms_kms_policy" {
  source_service_name         = "secrets-manager"
  description                 = "Allow Secets Manager instance to read from KMS instance"
  target_service_name         = "kms"
  target_resource_instance_id = ibm_resource_instance.kms.guid
  roles = [
    "Reader"
  ]
}

##############################################################################

##############################################################################
# Secrets Manager Instances
##############################################################################

resource "ibm_resource_instance" "secrets_manager_secrets_manager" {
  name              = "${var.prefix}-secrets-manager"
  location          = var.region
  plan              = "standard"
  service           = "secrets-manager"
  resource_group_id = ibm_resource_group.service_rg.id
  parameters = {
    kms_key = ibm_kms_key.kms_key_key.crn
  }
  timeouts {
    create = "1h"
    delete = "1h"
  }
  tags = [
  ]
  depends_on = [
    ibm_iam_authorization_policy.secrets_manager_to_kms_kms_policy
  ]
}

##############################################################################
