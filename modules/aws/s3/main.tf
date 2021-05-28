module "aws-s3-bucket" {
  source         = "trussworks/s3-private-bucket/aws"
  bucket         = "my-bucket-name"
  logging_bucket = "my-aws-logs"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
