<!-- This file was automatically generated by the `geine`. Make all changes to `README.yaml` and run `make readme` to rebuild this file. -->

<p align="center"> <img src="https://user-images.githubusercontent.com/50652676/62349836-882fef80-b51e-11e9-99e3-7b974309c7e3.png" width="100" height="100"></p>


<h1 align="center">
    Terraform Digitalocean CDN
</h1>

<p align="center" style="font-size: 1.2rem;"> 
    Terraform module to create Digitalocean cdn service resource on Digitalocean.
     </p>

<p align="center">

<a href="https://github.com/terraform-do-modules/terraform-digitalocean-cdn/releases/latest">
  <img src="https://img.shields.io/github/release/terraform-do-modules/terraform-digitalocean-cdn.svg" alt="Latest Release">
</a>
<a href="https://github.com/terraform-do-modules/terraform-digitalocean-cdn/actions/workflows/tfsec.yml">
  <img src="https://github.com/terraform-do-modules/terraform-digitalocean-cdn/actions/workflows/tfsec.yml/badge.svg" alt="tfsec">
</a>
<a href="https://www.terraform.io">
  <img src="https://img.shields.io/badge/Terraform-v1.4.6-green" alt="Terraform">
</a>
<a href="LICENSE.md">
  <img src="https://img.shields.io/badge/License-APACHE-blue.svg" alt="Licence">
</a>


</p>
<p align="center">

<a href='https://facebook.com/sharer/sharer.php?u=https://github.com/terraform-do-modules/terraform-digitalocean-cdn'>
  <img title="Share on Facebook" src="https://user-images.githubusercontent.com/50652676/62817743-4f64cb80-bb59-11e9-90c7-b057252ded50.png" />
</a>
<a href='https://www.linkedin.com/shareArticle?mini=true&title=Terraform+Digitalocean+CDN&url=https://github.com/terraform-do-modules/terraform-digitalocean-cdn'>
  <img title="Share on LinkedIn" src="https://user-images.githubusercontent.com/50652676/62817742-4e339e80-bb59-11e9-87b9-a1f68cae1049.png" />
</a>
<a href='https://twitter.com/intent/tweet/?text=Terraform+Digitalocean+CDN&url=https://github.com/terraform-do-modules/terraform-digitalocean-cdn'>
  <img title="Share on Twitter" src="https://user-images.githubusercontent.com/50652676/62817740-4c69db00-bb59-11e9-8a79-3580fbbf6d5c.png" />
</a>

</p>
<hr>


We eat, drink, sleep and most importantly love **DevOps**. We are working towards strategies for standardizing architecture while ensuring security for the infrastructure. We are strong believer of the philosophy <b>Bigger problems are always solved by breaking them into smaller manageable problems</b>. Resonating with microservices architecture, it is considered best-practice to run database, cluster, storage in smaller <b>connected yet manageable pieces</b> within the infrastructure. 

This module is basically combination of [Terraform open source](https://www.terraform.io/) and includes automatation tests and examples. It also helps to create and improve your infrastructure with minimalistic code instead of maintaining the whole infrastructure code yourself.

We have [*fifty plus terraform modules*][terraform_modules]. A few of them are comepleted and are available for open source usage while a few others are in progress.




## Prerequisites

This module has a few dependencies: 
- [Terraform 1.4.6](https://learn.hashicorp.com/terraform/getting-started/install.html)







## Examples


**IMPORTANT:** Since the `master` branch used in `source` varies based on new modifications, we suggest that you use the release versions [here](https://github.com/terraform-do-modules/terraform-digitalocean-cdn/releases).


Here is an example of how you can use this module in your inventory structure:
### Complete Example
```hcl
  module "cdn" {
    source             = "terraform-do-modules/cdn/digitalocean"
    version            = "1.0.0"
    origin             = module.spaces.bucket_domain_name
    ttl                = 3600
    custom_domain      = ""
    certificate_name   = ""
  }
```
##basic example
```hcl
  module "cdn" {
    source             = "terraform-do-modules/cdn/digitalocean"
    version            = "1.0.0"
    origin             = module.spaces.bucket_domain_name
    ttl                = 3600
  }
```






## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| certificate\_name | The unique name of a DigitalOcean managed TLS certificate used for SSL when a custom subdomain is provided. | `string` | `null` | no |
| custom\_domain | The fully qualified domain name (FQDN) of the custom subdomain used with the CDN Endpoint. | `string` | `null` | no |
| enabled | Whether to create the resources. Set to `false` to prevent the module from creating any resources. | `bool` | `true` | no |
| origin | The fully qualified domain name, (FQDN) for a Space. | `string` | `""` | no |
| ttl | The time to live for the CDN Endpoint, in seconds. Default is 3600 seconds. | `number` | `3600` | no |

## Outputs

| Name | Description |
|------|-------------|
| created\_at | The date and time when the CDN Endpoint was created. |
| custom\_domain | The fully qualified domain name (FQDN) of the custom subdomain used with the CDN Endpoint. |
| endpoint | The fully qualified domain name (FQDN) from which the CDN-backed content is served. |
| id | A unique ID that can be used to identify and reference a CDN Endpoint. |
| origin | The fully qualified domain name, (FQDN) of a space referenced by the CDN Endpoint. |
| ttl | The time to live for the CDN Endpoint, in seconds. |




## Testing
In this module testing is performed with [terratest](https://github.com/gruntwork-io/terratest) and it creates a small piece of infrastructure, matches the output like ARN, ID and Tags name etc and destroy infrastructure in your AWS account. This testing is written in GO, so you need a [GO environment](https://golang.org/doc/install) in your system. 

You need to run the following command in the testing folder:
```hcl
  go test -run Test
```



## Feedback 
If you come accross a bug or have any feedback, please log it in our [issue tracker](https://github.com/terraform-do-modules/terraform-digitalocean-cdn/issues), or feel free to drop us an email at [hello@clouddrove.com](mailto:hello@clouddrove.com).

If you have found it worth your time, go ahead and give us a ★ on [our GitHub](https://github.com/terraform-do-modules/terraform-digitalocean-cdn)!

## About us

At [CloudDrove][website], we offer expert guidance, implementation support and services to help organisations accelerate their journey to the cloud. Our services include docker and container orchestration, cloud migration and adoption, infrastructure automation, application modernisation and remediation, and performance engineering.

<p align="center">We are <b> The Cloud Experts!</b></p>
<hr />
<p align="center">We ❤️  <a href="https://github.com/clouddrove">Open Source</a> and you can check out <a href="https://github.com/clouddrove">our other modules</a> to get help with your new Cloud ideas.</p>

  [website]: https://clouddrove.com
  [github]: https://github.com/clouddrove
  [linkedin]: https://cpco.io/linkedin
  [twitter]: https://twitter.com/clouddrove/
  [email]: https://clouddrove.com/contact-us.html
  [terraform_modules]: https://github.com/clouddrove?utf8=%E2%9C%93&q=terraform-&type=&language=
