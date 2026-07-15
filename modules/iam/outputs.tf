output "alb_role_arn" {
  value = module.alb_irsa.iam_role_arn
}

output "externaldns_role_arn" {
  value = module.externaldns_irsa.iam_role_arn
}

output "ebs_role_arn" {
  value = module.ebs_csi_irsa.iam_role_arn
}