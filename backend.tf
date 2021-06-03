terraform {
  required_version = ">= 0.12.2"

  backend "s3" {
    region         = "us-west-2"
    bucket         = "backendfree"
    key            = "terraform.tfstate"
    dynamodb_table = "te-test-terraform-state-lock"
    profile        = ""
    role_arn       = ""
    encrypt        = "true"
  }
}
