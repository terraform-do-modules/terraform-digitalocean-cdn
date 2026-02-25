# Architecture — terraform-digitalocean-cdn

## Overview

This module provisions a DigitalOcean CDN Endpoint backed by a DigitalOcean Spaces bucket. When a CDN Endpoint is created, DigitalOcean distributes content from the Spaces origin across its global edge network, reducing latency for geographically distributed users. The origin is identified by the Spaces bucket domain name (e.g., `my-bucket.nyc3.digitaloceanspaces.com`).

The module manages one `digitalocean_cdn` resource and is gated by the `enabled` flag, which allows the resource to be conditionally created without removing it from configuration.

## Resource Created

- `digitalocean_cdn.main` — the CDN Endpoint resource linked to the Spaces origin.

## Recommended Production Pattern

### Origin

Point the CDN at a Spaces bucket that holds static assets (HTML, CSS, JS, images, video). The bucket ACL controls access at the storage layer; the CDN sits in front and serves cached copies.

```
Users -> CDN Edge (DigitalOcean PoP) -> Spaces bucket (origin)
```

### Custom Domain and TLS

A custom subdomain (e.g., `assets.example.com`) can be attached by setting `custom_domain`. A DigitalOcean managed TLS certificate must be provisioned first (via the `terraform-digitalocean-certificate` module with `type = "lets_encrypt"`) and its `name` passed to `certificate_name`. The certificate domain must match the custom subdomain exactly.

### TTL Tuning

The `ttl` variable controls how long the edge caches each object before re-validating with the origin. The valid range is 60–604800 seconds (1 minute to 7 days).

| Use Case | Recommended TTL |
|---|---|
| Frequently updated content | 60–300 s |
| Versioned static assets | 86400–604800 s |
| Default (general use) | 3600 s |

Use cache-busting filenames (content hashing) for long TTLs rather than relying on short TTLs for correctness.

### Dependency Ordering

When the Spaces bucket and the CDN Endpoint are created in the same plan, use `depends_on` on the CDN module to ensure the bucket exists before the endpoint is registered.

## Operational Checklist

- Confirm the Spaces bucket exists and is accessible before creating the CDN Endpoint.
- Verify DNS for the custom domain points to the CDN endpoint FQDN (output: `endpoint`) before enabling the custom domain.
- Provision the TLS certificate in the same region as the Spaces bucket.
- Set `force_destroy = false` on the Spaces bucket in production to prevent accidental data loss.
- Monitor cache hit rates; adjust TTL downward only if cache invalidation is not feasible.
- Rotate credentials (Spaces access keys) independently of the CDN configuration; the CDN does not store credentials.
- Tag or label the Spaces bucket and CDN consistently for cost allocation.
