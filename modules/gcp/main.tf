module "densify" {
  source  = "kgillan/densify/null"
  version = "1.0.1"

  # insert the 3 required variables here
  densify_recommendations = "${var.densify_recommendations}"
  densify_terraform_id = "${var.name}"
  densify_default = "${var.densify_default}"
}

resource "google_compute_instance" "create" {
  name         = "${var.name}"
  machine_type = "${module.densify-recommendations.instance_type}"
  zone         = "us-central1-a"

  labels = {
	owner = "${var.owner}"
	owner = "${var.owner}"
	current-instance-type = "${module.densify-recommendations.Current_instance_type}"
    densify-optimal-instance-type = "${module.densify-recommendations.Densify_optimal_instance_type}"
    densify-recommend-ri-coverage = "${module.densify-recommendations.Densify_recommend_RI_coverage}"
  }
  
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-8"
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }

  service_account {
    scopes = ["userinfo-email", "compute-ro", "storage-ro"]
  }
}
