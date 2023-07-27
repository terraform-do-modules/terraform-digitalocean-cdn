# ------------------------------------------------------------------------------
# Outputs
# ------------------------------------------------------------------------------
output "id" {
  value       = join("", digitalocean_cdn.main[*].id)
  description = "A unique ID that can be used to identify and reference a CDN Endpoint."
}
output "origin" {
  value       = join("", digitalocean_cdn.main[*].origin)
  description = "The fully qualified domain name, (FQDN) of a space referenced by the CDN Endpoint."
}
output "endpoint" {
  value       = join("", digitalocean_cdn.main[*].endpoint)
  description = "The fully qualified domain name (FQDN) from which the CDN-backed content is served."
}
output "created_at" {
  value       = join("", digitalocean_cdn.main[*].created_at)
  description = "The date and time when the CDN Endpoint was created."
}
output "ttl" {
  value       = join("", digitalocean_cdn.main[*].ttl)
  description = "The time to live for the CDN Endpoint, in seconds."
}
output "custom_domain" {
  value       = var.custom_domain != null ? join("", digitalocean_cdn.main[*].custom_domain) : 0
  description = "The fully qualified domain name (FQDN) of the custom subdomain used with the CDN Endpoint."
}
