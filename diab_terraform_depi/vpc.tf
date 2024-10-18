# -------------------------create vpc --------------------------------------

resource "aws_vpc" "diab_vpc" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"

  tags = {
    Name = "diab_vpc"
  }
}
#-----------------------Internet Gateway----------------------------------
resource "aws_internet_gateway" "diab_igw" {
  vpc_id = aws_vpc.diab_vpc.id

  tags = {
    Name = "diab_igw"
  }
}
#----------------------Elastic IP) لـ NAT Gateway---------------------------------------
resource "aws_eip" "lb_eip" {
  domain   = "vpc"
}

#--------------------------NAT Gateway------------------------------------------
resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.lb_eip.id
  subnet_id     = aws_subnet.public_net.id

  tags = {
    Name = "nat_gateway"
  }

  depends_on = [aws_internet_gateway.custom_igw]
}


#-------------------------Private Subnet)------------------------------------
resource "aws_subnet" "private_net" {
  vpc_id     = aws_vpc.diab_vpc.id
  cidr_block = var.private_cidr

  tags = {
    Name = "private_net"
  }
}
#-------------------------Public Subnet------------------------------------------

resource "aws_subnet" "public_net" {
  vpc_id     = aws_vpc.diab_vpc.id
  cidr_block = var.public_cidr
  map_public_ip_on_launch = true
  tags = {
    Name = "public_net"
  }
}




