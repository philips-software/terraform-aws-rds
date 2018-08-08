variable "environment" {
  type        = "string"
  description = "Name of the environment (e.g. digilabs-projextX-dev); will be prefixed to all resources"
}

variable "name" {
  type        = "string"
  description = "Name of the database instance"
}

variable "vpc_id" {
  type        = "string"
  description = "The VPC to launch the instance in (e.g. vpc-66ecaa02)"
}

variable "vpc_private_dns_zone_id" {}

variable "subnet_ids" {
  type        = "string"
  description = "IDs of the subnets, seperated by a ,"
}

variable "engine" {
  type        = "string"
  description = "The database engine to use"
}

variable "engine_version" {
  type        = "string"
  description = "The database engine_version"
}

variable "instance_class" {
  type        = "string"
  description = "The instance type of the RDS instance. The default is 'db.t2.small' to allow encryption. The micro versions cannot be encrypted"
  default     = "db.t2.small"
}

variable "username" {
  type        = "string"
  description = "The database username"
}

variable "password" {
  type        = "string"
  description = "The database password"
}

variable "allocated_storage" {
  type        = "string"
  description = "(Optional) The amount of allocated storage. The default is 10GB if not specified"
  default     = "10"
}

variable "port" {
  type        = "string"
  description = "The database port"
}

variable "storage_type" {
  type        = "string"
  description = "(Optional) One of 'standard' (magnetic), 'gp2' (general purpose SSD), or 'io1' (provisioned IOPS SSD). The default is 'gp2' if not specified."
  default     = "gp2"
}

variable "storage_encrypted" {
  type        = "string"
  description = "(Optional) Specifies whether the DB instance is encrypted. The default is false if not specified."
  default     = "true"
}

variable "backup_retention_period" {
  type        = "string"
  description = "(Optional) Automatically keep backups for point-in-time recovery for XX days(1-35). When providing '0' as a value backups will be disabled.The default is 14 if not specified."
  default     = "7"
}

variable "backup_window" {
  type        = "string"
  description = "(Optional) The daily time range (in UTC) during which automated backups are created if they are enabled. Example: '09:46-10:16'. Must not overlap with maintenance_window. The default is '00:00-02:00' if not specified"
  default     = "00:00-02:00"
}

variable "skip_final_snapshot" {
  type        = "string"
  description = "(Optional) Determines whether a final DB snapshot is created before the DB instance is deleted. If true is specified, no DBSnapshot is created. If false is specified, a DB snapshot is created before the DB instance is deleted, using the value from final_snapshot_identifier. Default is false."
  default     = "false"
}

variable "final_snapshot_identifier_suffix" {
  type        = "string"
  description = "Suffix for the final snapshot, makes it possible to add custom snapshot identifiers"
  default     = "-final-snapshot"
}

variable "tags" {
  type        = "map"
  description = "A map of tags to add to the resources"
  default     = {}
}
