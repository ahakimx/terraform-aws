## iam policy for public access
data "aws_iam_policy_document" "allow_access" {
    statement {
        principals {
          type = "*"
          identifiers = ["*"]
        }
        actions = [
            "s3:GetObject"
        ]

        resources = [
           "${aws_s3_bucket.aha_bucket.arn}/*"
        ]
    }
}

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
    for_each = fileset("./files/", "**")
    bucket = aws_s3_bucket.aha_bucket.bucket
    key =  each.value
    source = "./files/${each.value}"
  
}

## create bucket policy
resource "aws_s3_bucket_policy" "allow_access" {
    bucket = aws_s3_bucket.aha_bucket.id
    policy = data.aws_iam_policy_document.allow_access.json
}

## create s3 static website
resource "aws_s3_bucket_website_configuration" "aha_website" {
    bucket = aws_s3_bucket.aha_bucket.bucket

    index_document {
        suffix = "index.html"
    }

    error_document {
        key = "index.html"
    }
}