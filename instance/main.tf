resource "aws_instance" "create" {
  ami           = "ami-31c7f654"

  # old hardcoded instance type
  #instance_type = "m4.large"

  # new self-optimizing instance type from Densify
  instance_type = "${lookup(var.instancetype, var.name, lookup(var.applist, var.app, "t2.micro"))}"

  # tag instance with unique name for future reference
  tags {
    Name = "${var.name}"
    Owner = "${var.owner}"
  }

  # be sure not to delete other tags added by Densify
  lifecycle {
    ignore_changes = ["tags"]
  }
}
