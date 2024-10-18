terraform {
  backend "s3" {
    bucket = "diab-s3-backend"
    key    = "s3-backend/terraform/state"
    region = "us-west-2"
    dynamodb_table = "s3-backend"
  }
}
