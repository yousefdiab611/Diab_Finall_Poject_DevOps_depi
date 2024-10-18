resource "aws_instance" "nginx-host" {
  ami           = var.ec2_ami
  instance_type = "t2.micro"
  associate_public_ip_address = true
  key_name = "depi"
  vpc_security_group_ids = [aws_security_group.basion-sg.id]
  subnet_id = aws_subnet.public_net.id
  
  connection {
    type     = "ssh"
    user     = "ubuntu"
    private_key = file("~/.ssh/depi")
    host     = self.public_ip
  }
  
  provisioner "remote-exec" {
    inline = [
      "sudo apt update",
      "sudo apt install nginx -y"
    ]
  }
  
  tags = {
    Name = "nginx-host"
  }
}
