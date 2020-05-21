# Terra-require-naming-convention testing environment creates
# multiple resources and tests for PubsubTopic and Project names
# Fail environment uncomment code

/*
resource "google_project" "my" {
  name       = "Project with labels"
  project_id = "this-should-fail"
}
resource "google_pubsub_topic" "example" {
  name = "unacceptable-project-name"
}
*/

resource "google_compute_disk" "default" {
  name = "test-disk"
  type  = "pd-ssd"
  zone  = "us-central1-a"
  image = "debian-8-jessie-v20170523"
  physical_block_size_bytes = 4096
}

resource "google_pubsub_topic" "example" {
  name = "p-si-topicname"

}

resource "google_pubsub_topic" "topicname" {
  name = "p-gaf-topicname"
}

resource "google_compute_network" "vpc_network" {
  name = "vpc-network"
}


variable "id_string" {
  default ="idstring"
  description = "This also has a description"
}

variable "project_name" {
  description = "Project has a description"
  default = "np-si-projectname"
}