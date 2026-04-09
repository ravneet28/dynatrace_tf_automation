# Dynatrace Terraform Configuration

This repository contains Terraform configurations for setting up and managing Dynatrace monitoring environments. It provides infrastructure as code for configuring Dynatrace SaaS environments with management zones, web applications, and application detection rules.

## Overview

The repository is organized into two main environments:

- **Non-Production**: Modular Terraform configuration using reusable modules
- **Production**: Direct resource definitions for production deployments

## Features

### Management Zones
- Create and configure Dynatrace management zones for organizing monitored entities
- Support for rule-based entity inclusion using various criteria (entity types, attributes, selectors)
- Dimension-based rules for log and metric filtering

### Web Applications
- Configure web application monitoring settings
- Real User Monitoring (RUM) configuration
- Apdex settings for custom, load, and XHR actions
- Session replay and cost control settings
- JavaScript framework support and injection rules
- Conversion goals and user action naming

### Application Detection Rules
- Define rules for automatic application detection
- Support for domain and URL-based matching patterns
- Integration with existing web applications

## Prerequisites

- Terraform >= 1.0
- Dynatrace API access with appropriate permissions
- API tokens for target environments

## Environment Variables

Set the following environment variables or provide them via `terraform.tfvars`:

### Non-Production Environment
- `dynatrace_nonprod_url`: Dynatrace environment URL
- `dynatrace_nonprod_api_token`: API token with configuration permissions

### Production Environment
- `dynatrace_prod_url`: Production Dynatrace environment URL
- `dynatrace_prod_api_token`: Production API token

## Usage

### Non-Production Environment

1. Navigate to the Non-Production directory:
   ```bash
   cd Non-Production
   ```

2. Initialize Terraform:
   ```bash
   terraform init
   ```

3. Review the plan:
   ```bash
   terraform plan
   ```

4. Apply the configuration:
   ```bash
   terraform apply
   ```

### Production Environment

1. Navigate to the Production directory:
   ```bash
   cd Production
   ```

2. Follow the same Terraform workflow as above.

## Configuration

### Variables

The configurations use complex variable structures defined in `variables.tf`. Key variables include:

- `dyantrace_mgmt_zone_variables`: Map of management zone configurations
- `dynatrace_web_application_variables`: Map of web application settings
- `application_detection_rule_variables`: Map of application detection rules

### Example Configuration

See `terraform.tfvars.template` for example variable values and structure. Copy this file to `terraform.tfvars` and fill in your actual values.

## Modules

The Non-Production environment uses modular design:

- `modules/management_zone/`: Management zone configuration
- `modules/web_application/`: Web application monitoring setup
- `modules/application_detection_rule/`: Application detection rules

## Security Considerations

- Store API tokens securely (environment variables, secret management)
- Use appropriate token permissions (least privilege)
- Consider using Terraform workspaces for multiple environments

## Contributing

1. Follow Terraform best practices
2. Use consistent naming conventions
3. Update variables and documentation for new features
4. Test changes in non-production environments first

## License

[Add license information if applicable]

## Support

For issues related to:
- Terraform: Check Terraform documentation
- Dynatrace: Refer to Dynatrace documentation
- Repository issues: Create an issue in this repository