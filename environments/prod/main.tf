module "vpc" {

  source = "../../modules/vpc"

  name = "prod-vpc"

  cidr = "10.0.0.0/16"

  azs = [

    "ap-south-1a",

    "ap-south-1b"

  ]

  private_subnets = [

    "10.0.1.0/24",

    "10.0.2.0/24"

  ]

  public_subnets = [

    "10.0.101.0/24",

    "10.0.102.0/24"

  ]

  tags = {

    Environment = "prod"

    Terraform = "true"

  }

}

module "eks" {

  source = "../../modules/eks"

  name               = var.cluster_name
  kubernetes_version = var.cluster_version

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  eks_managed_node_groups = var.eks_managed_node_groups

  addons = var.addons

  tags = {
    Environment = "prod"
  }
}

module "alb_irsa" {

  source = "../../modules/irsa"

  role_name = "prod-alb-controller"

  oidc_provider_arn = module.eks.oidc_provider_arn

  namespace = "kube-system"

  service_account = "aws-load-balancer-controller"

  policy_arns = [

    "arn:aws:iam::aws:policy/ElasticLoadBalancingFullAccess"

  ]

}

module "application_irsa" {

  source = "../../modules/irsa"

  role_name = "application-s3"

  oidc_provider_arn = module.eks.oidc_provider_arn

  namespace = "application"

  service_account = "backend"

  policy_arns = [

    aws_iam_policy.s3_read.arn

  ]

}

# module "iam" {
#   source = "../../modules/iam"

#   cluster_name      = module.eks.cluster_name
#   oidc_provider_arn = module.eks.oidc_provider_arn
#   oidc_provider     = module.eks.oidc_provider
# }