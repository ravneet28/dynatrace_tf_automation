variable "dyantrace_mgmt_zone_variables" {
  type = map(object({
    management_zone_name        = string #(Required) Name of the Dynatrace Management zone you want to create
    management_zone_description = string #(Optional) If you want to provide a description for your managemnent zone
    dynatrace_management_zone_rules = list(object({
      rule_type       = string #(Required) Type of rule, possible values DIMENSION(Dimensional data), ME(Monitored Entity), SELECTOR(Entity Selector)
      rule_enabled    = bool   #(Required) Wether to enable or disable the rule
      entity_selector = string #(Optional) For specifying which entities you want to include to the scope of your Environment v2 API calls. Reference: https://docs.dynatrace.com/docs/dynatrace-api/environment-api/entity-v2/entity-selector#name
      attribute_rule = list(object({
        entity_type                                      = string #(Required) Possible Values: APPMON_SERVER, APPMON_SYSTEM_PROFILE, AWS_ACCOUNT, AWS_APPLICATION_LOAD_BALANCER, AWS_AUTO_SCALING_GROUP, AWS_CLASSIC_LOAD_BALANCER, AWS_NETWORK_LOAD_BALANCER, AWS_RELATIONAL_DATABASE_SERVICE, AZURE, BROWSER_MONITOR, CLOUD_APPLICATION, CLOUD_APPLICATION_NAMESPACE, CLOUD_FOUNDRY_FOUNDATION, CUSTOM_APPLICATION, CUSTOM_DEVICE, CUSTOM_DEVICE_GROUP, DATA_CENTER_SERVICE, ENTERPRISE_APPLICATION, ESXI_HOST, EXTERNAL_MONITOR, HOST, HOST_GROUP, HTTP_MONITOR, KUBERNETES_CLUSTER, KUBERNETES_SERVICE, MOBILE_APPLICATION, OPENSTACK_ACCOUNT, PROCESS_GROUP, QUEUE, SERVICE, WEB_APPLICATION
        azure_to_pgpropagation                           = bool   #(Optional) Apply to process groups connected to matching Azure entities
        azure_to_service_propagation                     = bool   #(Optional) Apply to services provided by matching Azure entities
        custom_device_group_to_custom_device_propagation = bool   #(Optional) Apply to custom devices in a custom device group
        host_to_pgpropagation                            = bool   #(Optional) Apply to processes running on matching hosts
        pg_to_host_propagation                           = bool   #(Optional) Apply to underlying hosts of matching process groups
        pg_to_service_propagation                        = bool   #(Optional) Apply to all services provided by the process groups
        service_to_host_propagation                      = bool   #(Optional) Apply to underlying hosts of matching services
        service_to_pgpropagation                         = bool   #(Optional) Apply to underlying process groups of matching services
        attribute_conditions = list(object({
          case_sensitive     = bool   #(Optional)
          key                = string #(Required) Possible Values: APPMON_SERVER_NAME, APPMON_SYSTEM_PROFILE_NAME, AWS_ACCOUNT_ID, AWS_ACCOUNT_NAME, AWS_APPLICATION_LOAD_BALANCER_NAME, AWS_APPLICATION_LOAD_BALANCER_TAGS, AWS_AUTO_SCALING_GROUP_NAME, AWS_AUTO_SCALING_GROUP_TAGS, AWS_AVAILABILITY_ZONE_NAME, AWS_CLASSIC_LOAD_BALANCER_FRONTEND_PORTS, AWS_CLASSIC_LOAD_BALANCER_NAME, AWS_CLASSIC_LOAD_BALANCER_TAGS, AWS_NETWORK_LOAD_BALANCER_NAME, AWS_NETWORK_LOAD_BALANCER_TAGS, AWS_RELATIONAL_DATABASE_SERVICE_DB_NAME, AWS_RELATIONAL_DATABASE_SERVICE_ENDPOINT, AWS_RELATIONAL_DATABASE_SERVICE_ENGINE, AWS_RELATIONAL_DATABASE_SERVICE_INSTANCE_CLASS, AWS_RELATIONAL_DATABASE_SERVICE_NAME, AWS_RELATIONAL_DATABASE_SERVICE_PORT, AWS_RELATIONAL_DATABASE_SERVICE_TAGS, AZURE_ENTITY_NAME, AZURE_ENTITY_TAGS, AZURE_MGMT_GROUP_NAME, AZURE_MGMT_GROUP_UUID, AZURE_REGION_NAME, AZURE_SCALE_SET_NAME, AZURE_SUBSCRIPTION_NAME, AZURE_SUBSCRIPTION_UUID, AZURE_TENANT_NAME, AZURE_TENANT_UUID, AZURE_VM_NAME, BROWSER_MONITOR_NAME, BROWSER_MONITOR_TAGS, CLOUD_APPLICATION_LABELS, CLOUD_APPLICATION_NAME, CLOUD_APPLICATION_NAMESPACE_LABELS, CLOUD_APPLICATION_NAMESPACE_NAME, CLOUD_FOUNDRY_FOUNDATION_NAME, CLOUD_FOUNDRY_ORG_NAME, CUSTOM_APPLICATION_NAME, CUSTOM_APPLICATION_PLATFORM, CUSTOM_APPLICATION_TAGS, CUSTOM_APPLICATION_TYPE, CUSTOM_DEVICE_DNS_ADDRESS, CUSTOM_DEVICE_GROUP_NAME, CUSTOM_DEVICE_GROUP_TAGS, CUSTOM_DEVICE_IP_ADDRESS, CUSTOM_DEVICE_METADATA, CUSTOM_DEVICE_NAME, CUSTOM_DEVICE_PORT, CUSTOM_DEVICE_TAGS, CUSTOM_DEVICE_TECHNOLOGY, DATA_CENTER_SERVICE_DECODER_TYPE, DATA_CENTER_SERVICE_IP_ADDRESS, DATA_CENTER_SERVICE_METADATA, DATA_CENTER_SERVICE_NAME, DATA_CENTER_SERVICE_PORT, DATA_CENTER_SERVICE_TAGS, DOCKER_CONTAINER_NAME, DOCKER_FULL_IMAGE_NAME, DOCKER_IMAGE_VERSION, EC2_INSTANCE_AMI_ID, EC2_INSTANCE_AWS_INSTANCE_TYPE, EC2_INSTANCE_AWS_SECURITY_GROUP, EC2_INSTANCE_BEANSTALK_ENV_NAME, EC2_INSTANCE_ID, EC2_INSTANCE_NAME, EC2_INSTANCE_PRIVATE_HOST_NAME, EC2_INSTANCE_PUBLIC_HOST_NAME, EC2_INSTANCE_TAGS, ENTERPRISE_APPLICATION_DECODER_TYPE, ENTERPRISE_APPLICATION_IP_ADDRESS, ENTERPRISE_APPLICATION_METADATA, ENTERPRISE_APPLICATION_NAME, ENTERPRISE_APPLICATION_PORT, ENTERPRISE_APPLICATION_TAGS, ESXI_HOST_CLUSTER_NAME, ESXI_HOST_HARDWARE_MODEL, ESXI_HOST_HARDWARE_VENDOR, ESXI_HOST_NAME, ESXI_HOST_PRODUCT_NAME, ESXI_HOST_PRODUCT_VERSION, ESXI_HOST_TAGS, EXTERNAL_MONITOR_ENGINE_DESCRIPTION, EXTERNAL_MONITOR_ENGINE_NAME, EXTERNAL_MONITOR_ENGINE_TYPE, EXTERNAL_MONITOR_NAME, EXTERNAL_MONITOR_TAGS, GEOLOCATION_SITE_NAME, GOOGLE_CLOUD_PLATFORM_ZONE_NAME, GOOGLE_COMPUTE_INSTANCE_ID, GOOGLE_COMPUTE_INSTANCE_MACHINE_TYPE, GOOGLE_COMPUTE_INSTANCE_NAME, GOOGLE_COMPUTE_INSTANCE_PROJECT, GOOGLE_COMPUTE_INSTANCE_PROJECT_ID, GOOGLE_COMPUTE_INSTANCE_PUBLIC_IP_ADDRESSES, HOST_AIX_LOGICAL_CPU_COUNT, HOST_AIX_SIMULTANEOUS_THREADS, HOST_AIX_VIRTUAL_CPU_COUNT, HOST_ARCHITECTURE, HOST_AWS_NAME_TAG, HOST_AZURE_COMPUTE_MODE, HOST_AZURE_SKU, HOST_AZURE_WEB_APPLICATION_HOST_NAMES, HOST_AZURE_WEB_APPLICATION_SITE_NAMES, HOST_BITNESS, HOST_BOSH_AVAILABILITY_ZONE, HOST_BOSH_DEPLOYMENT_ID, HOST_BOSH_INSTANCE_ID, HOST_BOSH_INSTANCE_NAME, HOST_BOSH_NAME, HOST_BOSH_STEMCELL_VERSION, HOST_CLOUD_TYPE, HOST_CPU_CORES, HOST_CUSTOM_METADATA, HOST_DETECTED_NAME, HOST_GROUP_ID, HOST_GROUP_NAME, HOST_HYPERVISOR_TYPE, HOST_IP_ADDRESS, HOST_KUBERNETES_LABELS, HOST_LOGICAL_CPU_CORES, HOST_NAME, HOST_ONEAGENT_CUSTOM_HOST_NAME, HOST_OS_TYPE, HOST_OS_VERSION, HOST_PAAS_MEMORY_LIMIT, HOST_PAAS_TYPE, HOST_TAGS, HOST_TECHNOLOGY, HTTP_MONITOR_NAME, HTTP_MONITOR_TAGS, KUBERNETES_CLUSTER_NAME, KUBERNETES_NODE_NAME, KUBERNETES_SERVICE_NAME, MOBILE_APPLICATION_NAME, MOBILE_APPLICATION_PLATFORM, MOBILE_APPLICATION_TAGS, NAME_OF_COMPUTE_NODE, OPENSTACK_ACCOUNT_NAME, OPENSTACK_ACCOUNT_PROJECT_NAME, OPENSTACK_AVAILABILITY_ZONE_NAME, OPENSTACK_PROJECT_NAME, OPENSTACK_REGION_NAME, OPENSTACK_VM_INSTANCE_TYPE, OPENSTACK_VM_NAME, OPENSTACK_VM_SECURITY_GROUP, PROCESS_GROUP_AZURE_HOST_NAME, PROCESS_GROUP_AZURE_SITE_NAME, PROCESS_GROUP_CUSTOM_METADATA, PROCESS_GROUP_DETECTED_NAME, PROCESS_GROUP_ID, PROCESS_GROUP_LISTEN_PORT, PROCESS_GROUP_NAME, PROCESS_GROUP_PREDEFINED_METADATA, PROCESS_GROUP_TAGS, PROCESS_GROUP_TECHNOLOGY, PROCESS_GROUP_TECHNOLOGY_EDITION, PROCESS_GROUP_TECHNOLOGY_VERSION, QUEUE_NAME, QUEUE_TECHNOLOGY, QUEUE_VENDOR, SERVICE_AKKA_ACTOR_SYSTEM, SERVICE_CTG_SERVICE_NAME, SERVICE_DATABASE_HOST_NAME, SERVICE_DATABASE_NAME, SERVICE_DATABASE_TOPOLOGY, SERVICE_DATABASE_VENDOR, SERVICE_DETECTED_NAME, SERVICE_ESB_APPLICATION_NAME, SERVICE_IBM_CTG_GATEWAY_URL, SERVICE_MESSAGING_LISTENER_CLASS_NAME, SERVICE_NAME, SERVICE_PORT, SERVICE_PUBLIC_DOMAIN_NAME, SERVICE_REMOTE_ENDPOINT, SERVICE_REMOTE_SERVICE_NAME, SERVICE_TAGS, SERVICE_TECHNOLOGY, SERVICE_TECHNOLOGY_EDITION, SERVICE_TECHNOLOGY_VERSION, SERVICE_TOPOLOGY, SERVICE_TYPE, SERVICE_WEB_APPLICATION_ID, SERVICE_WEB_CONTEXT_ROOT, SERVICE_WEB_SERVER_ENDPOINT, SERVICE_WEB_SERVER_NAME, SERVICE_WEB_SERVICE_NAME, SERVICE_WEB_SERVICE_NAMESPACE, VMWARE_DATACENTER_NAME, VMWARE_VM_NAME, WEB_APPLICATION_NAME, WEB_APPLICATION_NAME_PATTERN, WEB_APPLICATION_TAGS, WEB_APPLICATION_TYPE
          operator           = string #(Required) Possible Values: BEGINS_WITH, CONTAINS, ENDS_WITH, EQUALS, EXISTS, GREATER_THAN, GREATER_THAN_OR_EQUAL, IS_IP_IN_RANGE, LOWER_THAN, LOWER_THAN_OR_EQUAL, NOT_BEGINS_WITH, NOT_CONTAINS, NOT_ENDS_WITH, NOT_EQUALS, NOT_EXISTS, NOT_GREATER_THAN, NOT_GREATER_THAN_OR_EQUAL, NOT_IS_IP_IN_RANGE, NOT_LOWER_THAN, NOT_LOWER_THAN_OR_EQUAL, NOT_REGEX_MATCHES, NOT_TAG_KEY_EQUALS, REGEX_MATCHES, TAG_KEY_EQUALS
          string_value       = string #(Optional) 
          dynamic_key        = string
          dynamic_key_source = string
          entity_id          = string
          enum_value         = string
          integer_value      = number
          tag                = string
        }))
      }))
    }))
    dynatrace_management_zone_dimension_rules = object({
      applies_to     = string #(Optional) Possible Values: ANY, LOG, METRIC
      condition_type = string #(Optional) Possible Values: DIMENSION, LOG_FILE_NAME, METRIC_KEY 
      rule_matcher   = string #(Optional) Possible Values: BEGINS_WITH, EQUALS
      value          = string #(Optional) no documentation available
    })
  }))
}

