provider "aws" {
  region = var.aws_default_region
}

module "vpc" {
 source = "./vpc"
 region = var.region
}

module "ec2" {
  source = "../../../../modules/aws/ec2"
  count = var.ec2_enabled ? 1 : 0

  vpc_id           = module.vpc.id
  public_subnet_id = module.vpc.public_subnets[0]
  ami              = var.ami_id

  seed_data        = <<EOF
#!/bin/bash
echo "Hello, World!" > index.html
nohup busybox httpd -f -p 80 &
EOF
  ssh_name   = var.ssh_name
  ssh_public = var.ssh_public
  depends_on = [
    module.vpc.public_subnets
  ]
}


output "public_ip" {
  description = "List of public IP addresses assigned to the instances, if applicable"
  value       = module.ec2.public_ip
  sensitive   = true
}

