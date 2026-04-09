resource "dynatrace_management_zone_v2" "dynatrace_management_zone" {
  for_each = var.dyantrace_mgmt_zone_variables
  name     = each.value.management_zone_name
  description = each.value.management_zone_description
  rules {
   dynamic "rule" {
      for_each = each.value.dynatrace_management_zone_rules_required == false ? [] : [1]
      content {
      type            = each.value.dyantrace_rule_type
      enabled         = each.value.dynatrace_rule_enabled
      entity_selector = each.value.dynatrace_entity_selector
      attribute_rule {
        entity_type = each.value.dynatrace.entity_type
        attribute_conditions {
          condition {
            case_sensitive = each.value.dynatrace_case_sensitive
            key            = each.value.dynatrace_key
            operator       = each.value.dynatrace_operator
            string_value   = each.value.dynatrace_string_value
            }
          }
        }
      }
    }
  }
}