variable "dynatrace_web_application_variables" {
  type = map(object({
    web_application_name                                        = string
    web_application_type                                        = string
    web_application_cost_control_user_session_percentage        = number
    web_application_load_action_key_performance_metric          = string
    web_application_real_user_monitoring_enabled                = bool
    web_application_xhr_action_key_performance_metric           = string
    custom_action_apdex_settings_frustrating_fallback_threshold = number
    custom_action_apdex_settings_frustrating_threshold          = number
    custom_action_apdex_settings_tolerated_fallback_threshold   = number
    custom_action_apdex_settings_tolerated_threshold            = number
    load_action_apdex_settings_frustrating_fallback_threshold   = number
    load_action_apdex_settings_frustrating_threshold            = number
    load_action_apdex_settings_tolerated_fallback_threshold     = number
    load_action_apdex_settings_tolerated_threshold              = number
    meta_data_capture_settings = object({
      capture = list(object({
        name           = string
        type           = string
        capturing_name = string
        unique_id      = number
      }))
    })
    session_replay_config = object({
      enabled                                = bool
      cost_control_percentage                = number
      enable_css_resource_capturing          = bool
      css_resource_capturing_exclusion_rules = list(string)
    })
    user_action_and_session_properties = object({
      property = list(object({
        type                      = string
        aggregation               = string
        display_name              = string
        id                        = number
        key                       = string
        metadata_id               = number
        origin                    = string
        store_as_session_property = bool
      }))
    })
    browser_restriction_settings = object({
      browser_restriction_settings_restriction_browser_type    = string
      browser_restriction_settings_restriction_browser_version = string
      browser_restriction_settings_restriction_comparator      = string
      browser_restriction_settings_restriction_platform        = string
    })
    ip_address_restriction_settings = object({
      ip_address_restriction_settings_mode = string
      address                              = string
      address_to                           = string
    })
    javascript_framework_support = object({
      javascript_framework_support_angular   = bool
      javascript_framework_support_extjs     = bool
      javascript_framework_support_jquery    = bool
      javascript_framework_support_prototype = bool
      #dojo            = bool
      #moo_tools       = bool
      #icefaces        = bool
      #active_x_object = bool
    })
    javascript_injection_rules = object({
      rule         = string
      enabled      = bool
      html_pattern = string
      url_pattern  = string
      target       = string
      url_operator = string
    })
    conversion_goals = object({
      goal                       = string
      id                         = string
      type                       = string
      visit_duration_duration    = number
      user_action_user_action    = string
      user_action_case_sensitive = string
      user_action_match_entity   = string
      user_action_match_type     = string
      user_action_value          = string
      destination_url_or_path    = string
      destination_case_sensitive = bool
      destination_match_type     = string
    })
    user_action_naming_settings = object({
      user_action_naming_settings_ignore_case                    = string
      user_action_naming_settings_query_parameter_cleanups       = set(string)
      user_action_naming_settings_split_user_actions_by_domain   = string
      user_action_naming_settings_use_first_detected_load_action = string
      custom_action_naming_rules = object({
        rule = list(object({
          template          = string
          use_or_conditions = bool
          condition = list(object({
            operand1 = string
            operand2 = string
            operator = string
          }))
        }))
      })
      load_action_naming_rules = object({
        rule = list(object({
          load_action_naming_rules_template = string
          use_or_conditions                 = bool
          condition = list(object({
            operand1 = string
            operand2 = string
            operator = string
          }))
        }))
      })
      placeholder = list(object({
        placeholder_name            = string
        placeholder_input           = string
        placeholder_processing_part = string
        placeholder_metadata_id     = number
        step = list(object({
          processing_steps_type                       = string
          processing_steps_pattern_after_search_type  = string
          processing_steps_pattern_before             = string
          processing_steps_pattern_before_search_type = string
        }))
      }))
      xhr_action_naming_rules = object({
        rule = list(object({
          xhr_action_naming_rules_template          = string
          xhr_action_naming_rules_use_or_conditions = bool
        }))
      })
    })
    # tag = list(object({
    #   user_tags_id                            = string
    #   user_tags_metadata_id                   = string
    #   user_tags_ignore_case                   = bool
    #   user_tags_cleanup_role                  = string
    #   user_tags_server_side_request_attribute = string
    # }))
    add_cross_origin_anonymous_attribute                             = bool
    cache_control_header_optimizations                               = bool
    angular_package_name                                             = string
    injection_mode                                                   = string
    script_tag_cache_duration_in_hours                               = number
    max_action_name_length                                           = number
    max_errors_to_capture                                            = number
    max_dom_nodes                                                    = number
    global_event_capture_settings_click                              = bool
    global_event_capture_settings_doubleclick                        = bool
    global_event_capture_settings_keydown                            = bool
    global_event_capture_settings_keyup                              = bool
    global_event_capture_settings_mousedown                          = bool
    global_event_capture_settings_mouseup                            = bool
    global_event_capture_settings_scroll                             = bool
    content_capture_javascript_errors                                = bool
    content_capture_visually_complete_and_speed_index                = bool
    resource_timing_settings_instrumentation_delay                   = number
    resource_timing_settings_non_w3c_resource_timings                = bool
    resource_timing_settings_w3c_resource_timings                    = bool
    timeout_settings_temporary_action_limit                          = number
    timeout_settings_temporary_action_total_timeout                  = number
    timeout_settings_timed_action_support                            = bool
    visually_complete_settings_inactivity_timeout                    = number
    visually_complete_settings_mutation_timeout                      = number
    visually_complete_settings_threshold                             = number
    waterfall_settings_resource_browser_caching_threshold            = number
    waterfall_settings_resources_threshold                           = number
    waterfall_settings_slow_cnd_resources_threshold                  = number
    waterfall_settings_slow_first_party_resources_threshold          = number
    waterfall_settings_slow_third_party_resources_threshold          = number
    waterfall_settings_speed_index_visually_complete_ratio_threshold = number
    waterfall_settings_uncompressed_resources_threshold              = number
    xhr_action_apdex_settings_frustrating_fallback_threshold         = number
    xhr_action_apdex_settings_frustrating_threshold                  = number
    xhr_action_apdex_settings_tolerated_fallback_threshold           = number
    xhr_action_apdex_settings_tolerated_threshold                    = number
  }))

}

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

# variable "json_dashboard_variables" {
#   type = map(object({
#     json_dashboard_contents = string #(Required) (String) Contains the JSON Code of the Dashboard
#     link_id                 = string #(Optional) (String) ID of the dashboard, used with the json_dashboard_base resource and variables to create circular dependencies between dashboards for hyperlinks. See the documentation for dynatrace_json_dashboard_base for a concrete example.
#   }))
# }
