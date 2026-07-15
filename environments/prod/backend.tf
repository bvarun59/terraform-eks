terraform {

  backend "s3" {

    bucket = "atozdevopslab-terraform-state"

    key = "eks/prod/terraform.tfstate"

    region = "ap-south-1"

    use_lockfile = true

    encrypt = true

  }

}