module "densify-lookup" {
  source = "../densify-spec"
  densify_recommendations = "${var.densify_recommendations}"
  densify_terraform_id = "${var.name}"
}

resource "google_compute_instance" "create" {
  name         = "${var.name}"
  machine_type = "${module.densify-lookup.instance_type}"
  zone         = "us-central1-a"

  labels = {
	Owner = "${var.owner}"
	Current-instance-type = "${module.densify-lookup.Current_instance_type}"
    Densify-optimal-instance-type = "${module.densify-lookup.Densify_optimal_instance_type}"
    Densify-potential-monthly-savings = "${module.densify-lookup.Densify_potential_monthly_savings}"
    Densify-predicted-uptime = "${module.densify-lookup.Densify_predicted_uptime}"
    Densify-recommend-RI-coverage = "${module.densify-lookup.Densify_recommend_RI_coverage}"
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
