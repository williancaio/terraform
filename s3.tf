resource "aws_s3_bucket" "my_tf_bucket" {
  bucket = "my-tf-test-bucket-3ce6786a"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_public_access_block" "my_tf_bucket_public_access_block" {
  bucket = aws_s3_bucket.my_tf_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_versioning" "my_tf_bucket_versioning" {
  bucket = aws_s3_bucket.my_tf_bucket.id
  versioning_configuration {
    status = "Disabled"
  }
}