module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = "5.1.0"

  name = "craftista-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["ap-south-1a", "ap-south-1b"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]

  map_public_ip_on_launch = true

  enable_nat_gateway = false
}

module "eks" {
  source = "terraform-aws-modules/eks/aws"
  version = "20.30.0"

  cluster_name    = "craftista-eks-cluster"  
  cluster_version = "1.28"

  vpc_id = module.vpc.vpc_id
  subnet_ids = module.vpc.public_subnets

  cluster_addons = {
  coredns    = {}
  kube-proxy = {}
  vpc-cni    = {}
}

  cluster_endpoint_public_access = true
  cluster_endpoint_private_access = true

  bootstrap_self_managed_addons = false

  access_entries = {
  admin = {
    principal_arn = "arn:aws:iam::767678952669:root"

    policy_associations = {
      admin = {
        policy_arn = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
        access_scope = {
          type = "cluster"
        }
      }
    }
  }
}

  eks_managed_node_groups = {
    default = {
      desired_capacity = 2
      max_capacity     = 1
      min_capacity     = 2

      instance_types   = ["t3.small"]

      ami_type         = "AL2_x86_64"
    }
  }
}