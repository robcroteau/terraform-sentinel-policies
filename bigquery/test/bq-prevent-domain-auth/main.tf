# Bigquery Prevent Domain Wide Access
# Failure condition uncomment resource
provider "google" {
  project     = "faux-dev"
  region      = "us-central1"
}


resource "google_bigquery_dataset" "pass_dataset" {
  dataset_id                  = "example_dataset"
  friendly_name               = "test"
  description                 = "This is a test description"
  location                    = "US"
  default_table_expiration_ms = 3600000

  labels = {
    env = "default"
  }

  access {
    role          = "OWNER"
    user_by_email = "bob@bob.com"
  }
}

resource "google_bigquery_dataset" "fail_dataset" {
  dataset_id                  = "example_dataset"
  friendly_name               = "test"
  description                 = "This is a test description"
  location                    = "US"
  default_table_expiration_ms = 3600000

  labels = {
    env = "default"
  }

  access {
    role          = "OWNER"
    user_by_email = "bob@bob.com"
  }

  access {
    role   = "READER"
    domain = "test.com"
  }
}
