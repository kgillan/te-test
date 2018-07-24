module "ex-pro-appx-120" {
  source = "./modules/instance"
  owner = "${var.owner}"
  name = "ex-pro-appx-120"
  app = "web"
  densify_recommendations = "${var.densify_recommendations}"
  applist = "${var.applist}"
}

module "ex-pro-rais-131" {
  source = "./modules/instance"
  owner = "${var.owner}"
  name  = "ex-pro-rais-131"
  app = "database"
  densify_recommendations = "${var.densify_recommendations}"
  applist = "${var.applist}"
}

module "ex-pro-rais-132" {
  source = "./modules/instance"
  owner = "${var.owner}"
  name  = "ex-pro-rais-132"
  app = "database"
  densify_recommendations = "${var.densify_recommendations}"
  applist = "${var.applist}"
}

module "ex-dev-rais-132" {
  source = "./modules/gcp"
  owner = "${var.owner}"
  name  = "ex-dev-rais-132"
  app = "database"
  densify_recommendations = "${var.densify_recommendations}"
  applist = "${var.applist}"
}

resource "google_compute_instance" "create" {
  name         = "test2"
  machine_type = "n1-standard-1"
  zone         = "us-central1-a"

  labels = {
	owner = "${var.owner}"
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