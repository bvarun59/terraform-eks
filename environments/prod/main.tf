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

  cluster_name = var.cluster_name

  cluster_version = var.cluster_version

  vpc_id = module.vpc.vpc_id

  private_subnets = module.vpc.private_subnets

  eks_managed_node_groups = {

    system = {

      instance_types = [

        "t3.medium"

      ]

      desired_size = 2

      min_size = 2

      max_size = 4

      capacity_type = "ON_DEMAND"

    }

    application = {

      instance_types = [

        "m6i.large"

      ]

      desired_size = 3

      min_size = 3

      max_size = 10

      capacity_type = "ON_DEMAND"

    }

  }

  cluster_addons = {

    coredns = {}

    kube-proxy = {}

    vpc-cni = {}

    aws-ebs-csi-driver = {}

  }

  tags = {

    Environment = "prod"

  }

}

module "iam" {
  source = "../../modules/iam"

  cluster_name      = module.eks.cluster_name
  oidc_provider_arn = module.eks.oidc_provider_arn
  oidc_provider     = module.eks.oidc_provider
}