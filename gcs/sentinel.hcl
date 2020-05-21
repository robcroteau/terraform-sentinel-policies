policy "gcs-prevent-legacy-roles" {
    enforcement_level = "hard-mandatory"
}

policy "gcs-require-versioning-enabled" {
    enforcement_level = "soft-mandatory"
}

policy "gcs-restrict-alluser-allauthuser-buckets" {
    enforcement_level = "hard-mandatory"
}

policy "gcs-restrict-public-buckets" {
    enforcement_level = "hard-mandatory"
}

