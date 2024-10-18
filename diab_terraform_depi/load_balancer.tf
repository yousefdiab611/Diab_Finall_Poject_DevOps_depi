resource "aws_lb" "public_lb" {
  name               = "public-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.public_lb_sg.id]
  subnets            = [aws_subnet.public_net.id]

  tags = {
    Name = "public_lb"
  }
}

resource "aws_lb" "private_lb" {
  name               = "private-lb"
  internal           = true
  load_balancer_type = "application"
  security_groups    = [aws_security_group.private_lb_sg.id]
  subnets            = [aws_subnet.private_net.id]

  tags = {
    Name = "private_lb"
  }
}

#------------------------security group - load blancer -------------

resource "aws_security_group" "public_lb_sg" {
  name        = "public-lb-sg"
  vpc_id      = aws_vpc.custom_vpc.id

  ingress { 
    from_port   = 80
    to_port     = 60
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
    Name = "public_lb_sg"
  }
}

resource "aws_security_group" "private_lb_sg" {
  name        = "private-lb-sg"
  vpc_id      = aws_vpc.custom_vpc.id

  ingress {
    from_port   = 80
    to_port     = 60
    protocol    = "tcp"
    cidr_blocks = [aws_subnet.private_net.cidr_block]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "private_lb_sg"
  }
}

