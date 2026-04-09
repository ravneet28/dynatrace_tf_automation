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