terraform {
  required_providers {
    dynatrace = {
      source = "dynatrace-oss/dynatrace"
      version = "1.57.0"
    }
  }
}

provider "dynatrace" {
    dt_env_url    = var.dynatrace_nonprod_url
    dt_api_token  = var.dynatrace_nonprod_api_token
    alias         = "Non-Production"
}