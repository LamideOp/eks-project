resource "aws_iam_role" "eks-creator-role" {
  assume_role_policy = data.aws_iam_policy_document.creator-assume-role.json
  name               = "eks-creator-role"
}

/*
resource "aws_iam_role_policy_attachment" "admin_policy" {
  role       = aws_iam_role.eks-creator-role.name
  policy_arn = aws_iam_policy.manager_policy.arn
}*/
# aws managed policy is required to be able to create some resources
resource "aws_iam_role_policy_attachment" "admin_aws_managed" {
  role       = aws_iam_role.eks-creator-role.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

output "creator-role-arn" {
  value = aws_iam_role.eks-creator-role.arn
}

/*
resource "aws_iam_role_policy" "eks-creator-policy" {
  name   = "eks-creator-policy"
  role   = aws_iam_role.eks-creator-role.name
  policy = data.aws_iam_policy_document.eks-creator-policy.json

}

resource "aws_iam_role_policy_attachment" "creator-permissions" {
  role       = aws_iam_role.eks-creator-role.name
  policy_arn = aws_iam_role_policy.eks-creator-policy.arn
}
*/

/*
resource "aws_iam_group" "manager" {
  name = "Manager"
}*/
/*
resource "aws_iam_policy" "manager_policy" {
  name   = "manager"
  policy = data.aws_iam_policy_document.manager.json
}*/

/*
resource "aws_iam_group_membership" "manager" {
  name = "creator-group-membership"
  users = [
    data.aws_iam_user.john.user_name,
  ]
  group = aws_iam_group.manager.name
}
*/


