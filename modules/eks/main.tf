module "eks" {

  source  = "terraform-aws-modules/eks/aws"
  version = "~>21.24"

  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version

  vpc_id = var.vpc_id

  subnet_ids = var.private_subnets

  enable_irsa = true

  cluster_endpoint_public_access = true

  enable_cluster_creator_admin_permissions = true

  authentication_mode = "API_AND_CONFIG_MAP"

  eks_managed_node_groups = var.eks_managed_node_groups

  cluster_addons = var.cluster_addons

  tags = local.common_tags

}