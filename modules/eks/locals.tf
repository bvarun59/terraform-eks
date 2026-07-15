locals {
  common_tags = merge(
    {
      ManagedBy = "Terraform"
      Project   = "EKS"
    },
    var.tags
  )
}