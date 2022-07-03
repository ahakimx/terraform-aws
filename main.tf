resource "aws_iam_user" "admin_user" {
  name = "ha"
  tags = {
    Description = "Tech Lead"
  }
}

