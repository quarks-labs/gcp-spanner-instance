# GCP Spanner Terraform module

Terraform module which creates Spanner INSTANCE resources on GCP.


## Usage

```hcl

locals {
  name    = "quarks-pocs"
  project = "quarks-pocs"
  region  = "us-east1"
}

provider "google" {
  project = local.project
  region  = local.region
}

locals {
  name    = "quarks-pocs"
  project = "quarks-pocs"
  region  = "regional-us-east5"
}

provider "google" {
  project = local.project
  region  = local.region
}

module "spanner_instance" {
  source           = "../.."
  project          = local.project
  region           = local.region
  name             = local.name
  processing_units = 900
  databases = [{
    name                     = "quarks-pocs"
    ddl                      = []
    deletion_protection      = false
    enable_drop_protection   = false
    version_retention_period = "3d"

  }]
}


```


## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14 |
| <a name="requirement_google"></a> [google](#requirement\_google) | 5.24.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 5.24.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_spanner_database.this](https://registry.terraform.io/providers/hashicorp/google/5.24.0/docs/resources/spanner_database) | resource |
| [google_spanner_instance.this](https://registry.terraform.io/providers/hashicorp/google/5.24.0/docs/resources/spanner_instance) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_databases"></a> [databases](#input\_databases) | n/a | <pre>list(object({<br>    name                     = string<br>   
 version_retention_period = string<br>    ddl                      = list(string)<br>    deletion_protection      = bool<br>    enable_drop_protection   = bool<br>  }))</pre> | n/a | yes |
| <a name="input_encryption_config"></a> [encryption\_config](#input\_encryption\_config) | n/a | <pre>object({<br>    kms_key_name = string<br>  })</pre> | <pre>{<br>  "kms_key_name": ""<br>}</pre> | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | n/a | yes |
| <a name="input_processing_units"></a> [processing\_units](#input\_processing\_units) | n/a | `number` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | n/a | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | n/a | `string` | `"regional-us-east5"` | no |

## Outputs

No outputs.