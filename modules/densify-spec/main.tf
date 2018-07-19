locals{
  densify_spec = "${var.densify_recommendations[var.densify_terraform_id]}"
  instance_type = "${lookup(local.densify_spec,"appr_type") == "all" ? 
			lookup(local.densify_spec,"rec_type") : 
			lookup(local.densify_spec,"appr_type") == lookup(local.densify_spec,"rec_type") ? 
				lookup(local.densify_spec,"rec_type") : 
				lookup(local.densify_spec,"cur_type")}"
				
  Current_instance_type = "${lookup(local.densify_spec,"cur_type")}"
  Densify_optimal_instance_type = "${lookup(local.densify_spec,"rec_type")}"
  Densify_potential_monthly_savings = "${lookup(local.densify_spec,"mnth_sav")}"
  Densify_predicted_uptime = "${lookup(local.densify_spec,"p_uptime")}"
  Densify_recommend_RI_coverage = "${lookup(local.densify_spec,"ri_cover")}"
}

resource "null_resource" "densify_spec" {
  triggers = "${var.densify_recommendations[var.densify_terraform_id]}"
}