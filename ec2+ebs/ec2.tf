data "aws_ami" "this" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "architecture"
    values = ["arm64"]
  }
  filter {
    name   = "name"
    values = ["al2023-ami-2023*"]
  }
}

resource "aws_instance" "teste2" {
  ami           = var.ami
  subnet_id     = var.subnet_id
  instance_type = var.instance_type

  tags = {
    Name = "HelloWorld"
  }
}