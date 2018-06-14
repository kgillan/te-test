module "ex-pro-appx-120" {
  source = "./instance"
  owner = "${var.owner}"
  name = "ex-pro-appx-120"
  app = "web"
  instancetype = "${var.instancetype}"
  applist = "${var.applist}"
}

module "ex-pro-rais-131" {
  source = "./instance"
  owner = "${var.owner}"
  name  = "ex-pro-rais-131"
  app = "database"
  instancetype = "${var.instancetype}"
  applist = "${var.applist}"
}

module "ex-pro-rais-132" {
  source = "./instance"
  owner = "${var.owner}"
  name  = "ex-pro-rais-132"
  app = "database"
  instancetype = "${var.instancetype}"
  applist = "${var.applist}"
}
