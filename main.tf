#Example create an instance in GCP

resource "google_compute_instance" "create" {
  name         = "test2"
  machine_type = "n1-standard-1"
  zone         = "us-central1-a"

  labels = {
	owner = "${var.owner}"
  }
  
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
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

#Example 2 Modules and reusable code.

module "ex-pro-appx-120" {
  source = "./modules/instance"
  owner = "${var.owner}"
  name = "ex-pro-appx-120"
  app = "web"
  densify_recommendations = "${var.densify_recommendations}"
  densify_default = "${var.densify_default}"
}

module "ex-pro-rais-131" {
  source = "./modules/instance"
  owner = "${var.owner}"
  name  = "ex-pro-rais-131"
  app = "database"
  densify_recommendations = "${var.densify_recommendations}"
  densify_default = "${var.densify_default}"
}

module "ex-pro-rais-132" {
  source = "./modules/instance"
  owner = "${var.owner}"
  name  = "ex-pro-rais-132"
  app = "database"
  densify_recommendations = "${var.densify_recommendations}"
  densify_default = "${var.densify_default}"
}

module "ex-dev-rais-132" {
  source = "./modules/gcp"
  owner = "${var.owner}"
  name  = "ex-dev-rais-132"
  app = "database"
  densify_recommendations = "${var.densify_recommendations}"
  densify_default = "${var.densify_default}"
}

#Example 3 Create a vm in GCP using Self optimization

module "densify" {
  source  = "kgillan/densify/null"
  version = "1.0.1"

  # insert the 3 required variables here
  densify_recommendations = "${var.densify_recommendations}"
  densify_terraform_id = "ex-dev-rais-134"
  densify_default = "${var.densify_default}"
}

resource "google_compute_instance" "create2" {
  name         = "ex-dev-rais-134"
  machine_type = "${module.densify.instance_type}"
  zone         = "us-central1-a"

  labels = {
	owner = "${var.owner}"
	current-instance-type = "${module.densify.Current_instance_type}"
    densify-optimal-instance-type = "${module.densify.Densify_optimal_instance_type}"
    densify-recommend-ri-coverage = "${module.densify.Densify_recommend_RI_coverage}"
  }
  
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
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
