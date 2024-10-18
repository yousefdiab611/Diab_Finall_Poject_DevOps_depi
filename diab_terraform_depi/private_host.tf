resource "aws_instance" "private-host" {
  ami           = var.ec2_ami
  instance_type = "t2.micro"
  associate_public_ip_address = false
  key_name = "depi"
  user_data = file("./bash.sh")
  vpc_security_group_ids = [aws_security_group.basion-sg.id]
  subnet_id = aws_subnet.private_net.id
  
  tags = {
    Name = "private-host"
  }
}
