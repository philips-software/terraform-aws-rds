# Terraform module for creating an AWS RDS instance.

This module provides the opportunity to quickly create an AWS DB Instance.
It has the following capabilities:

- automated backup with retention periods
- settings on the backup window
- prevents deletion by providing a final snapshot
- database encryption


## Terraform version

- Terraform 0.12: Pin module to `~> 2+`, submit pull request to branch `terrafomr012`
- Terraform 0.11: Pin module to `~> 1.x`, submit pull request to branch `develop`


## Usage
Example usages:

```
module "db" {
  source = "git::https://github.com/philips-software/terraform-aws-rds.git?ref=terraform012"

  name                    = var.name
  environment             = var.environment
  vpc_id                  = module.vpc.vpc_id
  subnet_ids              = join(",", module.vpc.private_subnets)
  vpc_private_dns_zone_id = module.vpc.private_dns_zone_id

  engine         = "postgres"
  engine_version = "11.2"
  port           = 5432

  username = "abc"
  password = "nososecret"
}

```


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| allocated\_storage | (Optional) The amount of allocated storage. The default is 10GB if not specified | number | `"10"` | no |
| backup\_retention\_period | (Optional) Automatically keep backups for point-in-time recovery for XX days(1-35). When providing '0' as a value backups will be disabled.The default is 14 if not specified. | number | `"7"` | no |
| backup\_window | (Optional) The daily time range (in UTC) during which automated backups are created if they are enabled. Example: '09:46-10:16'. Must not overlap with maintenance_window. The default is '00:00-02:00' if not specified | string | `"00:00-02:00"` | no |
| engine | The database engine to use | string | n/a | yes |
| engine\_version | The database engine_version | string | n/a | yes |
| environment | Name of the environment (e.g. digilabs-projextX-dev); will be prefixed to all resources | string | n/a | yes |
| final\_snapshot\_identifier\_suffix | Suffix for the final snapshot, makes it possible to add custom snapshot identifiers | string | `"-final-snapshot"` | no |
| instance\_class | The instance type of the RDS instance. The default is 'db.t2.small' to allow encryption. The micro versions cannot be encrypted | string | `"db.t2.small"` | no |
| name | Name of the database instance | string | n/a | yes |
| password | The database password | string | n/a | yes |
| port | The database port | number | n/a | yes |
| skip\_final\_snapshot | (Optional) Determines whether a final DB snapshot is created before the DB instance is deleted. If true is specified, no DBSnapshot is created. If false is specified, a DB snapshot is created before the DB instance is deleted, using the value from final_snapshot_identifier. Default is false. | bool | `"false"` | no |
| storage\_encrypted | (Optional) Specifies whether the DB instance is encrypted. The default is false if not specified. | bool | `"true"` | no |
| storage\_type | (Optional) One of 'standard' (magnetic), 'gp2' (general purpose SSD), or 'io1' (provisioned IOPS SSD). The default is 'gp2' if not specified. | string | `"gp2"` | no |
| subnet\_ids | IDs of the subnets, seperated by a , | string | n/a | yes |
| tags | A map of tags to add to the resources | map(string) | `<map>` | no |
| username | The database username | string | n/a | yes |
| vpc\_id | The VPC to launch the instance in (e.g. vpc-66ecaa02) | string | n/a | yes |
| vpc\_private\_dns\_zone\_id | Creates a route 53 entry for the private zone. | string | n/a | yes |

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
