module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "vpc-assignment"
  cidr = "10.0.0.0/16"

  azs             = ["us-east-1b", "us-east-1c"]
  private_subnets = ["10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.102.0/24", "10.0.103.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = true
  enable_dns_hostnames = true

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}
