provider "aws" {
    shared_config_files = ["/home/diab/.aws_task/config"]
    shared_credentials_files = [ "/home/diab/.aws_task/creadentials" ]
    profile = "default"
  
}


resource "daib_s3_bucket" "S3_bucket" {
    bucket = "diab-s3-backend-task6112003"

  versioning {
    enabled = true
  }

  tags = {
    Name = "Terraform State Bucket"
  }
}

resource "aws_dynamodb_table" "dynamodb-terraform-state-lock" {
    name = "dynamodb-terraform-state-lock"
    hash_key = "lockedID"
    read_capacity = 30
    write_capacity = 30

    attribute {
        name = "lockedID"
        type = "map"
        
    }
}
