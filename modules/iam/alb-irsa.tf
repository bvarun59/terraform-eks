module "alb_irsa" {

  source = "terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks"

  version = "~>5.50"

  role_name = "${var.cluster_name}-alb-controller"

  attach_load_balancer_controller_policy = true

  oidc_providers = {

    main = {

      provider_arn = var.oidc_provider_arn

      namespace_service_accounts = [

        "kube-system:aws-load-balancer-controller"

      ]

    }

  }

}