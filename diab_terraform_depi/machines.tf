# ----------------EC2 Instance for Proxy-----------------
resource "aws_instance" "proxy_instance" {
  ami           = var.ec2_ami
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public_net.id
  security_groups = [aws_security_group.proxy_sg.id]

  tags = {
    Name = "proxy_instance"
  }
}

# -------------Security Group for Proxy EC2 Instance-------------
resource "aws_security_group" "proxy_sg" {
  name   = "proxy_sg"
  vpc_id = aws_vpc.custom_vpc.id

  ingress {
    from_port   = var.http
    to_port     = var.http
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "proxy_sg"
  }
}
