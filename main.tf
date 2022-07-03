resource "aws_iam_user" "admin_user" {
  name = "ha"
  tags = {
    Description = "Tech Lead"
  }
}

resource "aws_iam_policy" "adminUser" {
  name   = "AdminUsers"
  policy = file("admin-policy.json")
}

resource "aws_iam_user_policy_attachment" "admin-access" {
  user       = aws_iam_user.admin_user.name
  policy_arn = aws_iam_policy.adminUser.arn
}