module "lookup" {
  source = "../lookup"
  owner = "${var.owner}"
  name = "${var.name}"
}

resource "aws_instance" "create" {
  ami           = "ami-31c7f654"

  # old hardcoded instance type
  #instance_type = "m4.large"

  # new self-optimizing instance type from Densify
  instance_type = "${module.lookup.Densify-optimal-instance-type}"

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
