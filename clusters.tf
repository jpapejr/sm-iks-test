##############################################################################
# Secrets Manager Authorizations
##############################################################################

resource "ibm_iam_authorization_policy" "secrets_manager_secrets_manager_to_containers_policy" {
  target_service_name         = "secrets-manager"
  description                 = "Allow Secets Manager instance secrets-manager to encrypt kubernetes service"
  target_resource_instance_id = ibm_resource_instance.secrets_manager_secrets_manager.guid
  source_service_name         = "container-kubernetes"
  roles = [
    "Manager"
  ]
}

resource "ibm_container_ingress_instance" "cluster-sm-instance" {
  cluster = ibm_container_vpc_cluster.workload_vpc_workload_cluster_cluster.name
  instance_crn = ibm_resource_instance.secrets_manager_secrets_manager.crn
  is_default = true
}

##############################################################################

##############################################################################
# Workload Cluster Cluster
##############################################################################

resource "ibm_container_vpc_cluster" "workload_vpc_workload_cluster_cluster" {
  name                            = "${var.prefix}-workload-cluster-cluster"
  vpc_id                          = module.workload_vpc.id
  resource_group_id               = ibm_resource_group.workload_rg.id
  flavor                          = "bx2.4x16"
  worker_count                    = 2
  kube_version                    = "4.13.5_openshift"
  wait_till                       = "IngressReady"
  disable_public_service_endpoint = true
  entitlement                     = "cloud_pak"
  cos_instance_crn                = ibm_resource_instance.cos_object_storage.crn
  update_all_workers              = null
  tags = [
  ]
  zones {
    name      = "${var.region}-1"
    subnet_id = module.workload_vpc.vsi_zone_1_id
  }
  zones {
    name      = "${var.region}-2"
    subnet_id = module.workload_vpc.vsi_zone_2_id
  }
  zones {
    name      = "${var.region}-3"
    subnet_id = module.workload_vpc.vsi_zone_3_id
  }
  timeouts {
    create = "3h"
    update = "3h"
    delete = "2h"
  }
  kms_config {
    crk_id           = ibm_kms_key.kms_roks_key_key.key_id
    instance_id      = ibm_resource_instance.kms.guid
    private_endpoint = true
  }
}

##############################################################################

##############################################################################
# Workload Cluster Cluster Ingress Example
##############################################################################

resource "ibm_sm_secret_group" "secrets_manager_group_group" {
  name        = "${var.prefix}-secrets-manager-group"
  instance_id = ibm_resource_instance.secrets_manager_secrets_manager.guid
  description = "Secrets Manager group for workload-cluster ingress example"
  region      = var.region
}

resource "ibm_sm_arbitrary_secret" "secrets_manager_arbitrary_secret_secret" {
  name            = "${var.prefix}-secrets-manager-arbitrary-secret"
  instance_id     = ibm_resource_instance.secrets_manager_secrets_manager.guid
  secret_group_id = ibm_sm_secret_group.secrets_manager_group_group.secret_group_id
  region          = var.region
  endpoint_type   = "private"
  description     = "example"
  expiration_date = "1234"
  payload         = var.secrets_manager_example_secret_arbitrary_secret_data
  labels = [
    "my-label"
  ]
}

resource "ibm_sm_username_password_secret" "secrets_manager_username_secret_secret" {
  name            = "${var.prefix}-secrets-manager-username-secret"
  instance_id     = ibm_resource_instance.secrets_manager_secrets_manager.guid
  secret_group_id = ibm_sm_secret_group.secrets_manager_group_group.secret_group_id
  region          = var.region
  endpoint_type   = "private"
  description     = "username-password"
  expiration_date = "1234"
  username        = var.secrets_manager_example_secret_username
  password        = var.secrets_manager_example_secret_password
  labels = [
    "my-label"
  ]
  rotation {
    auto_rotate = true
    interval    = 1
    unit        = "day"
  }
}

resource "ibm_container_ingress_secret_opaque" "workload_cluster_ingress_example" {
  cluster          = ibm_container_vpc_cluster.workload_vpc_workload_cluster_cluster.name
  secret_name      = "${var.prefix}-ingress-example"
  secret_namespace = "ns"
  persistence      = true
  fields {
    crn = ibm_sm_arbitrary_secret.secrets_manager_arbitrary_secret_secret.crn
  }
  fields {
    crn = ibm_sm_username_password_secret.secrets_manager_username_secret_secret.crn
  }
}

##############################################################################
