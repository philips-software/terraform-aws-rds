provider "aws" {
  region  = "eu-west-1"
  version = "2.22.0"
}

module "db" {
  source = "../../"

  name                    = var.name
  environment             = var.environment
  vpc_id                  = module.vpc.vpc_id
  subnet_ids              = module.vpc.private_subnets
  vpc_private_dns_zone_id = module.vpc.private_dns_zone_id

  engine         = "postgres"
  engine_version = "11.2"
  port           = 5432

  username = "abc"
  password = "nososecret"

  tags = {
    Project = "test"
  }
}

