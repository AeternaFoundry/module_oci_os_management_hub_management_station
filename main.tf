resource "oci_os_management_hub_management_station" "os_management_hub_management_stations" {
  for_each = var.os_management_hub_management_stations

  compartment_id         = each.value.compartment_id
  display_name           = each.value.display_name
  hostname               = each.value.hostname
  arch_type              = each.value.arch_type
  defined_tags           = each.value.defined_tags
  description            = each.value.description
  freeform_tags          = each.value.freeform_tags
  is_auto_config_enabled = each.value.is_auto_config_enabled
  os_family              = each.value.os_family
  refresh_trigger        = each.value.refresh_trigger

  mirror {
    directory            = each.value.mirror.directory
    is_sslverify_enabled = each.value.mirror.is_sslverify_enabled
    port                 = each.value.mirror.port
    sslcert              = each.value.mirror.sslcert
    sslport              = each.value.mirror.sslport
  }

  proxy {
    forward    = each.value.proxy.forward
    hosts      = each.value.proxy.hosts
    is_enabled = each.value.proxy.is_enabled
    port       = each.value.proxy.port
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

