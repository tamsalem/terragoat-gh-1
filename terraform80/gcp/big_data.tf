resource "google_sql_database_instance" "master_instance" {
  name             = "terragoat-${var.environment}-master"
  database_version = "POSTGRES_11"
  region           = var.region

  settings {
    tier = "db-f1-micro"
    ip_configuration {
      ipv4_enabled = true
      authorized_networks {
        name  = "WWW"
        value = "0.0.0.0/0"
      }
    }
    backup_configuration {
      enabled = false
    }
  }
}

resource "google_bigquery_dataset" "dataset" {
  dataset_id = "terragoat_${var.environment}_dataset"
  access {
    special_group = "allAuthenticatedUsers"
    role          = "READER"
  }
  labels = {
    git_commit           = "45609ea68b4439bf7793e38ed1c08b084ec93b8c"
    git_file             = "terraform80__gcp__big_data_tf"
    git_last_modified_at = "2022-04-19-15-25-35"
    git_last_modified_by = "tamsalem"
    git_modifiers        = "tamsalem"
    git_org              = "tamsalem"
    git_repo             = "terragoat-gh-1"
    yor_trace            = "2560d883-bc3a-4cb6-b9fc-fb666edf626e"
  }
}