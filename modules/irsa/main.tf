module "irsa" {

  source = "terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks"

  version = "~>5.50"

  role_name = var.role_name

  role_policy_arns = var.policy_arns

  oidc_providers = {

    eks = {

      provider_arn = var.oidc_provider_arn

      namespace_service_accounts = [

        "${var.namespace}:${var.service_account}"

      ]

    }

  }

  tags = var.tags

}