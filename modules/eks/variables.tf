variable "cluster_name" {
  description = "EKS Cluster Name"
  type        = string
}

variable "cluster_version" {
  description = "Kubernetes Version"
  type        = string
}

variable "vpc_id" {
  type = string
}

variable "private_subnets" {
  type = list(string)
}

variable "eks_managed_node_groups" {
  description = "Managed Node Groups"
  type = any
}

variable "cluster_addons" {
  description = "EKS Addons"
  type = any
  default = {}
}

variable "tags" {
  type    = map(string)
  default = {}
}