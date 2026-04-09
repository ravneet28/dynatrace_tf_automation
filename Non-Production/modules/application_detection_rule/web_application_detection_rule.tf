locals {
  is_application_id_required = { for k, v in var.application_detection_rule_variables : k => v if lookup(v, "is_application_exists", false) == true }
}

data "dynatrace_application" "web_application" {
  provider = dynatrace.Non-Production
  for_each = local.is_application_id_required
  name     = each.value.existing_web_application_name
}

resource "dynatrace_application_detection_rule_v2" "application_detection_rule" {
  provider       = dynatrace.Non-Production
  for_each       = var.application_detection_rule_variables
  application_id = data.dynatrace_application.web_application[each.key].id
  matcher        = each.value.application_detection_matcher
  pattern        = each.value.application_detection_pattern
}
