module "db" {
  source = "../../"

  name                    = "${var.name}"
  environment             = "${var.environment}"
  vpc_id                  = "${module.vpc.vpc_id}"
  subnet_ids              = "${join(",", module.vpc.private_subnets)}"
  vpc_private_dns_zone_id = "${module.vpc.private_dns_zone_id}"

  engine         = "postgres"
  engine_version = "9.6.1"
  port           = "5432"

  username = "abc"
  password = "nososecret"

  tags = {
    Project = "test"
  }
}
