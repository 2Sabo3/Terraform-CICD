terraform {
  backend "s3" {
    bucket = "s3-terraform-state-lock-in"
    key = "state"
    region = "us-east-1"
    dynamodb_table = "lock-in"
  }
}