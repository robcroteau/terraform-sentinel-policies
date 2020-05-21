policy "sql-prevent-authorized-public" {
    enforcement_level = "hard-mandatory"
}

policy "sql-require-backups" {
    enforcement_level = "hard-mandatory"
}

policy "sql-require-ssl" {
    enforcement_level = "soft-mandatory"
}