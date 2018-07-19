module "densify-lookup" {
  source = "../densify-spec"
  densify_recommendations = "${var.densify_recommendations}"
  densify_terraform_id = "${var.name}"
}

resource "aws_instance" "create" {
  ami           = "ami-31c7f654"

  # old hardcoded instance type
  #instance_type = "m4.large"

  # new self-optimizing instance type from Densify
  instance_type = "${module.densify-lookup.instance_type}"

  # tag instance with unique name for future reference
  tags {
    Name = "${var.name}"
    Owner = "${var.owner}"
	Current-instance-type = "${module.densify-lookup.Current_instance_type}"
    Densify-optimal-instance-type = "${module.densify-lookup.Densify_optimal_instance_type}"
    Densify-potential-monthly-savings = "${module.densify-lookup.Densify_potential_monthly_savings}"
    Densify-predicted-uptime = "${module.densify-lookup.Densify_predicted_uptime}"
    Densify-recommend-RI-coverage = "${module.densify-lookup.Densify_recommend_RI_coverage}"
  }

  # be sure not to delete other tags added by Densify
  lifecycle {
    ignore_changes = ["tags"]
  }
}
