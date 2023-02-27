module "sg_tf_pvt" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "sg_pvt"
  description = "Security group for user-service with custom ports open within VPC for private"
  vpc_id      = module.vpc.vpc_id

   ingress_with_cidr_blocks = [
    {
      from_port   = 0
      to_port     = 65535
      protocol    = "tcp"
      description = "ssh-service ports"
      cidr_blocks = "10.0.0.0/16"
    }
  ]
  egress_rules       =  ["all-all"]
  egress_cidr_blocks =  ["0.0.0.0/0"]

}
module "sg_tf_pub" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "sg_pub"
  description = "Security group for user-service with custom ports open within VPC for public"
  vpc_id      = module.vpc.vpc_id

   ingress_with_cidr_blocks = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      description = "ssh-service ports"
      cidr_blocks = "0.0.0.0/0"
    }
  ]
  egress_rules       =  ["all-all"]
  egress_cidr_blocks =  ["0.0.0.0/0"]

}
