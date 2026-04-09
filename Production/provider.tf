terraform {
    required_providers {
        dynatrace = {
            version = "1.55.1"
            source = "dynatrace-oss/dynatrace"
        }
    }
} 

provider "dynatrace" {
    dt_env_url    = var.dynatrace_prod_url
    dt_api_token  = var.dynatrace_prod_api_token
    alias         = "Production"
}

provider "dynatrace" {
    dt_env_url    = var.dynatrace_prod_url
    dt_api_token  = var.dynatrace_prod_api_token
    alias         = "non-production"
}