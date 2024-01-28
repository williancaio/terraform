data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "teste" {
  ami           = "ami-0b98a32b1c5e0d105"
  subnet_id     =   ""
  instance_type = "t2.micro"

  tags = {
    Name = "HelloWorld"
  }
}