# Require google_sql_database_instance SSL
# Failure condition uncomment resource without SSL forced
resource "google_sql_database_instance" "postgres" {
  name             = "postgres-instance-946848957"
  database_version = "POSTGRES_11"

  settings {
    tier = "db-f1-micro"

    ip_configuration {
      require_ssl = true
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