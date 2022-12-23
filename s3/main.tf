resource "aws_s3_bucket" "aha_bucket" {
  bucket = "aha-test-12324123"

  tags = {
    Name        = "aha-bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_object" "aha_object" {
    bucket = aws_s3_bucket.aha_bucket.bucket
    key =  "test_file.txt"
    source = "test_file.txt"
  
}