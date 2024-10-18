#-----------SSH (public key)  acsses EC2 instances-------------
resource "aws_key_pair" "aws-keys" {
  key_name   = "depi"
  public_key = "ssh-rsa AAAAB..."
}
