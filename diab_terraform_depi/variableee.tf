variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}
variable "vpc_name" {
  description = "VPC Name for Jenkins Server VPC"
  type        = string
}


variable "private_cidr" {
  description = "CIDR block for the private subnet"
  type        = string
  default     = "10.0.1.0/24"
}


variable "public_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
  default     = "10.0.2.0/24"
}


variable "route-cidr" {
  description = "CIDR block for the route table, usually set to 0.0.0.0/0 for internet access"
  type        = string
  default     = "0.0.0.0/0"
}



variable "ec2-ami" {
  description = "AMI ID used to launch EC2 instances, specifies the operating system and installed software"
  type        = string
  default     = "ami-0e86e20dae9224db8"
}


variable "http" {
  description = "Port number for HTTP traffic, typically set to 80"
  type        = number
  default     = 80
}

variable "aws_region" {
    description = "The region where the infrastructure should be deployed to"
    type = string
}

variable "aws_account_id" {
    description = "AWS Account ID"
    type = string
}

variable "backend_jenkins_bucket" {
    description = "S3 bucket where jenkins terraform state file will be stored"
    type = string
}

variable "backend_jenkins_bucket_key" {
    description = "bucket key for the jenkins terraform state file"
    type = string
}

variable "public_subnets" {
  description = "Subnets CIDR range"
  type        = list(string)
}

variable "instance_type" {
  description = "Instance Type"
  type        = string
}

variable "jenkins_security_group" {
  description = "Instance Type"
  type        = string
}

variable "jenkins_ec2_instance" {
  description = "Instance Type"
  type        = string
}