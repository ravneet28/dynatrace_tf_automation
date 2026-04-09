terraform {
  required_providers {
    dynatrace = {
      source                = "dynatrace-oss/dynatrace"
      version               = "1.57.0"
      configuration_aliases = [dynatrace.Non-Production]
    }
  }
}
