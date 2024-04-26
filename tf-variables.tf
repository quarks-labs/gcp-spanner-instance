variable "name" {
  type = string
}

variable "project" {
  type = string
}

variable "region" {
  type    = string
  default = "regional-us-east5"
}

variable "processing_units" {
  type = number
}

variable "databases" {
  type = list(object({
    name                     = string
    version_retention_period = string
    ddl                      = list(string)
    deletion_protection      = bool
    enable_drop_protection   = bool
  }))
}

variable "encryption_config" {
  type = object({
    kms_key_name = string
  })
  default = {
    kms_key_name = ""
  }
}
