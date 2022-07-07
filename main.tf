resource "aws_iam_user" "admin_user" {
  name     = each.value
  for_each = toset(var.admin_users)
  tags = {
    Description = "Tech Lead"
  }
}

resource "aws_iam_user_login_profile" "userLogin" {
  for_each = aws_iam_user.admin_user
  user     = each.value.name
}

resource "aws_iam_policy" "adminUser" {
  name   = "AdminUsers"
  policy = file("admin-policy.json")
}

resource "aws_iam_user_policy_attachment" "admin-access" {
  for_each   = aws_iam_user.admin_user
  user       = each.value.name
  policy_arn = aws_iam_policy.adminUser.arn
}

output "password" {
  value = {
    for k, v in aws_iam_user_login_profile.userLogin : k => v.password
  }
}