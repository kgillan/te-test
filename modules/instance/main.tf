module "densify-recommendations" {
  source  = "app.terraform.io/Densify/densify/null"
  version = "1.0.0"
  densify_recommendations = "${var.densify_recommendations}"
  densify_terraform_id = "${var.name}"
  densify_default = "${var.densify_default}"
}

resource "aws_instance" "create" {
  ami           = "ami-31c7f654"

  # old hardcoded instance type
  #instance_type = "m4.large"

  # new self-optimizing instance type from Densify
  instance_type = "${module.densify-recommendations.instance_type}"

  # tag instance with unique name for future reference
  tags {
    Name = "${var.name}"
    Owner = "${var.owner}"
	Current-instance-type = "${module.densify-recommendations.Current_instance_type}"
    Densify-optimal-instance-type = "${module.densify-recommendations.Densify_optimal_instance_type}"
    Densify-potential-monthly-savings = "${module.densify-recommendations.Densify_potential_monthly_savings}"
    Densify-predicted-uptime = "${module.densify-recommendations.Densify_predicted_uptime}"
    Densify-recommend-RI-coverage = "${module.densify-recommendations.Densify_recommend_RI_coverage}"
  }

  # be sure not to delete other tags added by Densify
 
}
