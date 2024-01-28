resource "aws_instance" "teste" {
  ami           = var.ami
  subnet_id     = var.subnet_id
  instance_type = var.instance_type

  tags = {
    Name = "HelloWorld"
  }
}