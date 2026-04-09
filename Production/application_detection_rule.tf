# resource "dynatrace_application_detection_rule_v2" "dynatrace_application_detection_rule" {
#   for_each       = var.dynatrace_application_detection_rule_variables
#   application_id = each.value.dyantrace_application_detection_rule_id
#   matcher        = each.value.dyantrace_application_detection_matcher
#   pattern        = each.value.dyantrace_application_detection_pattern
# }