module "eks" {

  source  = "terraform-aws-modules/eks/aws"
  version = "~> 21.0"

  ###################################
  # Cluster
  ###################################

  name               = var.name
  kubernetes_version = var.kubernetes_version

  ###################################
  # Networking
  ###################################

  vpc_id     = var.vpc_id
  subnet_ids = var.subnet_ids

  endpoint_public_access = true

  ###################################
  # Access
  ###################################

  enable_cluster_creator_admin_permissions = true

  ###################################
  # Addons
  ###################################

  addons = var.addons

  ###################################
  # Managed Node Groups
  ###################################

  eks_managed_node_groups = var.eks_managed_node_groups

  ###################################
  # Tags
  ###################################

  tags = local.common_tags
}