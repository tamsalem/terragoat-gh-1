data "google_compute_zones" "zones" {}

resource "google_compute_instance" "server" {
  machine_type = "n1-standard-1"
  name         = "terragoat-${var.environment}-machine"
  zone         = data.google_compute_zones.zones.names[0]
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
    auto_delete = true
  }
  network_interface {
    subnetwork = google_compute_subnetwork.public-subnetwork.name
    access_config {}
  }
  can_ip_forward = true

  metadata = {
    block-project-ssh-keys = false
    enable-oslogin         = false
    serial-port-enable     = true
  }
  labels = {
    git_commit           = "45609ea68b4439bf7793e38ed1c08b084ec93b8c"
    git_file             = "terraform183__gcp__instances_tf"
    git_last_modified_at = "2022-04-19-15-25-35"
    git_last_modified_by = "tamsalem"
    git_modifiers        = "tamsalem"
    git_org              = "tamsalem"
    git_repo             = "terragoat-gh-1"
    yor_trace            = "cd562b76-fbce-4e60-8c75-c9f43d7ffc16"
  }
}

resource "google_compute_disk" "unencrypted_disk" {
  name = "terragoat-${var.environment}-disk"
  labels = {
    git_commit           = "45609ea68b4439bf7793e38ed1c08b084ec93b8c"
    git_file             = "terraform183__gcp__instances_tf"
    git_last_modified_at = "2022-04-19-15-25-35"
    git_last_modified_by = "tamsalem"
    git_modifiers        = "tamsalem"
    git_org              = "tamsalem"
    git_repo             = "terragoat-gh-1"
    yor_trace            = "bf87b7d7-a9d8-4f03-a0d4-8a4cbb647d03"
  }
}