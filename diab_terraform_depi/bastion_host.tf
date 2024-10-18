resource "aws_instance" "basion-host" {
  ami           = var.ec2_ami
  instance_type = "t2.micro"
  associate_public_ip_address = true
  key_name = "depi"
  user_data = file("./bash.sh")
  vpc_security_group_ids = [aws_security_group.basion-sg.id]
  subnet_id = aws_subnet.public_net.id
  
  provisioner "file" {
    source      = "/home/marwan/depi-tf/bash.sh"
    destination = "/home/ubuntu/bash.sh"
  }
  
  provisioner "file" {
    source      = "/home/marwan/depi-tf/provider.tf"
    destination = "/home/ubuntu/provider.tf"
  }
  
  connection {
    type     = "ssh"
    user     = "ubuntu"
    private_key = file("~/.ssh/depi")
    host     = self.public_ip
  }
  
  tags = {
    Name = "basion-host"
  }
}
