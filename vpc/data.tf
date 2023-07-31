# Assume role policy for nodes
data "aws_iam_policy_document" "nodes" {
  statement {
    sid    = "AllowEKSAssumeRole"
    effect = "Allow"
    actions = [
      "sts:AssumeRole",
    ]
    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

#Assume role policy for cluster
data "aws_iam_policy_document" "eks_assume_role" {
  statement {
    sid    = "AllowEKSAssumeRole"
    effect = "Allow"
    actions = [
      "sts:AssumeRole"
    ]
    principals {
      type        = "Service"
      identifiers = ["eks.amazonaws.com"]
    }
  }
}



#demo_eks_role = "eks-cluster-demo"
#node_role = "eks-node-group-nodes"
#private = [
 # "subnet-0246acf9a97446698",
  #"subnet-0c1e1d4635416f1c7",
#]
#public = [
 # "subnet-0ff8dab9d0dbc063a",
  #"subnet-020f11c17512a98f1",
#]