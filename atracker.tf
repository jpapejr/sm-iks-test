##############################################################################
# Atracker Resources
##############################################################################

resource "ibm_atracker_target" "atracker_cos_target" {
  name        = "${var.prefix}-atracker-cos"
  region      = var.region
  target_type = "cloud_object_storage"
  cos_endpoint {
    endpoint   = "s3.private.${var.region}.cloud-object-storage.appdomain.cloud"
    target_crn = ibm_resource_instance.atracker_cos_object_storage.id
    bucket     = ibm_cos_bucket.atracker_cos_object_storage_atracker_bucket_bucket.bucket_name
    api_key    = ibm_resource_key.atracker_cos_object_storage_key_cos_bind_key.credentials.apikey
  }
}

resource "ibm_atracker_route" "atracker_cos_route" {
  name = "${var.prefix}-atracker-cos-route"
  rules {
    locations = [
      "global",
      "us-south"
    ]
    target_ids = [
      ibm_atracker_target.atracker_cos_target.id
    ]
  }
}

##############################################################################
