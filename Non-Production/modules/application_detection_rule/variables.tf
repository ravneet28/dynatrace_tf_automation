variable "application_detection_rule_variables" {
  type = map(object({
    is_application_exists              = bool   #(Required) Is application already existing?
    existing_web_application_name      = string #(Optional) Name of the web application if application_id_required is set to true
    application_detection_rule_id      = string #(Required) Select an existing application or create a new one.
    application_detection_matcher      = string #(Required) Possible Values: DOMAIN_CONTAINS, DOMAIN_ENDS_WITH, DOMAIN_EQUALS, DOMAIN_MATCHES, DOMAIN_STARTS_WITH, URL_CONTAINS, URL_ENDS_WITH, URL_EQUALS, URL_STARTS_WITH
    application_detection_pattern      = string #(Required) Pattern
    application_detection_description  = string #(Required) Add a description for your rule
    application_detection_insert_after = string #(Optional) Because this resource allows for ordering you may specify the ID of the resource instance that comes before this instance regarding order. If not specified when creating the setting will be added to the end of the list. If not specified during update the order will remain untouched
  }))
}