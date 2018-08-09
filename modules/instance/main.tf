module "densify" {
  source  = "kgillan/densify/null"
  version = "1.0.1"

  # insert the 3 required variables here
  densify_recommendations = "${var.densify_recommendations}"
  densify_terraform_id = "${var.name}"
  densify_default = "${var.densify_default}"
}
resource "aws_instance" "create" {
  ami           = "ami-31c7f654"

  # old hardcoded instance type
  #instance_type = "m4.large"

  # new self-optimizing instance type from Densify
  instance_type = "${module.densify.instance_type}"

  # tag instance with unique name for future reference
  tags {
    Name = "${var.name}"
    Owner = "${var.owner}"
	Current-instance-type = "${module.densify.Current_instance_type}"
    Densify-optimal-instance-type = "${module.densify.Densify_optimal_instance_type}"
    Densify-potential-monthly-savings = "${module.densify.Densify_potential_monthly_savings}"
    Densify-predicted-uptime = "${module.densify.Densify_predicted_uptime}"
    Densify-recommend-RI-coverage = "${module.densify.Densify_recommend_RI_coverage}"
	Densify-Terraform-ID = "${var.name}"
  }

  # be sure not to delete other tags added by Densify
 
}
