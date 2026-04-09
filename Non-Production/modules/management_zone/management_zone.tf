resource "dynatrace_management_zone_v2" "dynatrace_management_zone" {
  provider    = dynatrace.Non-Production
  for_each    = var.dyantrace_mgmt_zone_variables
  name        = each.value.management_zone_name
  description = each.value.management_zone_description
  rules {
    dynamic "rule" {
      for_each = each.value.dynatrace_management_zone_rules != null ? each.value.dynatrace_management_zone_rules : []
      content {
        type            = rule.value.rule_type
        enabled         = rule.value.rule_enabled
        entity_selector = rule.value.entity_selector
        dynamic "attribute_rule" {
          for_each = rule.value.attribute_rule
          content {
            entity_type                                      = attribute_rule.value.entity_type
            azure_to_pgpropagation                           = attribute_rule.value.azure_to_pgpropagation
            azure_to_service_propagation                     = attribute_rule.value.azure_to_service_propagation
            custom_device_group_to_custom_device_propagation = attribute_rule.value.custom_device_group_to_custom_device_propagation
            host_to_pgpropagation                            = attribute_rule.value.host_to_pgpropagation
            pg_to_host_propagation                           = attribute_rule.value.pg_to_host_propagation
            pg_to_service_propagation                        = attribute_rule.value.pg_to_service_propagation
            service_to_host_propagation                      = attribute_rule.value.service_to_host_propagation
            service_to_pgpropagation                         = attribute_rule.value.service_to_pgpropagation
            dynamic "attribute_conditions" {
              for_each = attribute_rule.value.attribute_conditions
              content {
                condition {
                  case_sensitive     = attribute_conditions.value.case_sensitive
                  key                = attribute_conditions.value.key
                  operator           = attribute_conditions.value.operator
                  string_value       = attribute_conditions.value.string_value
                  dynamic_key        = attribute_conditions.value.dynamic_key
                  dynamic_key_source = attribute_conditions.value.dynamic_key_source
                  entity_id          = attribute_conditions.value.entity_id
                  enum_value         = attribute_conditions.value.enum_value
                  integer_value      = attribute_conditions.value.integer_value
                  tag                = attribute_conditions.value.tag
                }
              }
            }
          }
        }
        dynamic "dimension_rule" {
          for_each = each.value.dynatrace_management_zone_dimension_rules != null ? [each.value.dynatrace_management_zone_dimension_rules] : []
          content {
            applies_to = dimension_rule.value.applies_to
            dimension_conditions {
              condition {
                condition_type = dimension_rule.value.condition_type
                rule_matcher   = dimension_rule.value.rule_matcher
                value          = dimension_rule.value.value
              }
            }
          }
        }
      }
    }
  }
}
