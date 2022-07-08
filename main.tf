resource "aws_iam_user" "admin_user" {
  name     = each.value
  for_each = toset(var.admin_users)
  tags = {
    Description = "Tech Lead"
  }
}
resource "aws_iam_group" "tech-lead" {
  name = "Tech-Lead"
}

resource "aws_iam_group_membership" "team" {
  name     = "tech-lead-group-membership"
  for_each = aws_iam_user.admin_user
  users    = [each.value.name]
  group    = aws_iam_group.tech-lead.name
}

resource "aws_iam_user_login_profile" "userLogin" {
  for_each = aws_iam_user.admin_user
  user     = each.value.name
}

resource "aws_iam_policy" "adminUser" {
  name   = "AdminUsers"
  policy = file("admin-policy.json")
}

# resource "aws_iam_user_policy_attachment" "admin-access" {
#   for_each   = aws_iam_user.admin_user
#   user       = each.value.name
#   policy_arn = aws_iam_policy.adminUser.arn
# }

resource "aws_iam_group_policy_attachment" "tech_lead_group_policy" {
  group      = aws_iam_group.tech-lead.name
  policy_arn = aws_iam_policy.adminUser.arn
}

output "password" {
  value = {
    for k, v in aws_iam_user_login_profile.userLogin : k => v.password
  }
}