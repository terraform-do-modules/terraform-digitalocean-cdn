provider "digitalocean" {
  spaces_access_id  = "XXXXXXXXXXXXXXX"
  spaces_secret_key = "XXXXXXXXXXXXXXX"
}

##------------------------------------------------
## spaces module call
##------------------------------------------------
module "spaces" {
  source        = "git::https://github.com/terraform-do-modules/terraform-digitalocean-spaces.git?ref=internal-424"
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
