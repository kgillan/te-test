output "Densify-optimal-instance-type" {
  value = "${data.aws_instance.instance-locator120.tags.Densify-optimal-instance-type}"
}
