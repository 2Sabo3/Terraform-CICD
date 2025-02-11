#root - Can be used to share variable data between different modules

module "vpc" {
  source = "./vpc"
  vpc_cidr_block = "10.0.0.0/16"
  subnet_cidr_block = "10.0.1.0/24"
  sg_allowed_ip = "0.0.0.0/0"
}

module "web-server" {
  source = "./web-server"
  subnet = module.vpc.subnet
  sg = module.vpc.security_group
}