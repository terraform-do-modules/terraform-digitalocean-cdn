provider "digitalocean" {}

##------------------------------------------------
## spaces module call
##------------------------------------------------
module "spaces" {
  source        = "terraform-do-modules/spaces/digitalocean"
  version       = "1.0.2"
  name          = "spaces"
  environment   = "test"
  acl           = "private"
  force_destroy = false
  region        = "nyc3"

}
##------------------------------------------------
## cdn module call
##------------------------------------------------
module "cdn" {
  source = "./../../"
  origin = module.spaces.bucket_domain_name
  ttl    = 3600
}
