variable "name_tag" {
  type        = string
  description = "Name of the EC2 instance"
  default     = "EC2"
}

resource "aws_instance" "my_vm" {
  count         = terraform.workspace == "default" ? 3 : 1
  ami           = var.ami //Ubuntu AMI
  instance_type = var.instance_type

  tags = {
    Name = format("%s_%s_%s", var.name_tag, terraform.workspace, count.index)
  }
}
