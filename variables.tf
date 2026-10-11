variable "os_management_hub_management_stations" {
  description = <<EOT
Map of os_management_hub_management_stations, attributes below
Required:
    - compartment_id
    - display_name
    - hostname
    - mirror (block):
        - directory (required)
        - is_sslverify_enabled (optional)
        - port (optional)
        - sslcert (optional)
        - sslport (required)
    - proxy (block):
        - forward (optional)
        - hosts (optional)
        - is_enabled (required)
        - port (optional)
Optional:
    - arch_type
    - defined_tags
    - description
    - freeform_tags
    - is_auto_config_enabled
    - os_family
    - refresh_trigger
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    compartment_id         = string
    display_name           = string
    hostname               = string
    arch_type              = optional(string)
    defined_tags           = optional(map(string))
    description            = optional(string)
    freeform_tags          = optional(map(string))
    is_auto_config_enabled = optional(bool)
    os_family              = optional(string)
    refresh_trigger        = optional(number)
    mirror = object({
      directory            = string
      is_sslverify_enabled = optional(bool)
      port                 = optional(string)
      sslcert              = optional(string)
      sslport              = string
    })
    proxy = object({
      forward    = optional(string)
      hosts      = optional(list(string))
      is_enabled = bool
      port       = optional(string)
    })
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
}

