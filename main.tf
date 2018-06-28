resource "aws_db_subnet_group" "rds_subnet_group" {
  name        = "${var.environment}-${var.name}.sg"
  description = "rds subnet group"

  subnet_ids = ["${split(",", var.subnet_ids)}"]

  tags = "${merge(map("Name", format("%s", "${var.environment}-db")), map("Environment", format("%s", var.environment)), var.tags)}"
}

resource "aws_security_group" "db_sg" {
  description = "security group for the private db"

  name_prefix = "${var.environment}-${var.name}-db-sg"
  vpc_id      = "${var.vpc_id}"

  tags = "${merge(map("Name", format("%s", "${var.environment}-${var.name}-db-sg")), map("Environment", format("%s", var.environment)), var.tags)}"
}

data "aws_vpc" "selected" {
  id = "${var.vpc_id}"
}

resource "aws_security_group_rule" "allow_all" {
  type        = "ingress"
  from_port   = "${var.port}"
  to_port     = "${var.port}"
  protocol    = "tcp"
  cidr_blocks = ["${data.aws_vpc.selected.cidr_block}"]

  security_group_id = "${aws_security_group.db_sg.id}"
}

resource "random_id" "timestamp" {
  keepers = {
    # Generate a new id each time we switch to a new AMI id
    ami_id = "${timestamp()}"
  }

  byte_length = 8
}

resource "aws_db_instance" "db" {
  identifier                = "${var.environment}-${var.name}"
  allocated_storage         = "${var.allocated_storage}"
  engine                    = "${var.engine}"
  engine_version            = "${var.engine_version}"
  instance_class            = "${var.instance_class}"
  storage_type              = "${var.storage_type}"
  storage_encrypted         = "${var.storage_encrypted}"
  name                      = "${var.name}"
  final_snapshot_identifier = "${var.environment}-${var.name}-final-${random_id.timestamp.hex}"
  username                  = "${var.username}"
  password                  = "${var.password}"
  skip_final_snapshot       = "${var.skip_final_snapshot}"
  db_subnet_group_name      = "${aws_db_subnet_group.rds_subnet_group.name}"
  vpc_security_group_ids    = ["${aws_security_group.db_sg.id}"]
  backup_retention_period   = "${var.backup_retention_period}"
  backup_window             = "${var.backup_window}"

  tags = "${merge(map("Name", format("%s", "${var.environment}-${var.name}-db-instance")), map("Environment", format("%s", var.environment)), var.tags)}"
}

resource "aws_route53_record" "db" {
  zone_id = "${var.vpc_private_dns_zone_id}"
  name    = "db.${var.environment}-${var.name}"
  type    = "CNAME"
  ttl     = "300"

  records = ["${aws_db_instance.db.address}"]
}
