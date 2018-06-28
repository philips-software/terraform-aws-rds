# Terraform module for creating an AWS RDS instance.

This module provides the opportunity to quickly create an AWS DB Instance.
It has the following capabilities:

- automated backup with retention periods
- settings on the backup window
- prevents deletion by providing a final snapshot
- database encryption

## Usage
Example usages:

```
module "db-instance" {
  source = "philips-software/rds/aws"
  version = "1.0.0"

  # Or via github
  # source = "github.com/philips-software/terraform-aws-rds?ref=1.0.0"

  name                    = "mydb"
  environment             = "${var.environment}"
  vpc_id                  = "${var.vpc_id}"
  subnet_ids              = "${var.private_subnet_ids}"
  name                    = "mydb"
  username                = "abc"
  password                = "secret"
  vpc_private_dns_zone_id = "${var.private_dns_zone_id}"
  engine                  = "postgres"
  engine_version          = "9.6.1"
  port                    = "5432"

  // defaults
  storage_encrypted       = "true"
  instance_class          = "db.t2.small""
  allocated_storage       = "10"
  storage_type            = "gp2"
  backup_retention_period = "7"
  skip_final_snapshot     = "false"
}

```


## Inputs

| Name                    | Description                                                                                                                                                                                                                                                                                          | Type   | Default       | Required |
|-------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:------:|:-------------:|:--------:|
| allocated_storage       | (Optiona) The amount of allocated storage. The default is 10GB if not specified                                                                                                                                                                                                                      | string | `10`          | no       |
| backup_retention_period | (Optional) Automatically keep backups for point-in-time recovery for XX days(1-35). When providing '0' as a value backups will be disabled.The default is 14 if not specified.                                                                                                                       | string | `7`           | no       |
| backup_window           | (Optional) The daily time range (in UTC) during which automated backups are created if they are enabled. Example: '09:46-10:16'. Must not overlap with maintenance_window. The default is '00:00-02:00' if not specified                                                                             | string | `00:00-02:00` | no       |
| engine                  | The database engine to use                                                                                                                                                                                                                                                                           | string | -             | yes      |
| engine_version          | The database engine_version                                                                                                                                                                                                                                                                          | string | -             | yes      |
| environment             | Name of the environment (e.g. digilabs-projextX-dev); will be prefixed to all resources                                                                                                                                                                                                              | string | -             | yes      |
| instance_class          | The instance type of the RDS instance. The default is 'db.t2.small' to allow encryption. The micro versions cannot be encrypted                                                                                                                                                                      | string | `db.t2.small` | no       |
| name                    | Name of the database instance                                                                                                                                                                                                                                                                        | string | -             | yes      |
| password                | The database password                                                                                                                                                                                                                                                                                | string | -             | yes      |
| port                    | The database port                                                                                                                                                                                                                                                                                    | string | -             | yes      |
| skip_final_snapshot     | (Optional) Determines whether a final DB snapshot is created before the DB instance is deleted. If true is specified, no DBSnapshot is created. If false is specified, a DB snapshot is created before the DB instance is deleted, using the value from final_snapshot_identifier. Default is false. | string | `false`       | no       |
| storage_encrypted       | (Optional) Specifies whether the DB instance is encrypted. The default is false if not specified.                                                                                                                                                                                                    | string | `true`        | no       |
| storage_type            | (Optional) One of 'standard' (magnetic), 'gp2' (general purpose SSD), or 'io1' (provisioned IOPS SSD). The default is 'gp2' if not specified.                                                                                                                                                        | string | `gp2`         | no       |
| subnet_ids              | IDs of the subnets, seperated by a ,                                                                                                                                                                                                                                                                 | string | -             | yes      |
| username                | The database username                                                                                                                                                                                                                                                                                | string | -             | yes      |
| vpc_id                  | The VPC to launch the instance in (e.g. vpc-66ecaa02)                                                                                                                                                                                                                                                | string | -             | yes      |
| vpc_private_dns_zone_id |                                                                                                                                                                                                                                                                                                      | string | -             | yes      |

## Outputs

| Name | Description |
|------|-------------|
| endpoint | The actual endpoint for the database. |
| fqdn | he private DNS record for the database. |



## Philips Forest

This module is part of the Philips Forest.

```
                                                     ___                   _
                                                    / __\__  _ __ ___  ___| |_
                                                   / _\/ _ \| '__/ _ \/ __| __|
                                                  / / | (_) | | |  __/\__ \ |_
                                                  \/   \___/|_|  \___||___/\__|  

                                                                 Infrastructure
```

Talk to the forestkeepers in the `forest`-channel on Slack.

[![Slack](https://philips-software-slackin.now.sh/badge.svg)](https://philips-software-slackin.now.sh)
