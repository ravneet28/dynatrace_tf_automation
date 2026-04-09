module "dynatrace_management_zone" {
  source                        = "./modules/management_zone"
  dyantrace_mgmt_zone_variables = var.dyantrace_mgmt_zone_variables
  providers = {
    dynatrace.Non-Production = dynatrace.Non-Production
  }
}

module "web_application" {
  source                              = "./modules/web_application"
  dynatrace_web_application_variables = var.dynatrace_web_application_variables
  providers = {
    dynatrace.Non-Production = dynatrace.Non-Production
  }
}

module "application_detection_rule" {
  source                               = "./modules/application_detection_rule"
  depends_on                           = [module.web_application]
  application_detection_rule_variables = var.application_detection_rule_variables
  providers = {
    dynatrace.Non-Production = dynatrace.Non-Production
  }
}
