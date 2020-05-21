# SQL Prevent authorized public CIDR range of 0.0.0.0/0
# Failure condition uncomment resource

resource "google_sql_database_instance" "postgres" {
  name             = "postgres-instance-946848957"
  database_version = "POSTGRES_11"

  settings {
    tier = "db-f1-micro"
    ip_configuration {
      authorized_networks {
        value = "10.0.0.0/0"
      }
    }
  }
}
/*
resource "google_sql_database_instance" "fail_postgres" {
  name             = "postgres-instance-946848957"
  database_version = "POSTGRES_11"

  settings {
    tier = "db-f1-micro"
    ip_configuration {
      authorized_networks {
        value = "0.0.0.0/0"
      }
    }
  }
}
*/