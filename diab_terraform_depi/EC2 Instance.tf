#------------------------EC2 Instance لـ Proxy:-----------------

resource "aws_instance" "proxy_instance" {
  ami           = "ami-0c55b159cbfafe1f0"  # AMI لـ Nginx
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public_net.id
  security_groups = [aws_security_group.proxy_sg.id]

  tags = {
    Name = "proxy_instance"
  }
}

resource "aws_security_group" "proxy_sg" {
  name   = "proxy_sg"
  vpc_id = aws_vpc.custom_vpc.id

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
    Name = "proxy_sg"
  }
}


resource "aws_lb" "internet_facing_lb" {
  name               = "internet-facing-lb"
  internal           = false  # هذا يجعل الـ Load Balancer متصل بالإنترنت
  load_balancer_type = "application"
  security_groups    = [aws_security_group.public_lb_sg.id]
  subnets            = [aws_subnet.public_1.id, aws_subnet.public_2.id]
}

resource "aws_lb_target_group" "internet_facing_tg" {
  name     = "internet-facing-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id
}

resource "aws_lb_listener" "internet_facing_lb_listener" {
  load_balancer_arn = aws_lb.internet_facing_lb.arn
  port              = 80
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.internet_facing_tg.arn
  }
}
