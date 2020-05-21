# Require google_sql_database_instance backups
# Failure condition uncomment resource without backups enabled

resource "google_sql_database_instance" "postgres" {
  name             = "postgres-instance-946848957"
  database_version = "POSTGRES_11"

  settings {
    tier = "db-f1-micro"

    backup_configuration {
      enabled = true
    }
  }
}
/*
resource "google_sql_database_instance" "fail_postgres" {
  name             = "postgres-instance-946848957"
  database_version = "POSTGRES_11"

  settings {
    tier = "db-f1-micro"
  }
}
*/