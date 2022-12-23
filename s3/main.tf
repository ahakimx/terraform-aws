## create s3 bucket
resource "aws_s3_bucket" "aha_bucket" {
  bucket = "aha-test-12324123"

  tags = {
    Name        = "aha-bucket"
    Environment = "Dev"
  }
}


## create public policies
resource "aws_s3_bucket_public_access_block" "public_policy" {
    bucket = aws_s3_bucket.aha_bucket.id

    block_public_acls = false
    block_public_policy = false
    ignore_public_acls = false
    restrict_public_buckets = false
}

## upload object to bucket
resource "aws_s3_bucket_object" "aha_object" {
    bucket = aws_s3_bucket.aha_bucket.bucket
    key =  "index.html"
    source = "index.html"
  
}