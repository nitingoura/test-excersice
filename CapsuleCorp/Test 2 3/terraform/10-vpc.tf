module "vpc" {
  source               = "terraform-aws-modules/vpc/aws"
  name                 = "app-${local.naming_convention}-vpc"
  enable_nat_gateway   = true
  azs                  = data.aws_availability_zones.available.names
  cidr                 = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true

  public_subnets = var.vpc_public_subnets
  public_subnet_tags = {
    Tier = "public",
    Type = "apps"
  }
  private_subnets = var.vpc_private_subnets
  private_subnet_tags = {
    Tier = "private",
    Type = "apps",
  }
}
