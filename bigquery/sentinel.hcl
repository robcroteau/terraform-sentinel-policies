policy "bq-prevent-allauthenticatedusers" {
    enforcement_level = "hard-mandatory"
}

policy "bq-prevent-domain-auth" {
    enforcement_level = "soft-mandatory"
}

policy "bq-prevent-outside-sharing" {
    enforcement_level = "soft-mandatory"
}