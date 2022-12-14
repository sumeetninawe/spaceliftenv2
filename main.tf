variable "name_tag" {
  type        = string
  description = "Name of the EC2 instance"
  default     = "EC2"
}

variable "workspace" {
  type        = string
  description = "workspace value"
}

resource "aws_instance" "my_vm" {
  count         = var.workspace == "prod" ? 3 : 1
  ami           = var.ami //Ubuntu AMI
  instance_type = var.instance_type

  tags = {
    Name = format("%s_%s", var.name_tag, var.workspace)
  }
}
