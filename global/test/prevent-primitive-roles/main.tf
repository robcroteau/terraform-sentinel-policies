resource "google_billing_account_iam_member" "ok-role" {
  billing_account_id = "00AA00-000AAA-00AA0A"
  role               = "roles/billingAdmin"
  member             = "user:alice@gmail.com"
}

resource "google_kms_key_ring_iam_member" "ok-role" {
  key_ring_id = "your-key-ring-id"
  role        = "roles/encrypterDecrypter"
  member      = "user:jane@example.com"
}

resource "google_organization_iam_member" "ok-role" {
  org_id = "0123456789"
  role   = "roles/folderAdmin"
  member = "user:alice@gmail.com"
}

resource "google_storage_bucket_iam_binding" "ok-role" {
  bucket = "my-bucket-id"
  role = "roles/objectCreator"
  members = [
    "user:jane@example.com",
  ]
}

resource "google_project_iam_binding" "ok-role" {
  project = "your-project-id"
  role    = "roles/anythingReally"

  members = [
    "user:jane@example.com",
  ]
}

resource "google_service_account_iam_binding" "ok-role" {
  service_account_id = "${google_service_account.sa.name}"
  role               = "roles/saUser"

  members = [
    "user:jane@example.com",
  ]
}

resource "google_service_account" "sa" {
  account_id   = "my-service-account"
  display_name = "A service account that only Jane can use"
}

/***************
// Fail conditions
*****************/
/*


resource "google_billing_account_iam_member" "primitive-role" {
  billing_account_id = "00AA00-000AAA-00AA0A"
  role               = "Owner"
  member             = "user:alice@gmail.com"
}

resource "google_kms_key_ring_iam_member" "primitive-role" {
  key_ring_id = "your-key-ring-id"
  role        = "viewer"
  member      = "user:jane@example.com"
}

resource "google_organization_iam_member" "primitive-role" {
  org_id = "0123456789"
  role   = "Editor"
  member = "user:alice@gmail.com"
}

resource "google_storage_bucket_iam_binding" "primitive-role" {
  bucket = "my-bucket-id"
  role = "Owner"
  members = [
    "user:jane@example.com",
  ]
}

resource "google_project_iam_binding" "primitive-role" {
  project = "your-project-id"
  role    = "Editor"

  members = [
    "user:jane@example.com",
  ]
}

resource "google_service_account_iam_binding" "primitive-role" {
  service_account_id = "${google_service_account.sa.name}"
  role               = "Viewer"

  members = [
    "user:jane@example.com",
  ]
}

*/