# google_storage_object_acl is not tested, allowing individual
# objects to be declared public if necessary. 
# This file was used to generate the Mocks for sentinel
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
    "READER:auseremail@domain.com",
  ]
}

resource "google_storage_default_object_access_control" "public_object-access-control" {
  bucket = "${google_storage_bucket.validate-store.name}"
  role   = "READER"
  entity = "auseremail@domain.com"
}

#####
# Prevent Fully Public buckets through BUCKET level defaults
resource "google_storage_bucket_access_control" "public_bucket_access_control" {
  bucket = "${google_storage_bucket.validate-store.name}"
  role   = "READER"
  entity = "auseremail@domain.com"
}

resource "google_storage_bucket_acl" "public_bucket_acl" {
  bucket = "${google_storage_bucket.validate-store.name}"

  role_entity = [
    "OWNER:user-my.email@gmail.com",
    "READER:auseremail@domain.com",
  ]
}
/* Uncomment for failure conditions
#####
# Fully Public buckets through object level defaults
resource "google_storage_default_object_acl" "public-object-default-acl" {
  bucket = "${google_storage_bucket.validate-store.name}"
  role_entity = [
    "OWNER:user-my.email@gmail.com",
    "READER:allUsers",
  ]
}

resource "google_storage_default_object_access_control" "public_object-access-control" {
  bucket = "${google_storage_bucket.validate-store.name}"
  role   = "READER"
  entity = "allUsers"
}

#####
# Fully Public buckets through BUCKET level defaults
resource "google_storage_bucket_access_control" "public_bucket_access_control" {
  bucket = "${google_storage_bucket.validate-store.name}"
  role   = "READER"
  entity = "allUsers"
}

resource "google_storage_bucket_acl" "public_bucket_acl" {
  bucket = "${google_storage_bucket.validate-store.name}"

  role_entity = [
    "OWNER:user-my.email@gmail.com",
    "READER:allUsers",
  ]
}

#####
# Fully Public buckets through BUCKET binding/members
resource "google_storage_bucket_iam_binding" "legacy-binding" {
  bucket = "${google_storage_bucket.validate-store.name}"
  role = "roles/storage.objectCreator"
  members = [
    "user:jane@example.com",
    "allUsers"
  ]
}

resource "google_storage_bucket_iam_member" "legacy-member" {
  bucket = "${google_storage_bucket.validate-store.name}"
  role = "roles/storage.objectCreator"
  member = "allAuthenticatedUsers"
}

*/