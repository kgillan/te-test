data "aws_instance" "instance-locator120" {
  # filter to locate the existing EC2 instance
  filter {
    name   = "tag:Name"
    values = ["${var.name}"]
  }
  filter {
    name   = "tag:Owner"
    values = ["${var.owner}"]
  }
}
