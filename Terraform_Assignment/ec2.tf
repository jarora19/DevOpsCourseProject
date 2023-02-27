module "bastion_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "bastion-instance"

  ami                    = "ami-0557a15b87f6559cf"
  instance_type          = "t2.micro"
  key_name               = "final_assignment"
  monitoring             = true
  vpc_security_group_ids = [module.sg_tf_pub.security_group_id]
  subnet_id              = module.vpc.public_subnets[0]
  associate_public_ip_address = true

  tags = {
    Terraform   = "true"
    Environment = "bastion"
  }
}

module "jenkins_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "jenkins-instance"

  ami                    = "ami-0557a15b87f6559cf"
  instance_type          = "t2.micro"
  key_name               = "final_assignment"
  monitoring             = true
  vpc_security_group_ids = [module.sg_tf_pvt.security_group_id]
  subnet_id              = module.vpc.private_subnets[0]
  

  tags = {
    Terraform   = "true"
    Environment = "jenkins"
  }
}

module "app_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "app-instance"

  ami                    = "ami-0557a15b87f6559cf"
  instance_type          = "t2.micro"
  key_name               = "final_assignment"
  monitoring             = true
  vpc_security_group_ids = [module.sg_tf_pvt.security_group_id]
  subnet_id              = module.vpc.private_subnets[1]

  tags = {
    Terraform   = "true"
    Environment = "app"
  }
}
