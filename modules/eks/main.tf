module "eks" {
  source             = "terraform-aws-modules/eks/aws"
  version            = "~> 21.0"
  name               = "eks-${var.env}"
  kubernetes_version = var.kubernetes_version
  subnet_ids         = var.private_subnet_ids
  vpc_id             = var.vpc_id

  enable_cluster_creator_admin_permissions = true

  eks_managed_node_groups = {
    default = {
      desired_size   = 2
      min_size       = 1
      max_size       = 3
      instance_types = ["t3.small"]
    }
  }

  tags = {
    Name = "eks-${var.env}"
  }
}
