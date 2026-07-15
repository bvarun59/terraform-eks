region = "ap-south-1"

cluster_name = "prod-eks"

cluster_version = "1.33"

eks_managed_node_groups = {


  system = {

    instance_types = ["t3.medium"]

    desired_size = 2

    min_size = 2

    max_size = 4

    capacity_type = "ON_DEMAND"

    labels = {
      workload = "system"
    }

    taints = {
      dedicated = {
        key    = "workload"
        value  = "system"
        effect = "NO_SCHEDULE"
      }
    }
    update_config = {
      max_unavailable_percentage = 50

    }
  }



  application = {

    instance_types = ["t3.medium"]

    desired_size = 3

    min_size = 3

    max_size = 10

    capacity_type = "ON_DEMAND"

    labels = {
      workload = "application"
    }
    update_config = {
      max_unavailable_percentage = 50

    }

  }

  spot = {

    instance_types = ["t3.medium"]

    desired_size = 1

    min_size = 1

    max_size = 5

    capacity_type = "SPOT"

    labels = {
      workload = "spot"
    }

    update_config = {
      max_unavailable_percentage = 50

    }

  }

}


addons = {

  coredns = {

    most_recent = true

  }

  kube-proxy = {

    most_recent = true

  }

  vpc-cni = {

    most_recent = true

  }

  aws-ebs-csi-driver = {

    most_recent = true

  }

}