output "private" {
  value = aws_subnet.private.*.id
}

output "public" {
  value = aws_subnet.public.*.id
}

output "demo_eks_role" {
  value = aws_iam_role.demo
}

output "node_role" {
  value = aws_iam_role.nodes
}

