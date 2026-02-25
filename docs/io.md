# Inputs and Outputs — terraform-digitalocean-cdn

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| enabled | Whether to create the resources. Set to `false` to prevent the module from creating any resources. | `bool` | `true` | no |
| origin | The fully qualified domain name (FQDN) for a Space. | `string` | `""` | no |
| ttl | The time to live for the CDN Endpoint, in seconds. Must be between 60 and 604800. Default is 3600 seconds. | `number` | `3600` | no |
| certificate\_name | The unique name of a DigitalOcean managed TLS certificate used for SSL when a custom subdomain is provided. | `string` | `null` | no |
| custom\_domain | The fully qualified domain name (FQDN) of the custom subdomain used with the CDN Endpoint. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| id | A unique ID that can be used to identify and reference a CDN Endpoint. |
| origin | The fully qualified domain name (FQDN) of a Space referenced by the CDN Endpoint. |
| endpoint | The fully qualified domain name (FQDN) from which the CDN-backed content is served. |
| created\_at | The date and time when the CDN Endpoint was created. |
| ttl | The time to live for the CDN Endpoint, in seconds. |
| custom\_domain | The fully qualified domain name (FQDN) of the custom subdomain used with the CDN Endpoint. Returns `0` when no custom domain is configured. |
