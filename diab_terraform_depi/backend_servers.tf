resource "aws_instance" "backend_1" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.private_1.id

  tags = {
    Name = "Backend Server 1"
  }
}

resource "aws_instance" "backend_2" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.private_2.id

  tags = {
    Name = "Backend Server 2"
  }
}
