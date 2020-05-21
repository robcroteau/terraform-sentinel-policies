# Checks whether ACL resources at object or bucket level attempt to assign a Legacy role
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

resource "google_storage_bucket_iam_binding" "legacy-binding" {
  bucket = "${google_storage_bucket.validate-store.name}"
  role = "roles/storage.legacyObjectOwner"
  members = [
    "user:jane@example.com",
  ]
}

resource "google_storage_bucket_iam_member" "legacy-member" {
  bucket = "${google_storage_bucket.validate-store.name}"
  role = "roles/storage.legacyObjectOwner"
  member = "user:jane@example.com"
}

#####
# Prevent Public buckets through object level defaults
resource "google_storage_default_object_acl" "public-object-default-acl" {
  bucket = "${google_storage_bucket.validate-store.name}"
  role_entity = [
    "OWNER:user-my.email@gmail.com",
    "roles/storage.legacyBucketReader:auseremail@domain.com",
  ]
}
#####
resource "google_storage_bucket_acl" "public_bucket_acl" {
  bucket = "${google_storage_bucket.validate-store.name}"

  role_entity = [
    "OWNER:user-my.email@gmail.com",
    "roles/storage.legacyBucketReader:auseremail@domain.com",
  ]
}
