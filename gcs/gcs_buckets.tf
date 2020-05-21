# google_storage_object_acl is not tested, allowing individual
# objects to be declared public if necessary. 
/*
resource "google_storage_bucket" "validate-store" {
  name     = "sentinel-test-${random_string.random.result}"
  location = "US"
}

resource "random_string" "random" {
  length = 6
  special = false
}

#####
# Prevent Public buckets through object level defaults
resource "google_storage_default_object_acl" "public-object-default-acl" {
  bucket = "${google_storage_bucket.validate-store.name}"
  role_entity = [
    "OWNER:user-my.email@gmail.com",
    "READER:bob@bob.com",
  ]
}

resource "google_storage_default_object_access_control" "public_object-access-control" {
  bucket = "${google_storage_bucket.validate-store.name}"
  role   = "READER"
  entity = "sue@sue.com"
}

#####
# Prevent Fully Public buckets through BUCKET level defaults
resource "google_storage_bucket_access_control" "public_bucket_access_control" {
  bucket = "${google_storage_bucket.validate-store.name}"
  role   = "READER"
  entity = "user@email.com"
}

resource "google_storage_bucket_acl" "public_bucket_acl" {
  bucket = "${google_storage_bucket.validate-store.name}"

  role_entity = [
    "OWNER:user-my.email@gmail.com",
    "READER:sue@sue.com",
  ]
}
*/