variable "name" {
  description = "EKS Cluster Name"
  type        = string
}

variable "kubernetes_version" {
  description = "Kubernetes Version"
  type        = string
}

variable "vpc_id" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}

variable "eks_managed_node_groups" {
  type    = any
  default = {}
}

variable "addons" {
  type    = any
  default = {}
}

variable "tags" {
  type    = map(string)
  default = {}
}