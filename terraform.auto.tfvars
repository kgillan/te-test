owner = "kevin"
applist = {
  "web" = "c5.large"
  "database" = "m5.large"
}
densify_recommendations = {
  ex-pro-appx-120 = {
	rec_type = "m4.large"
	cur_type = "m4.xlarge"
	appr_type = "all"
	mnth_sav = "31.43"
	p_uptime = "83.4"
	ri_cover = "no"
  }
  ex-dev-appx-202 = {
	rec_type = "m5.large"
	cur_type = "m4.xlarge"
	appr_type = "m5.large"
	mnth_sav = "$42.50"
	p_uptime = "98.5"
	ri_cover = "yes"
  } 
  ex-pro-rais-131 = {
	rec_type = "m4.large"
	cur_type = "c4.large"
	appr_type = "c4.large"
	mnth_sav = "$42.50"
	p_uptime = "98.5"
	ri_cover = "yes"
  }
  ex-pro-rais-132 = {
	rec_type = "t2.medium"
	cur_type = "m4.xlarge"
	appr_type = "t2.medium"
	mnth_sav = "$42.50"
	p_uptime = "98.5"
	ri_cover = "yes"
  } 
  ex-dev-rais-132 = {
	rec_type = "n1-standard-16"
	cur_type = "n1-standard-2"
	appr_type = "all"
	mnth_sav = "42.50"
	p_uptime = "98.5"
	ri_cover = "yes"
  }
}
densify_default ={
	rec_type = "m4.large"
	cur_type = "m4.xlarge"
	appr_type = "all"
	mnth_sav = "31.43"
	p_uptime = "83.4"
	ri_cover = "no"
}
