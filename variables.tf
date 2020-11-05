variable "environment" {
  description = "Name of the environment (e.g. digilabs-projextX-dev); will be prefixed to all resources"
  type        = string
}

variable "name" {
  description = "Name of the database instance"
  type        = string
}

variable "vpc_id" {
  description = "The VPC to launch the instance in (e.g. vpc-66ecaa02)"
  type        = string
}

variable "vpc_private_dns_zone_id" {
  description = "Creates a route 53 entry for the private zone."
  type        = string
}

variable "subnet_ids" {
  description = "IDs of the subnets, seperated by a ,"
  type        = list
}

variable "engine" {
  description = "The database engine to use"
  type        = string
}

variable "engine_version" {
  description = "The database engine_version"
  type        = string
}

variable "instance_class" {
  description = "The instance type of the RDS instance. The default is 'db.t2.small' to allow encryption. The micro versions cannot be encrypted"
  type        = string
  default     = "db.t2.small"
}

variable "username" {
  description = "The database username"
  type        = string
}

variable "password" {
  description = "The database password"
  type        = string
}

variable "allocated_storage" {
  description = "(Optional) The amount of allocated storage. The default is 10GB if not specified"
  type        = number
  default     = 10
}

variable "port" {
  description = "The database port"
  type        = number
}

variable "storage_type" {
  description = "(Optional) One of 'standard' (magnetic), 'gp2' (general purpose SSD), or 'io1' (provisioned IOPS SSD). The default is 'gp2' if not specified."
  type        = string
  default     = "gp2"
}

variable "storage_encrypted" {
  description = "(Optional) Specifies whether the DB instance is encrypted. The default is false if not specified."
  type        = bool
  default     = true
}

variable "backup_retention_period" {
  description = "(Optional) Automatically keep backups for point-in-time recovery for XX days(1-35). When providing '0' as a value backups will be disabled.The default is 14 if not specified."
  type        = number
  default     = 7
}

variable "backup_window" {
  description = "(Optional) The daily time range (in UTC) during which automated backups are created if they are enabled. Example: '09:46-10:16'. Must not overlap with maintenance_window. The default is '00:00-02:00' if not specified"
  type        = string
  default     = "00:00-02:00"
}

variable "skip_final_snapshot" {
  description = "(Optional) Determines whether a final DB snapshot is created before the DB instance is deleted. If true is specified, no DBSnapshot is created. If false is specified, a DB snapshot is created before the DB instance is deleted, using the value from final_snapshot_identifier. Default is false."
  type        = bool
  default     = false
}

variable "final_snapshot_identifier_suffix" {
  description = "Suffix for the final snapshot, makes it possible to add custom snapshot identifiers"
  type        = string
  default     = "-final-snapshot"
}

variable "tags" {
  description = "A map of tags to add to the resources"
  type        = map(string)
  default     = {}
}

variable "allow_major_version_upgrade" {
  description = "(Optional) Indicates that major version upgrades are allowed. Changing this parameter does not result in an outage and the change is asynchronously applied as soon as possible."
  type        = bool
  default     = false
}

variable "apply_immediately" {
  description = "(Optional) Specifies whether any database modifications are applied immediately, or during the next maintenance window. Default is false. See Amazon RDS Documentation for more information."
  type        = bool
  default     = false
}

variable "auto_minor_version_upgrade" {
  description = "(Optional) Indicates that minor engine upgrades will be applied automatically to the DB instance during the maintenance window. Defaults to true."
  type        = bool
  default     = true
}
