resource "aws_vpc" "my_vpc" {
  cidr_block = "10.1.0.0/16"
  tags = {
    Name = "My VPC"
  }
}


resource "aws_subnet" "my_subnet_public_1" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.1.0.0/20"

  tags = {
    Name = "my-subnet-public-1"
  }
}

resource "aws_subnet" "my_subnet_public_2" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.1.16.0/20"

  tags = {
    Name = "my-subnet-public-2"
  }
}

resource "aws_subnet" "my_subnet_private_1" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.1.32.0/20"

  tags = {
    Name = "my-subnet-private-1"
  }
}

resource "aws_subnet" "my_subnet_private_2" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.1.48.0/20"

  tags = {
    Name = "my-subnet-private-2"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "my-igw"
  }
}

resource "aws_route_table" "my_public_route_table" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "my_public_route_table"
  }
}

resource "aws_route_table_association" "association_route_table_public_subnet1" {
  subnet_id      = aws_subnet.my_subnet_public_1.id
  route_table_id = aws_route_table.my_public_route_table.id
}

resource "aws_route_table_association" "association_route_table_public_subnet2" {
  subnet_id      = aws_subnet.my_subnet_public_2.id
  route_table_id = aws_route_table.my_public_route_table.id
}

resource "aws_route_table" "my_private_route_table_1" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "my_private_route_table"
  }
}

resource "aws_route_table" "my_private_route_table_2" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "my_private_route_table"
  }
}

resource "aws_route_table_association" "association_route_table_private_subnet1" {
  subnet_id      = aws_subnet.my_subnet_private_1.id
  route_table_id = aws_route_table.my_private_route_table_1.id
}

resource "aws_route_table_association" "association_route_table_private_subnet2" {
  subnet_id      = aws_subnet.my_subnet_private_2.id
  route_table_id = aws_route_table.my_private_route_table_2.id
}