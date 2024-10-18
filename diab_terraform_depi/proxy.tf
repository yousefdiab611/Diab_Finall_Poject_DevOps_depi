resource "aws_instance" "proxy_1" {
  ami           = "ami-0c55b159cbfafe1f0" # Amazon Linux 2
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public_1.id

  tags = {
    Name = "Proxy 1"
  }
}

resource "aws_instance" "proxy_2" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public_2.id

  tags = {
    Name = "Proxy 2"
  }
}
resource "aws_lb_target_group" "internet_facing_tg" {
  name     = "internet-facing-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id

  target {
    id   = aws_instance.proxy.id  
    port = 80
  }
}
