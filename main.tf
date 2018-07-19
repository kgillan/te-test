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
