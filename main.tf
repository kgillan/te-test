module "ex-pro-appx-120" {
  source = "./instance"
  owner = "${var.owner}"
  name = "ex-pro-appx-120"
}

module "ex-pro-rais-131" {
  source = "./instance"
  owner = "${var.owner}"
  name  = "ex-pro-rais-131"
}
