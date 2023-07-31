/*data "aws_iam_policy_document" "manager" {
  statement {
    sid    = "AllowManagers"
    effect = "Allow"
    actions = [
      "*"
    ]
    resources = ["*"]
  }
}
*/

data "aws_iam_policy_document" "creator-assume-role" {
  statement {
    sid    = "AllowAssumeRole"
    effect = "Allow"
    actions = [
      "sts:AssumeRole",
    ]

    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:user/demola", 
                     "arn:aws:iam::${data.aws_caller_identity.current.account_id}:user/john"
                     ]
    }
  }
}
/*
data "aws_iam_policy_document" "eks-creator-policy" {
  statement {
    sid     = "AllowCreator"
    effect  = "Allow"
    actions = ["*"]

  }
  statement {
    sid    = "AllowPassRole"
    effect = "Allow"
    actions = [
      "iam:PassRole"
    ]
    resources = ["*"]
    condition {
      test     = "StringEquals"
      variable = "iam:PassedToService"
      values   = ["eks.amazonaws.com"]
    }
  }
}

data "aws_iam_user" "john" {
  user_name = "john"
}
*/
data "aws_caller_identity" "current" {}

# creator-role-arn = "arn:aws:iam::839796432301:role/eks-creator-role"
# manager-group-arn = "arn:aws:iam::839796432301:group/Manager"