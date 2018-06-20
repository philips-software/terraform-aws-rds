output "fqdn" {
  description = "he private DNS record for the database."
  value       = "${aws_route53_record.db.fqdn}"
}

output "endpoint" {
  description = "The actual endpoint for the database."
  value       = "${aws_db_instance.db.endpoint}"
}
