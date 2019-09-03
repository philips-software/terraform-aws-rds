output "fqdn" {
  description = "The private DNS record for the database."
  value       = module.db.fqdn
}

output "endpoint" {
  description = "The actual endpoint for the database."
  value       = module.db.endpoint
}

