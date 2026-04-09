resource "dynatrace_web_application" "web_application" {
  provider                             = dynatrace.Non-Production
  for_each                             = var.dynatrace_web_application_variables
  name                                 = each.value.web_application_name
  type                                 = each.value.web_application_type
  cost_control_user_session_percentage = each.value.web_application_cost_control_user_session_percentage
  load_action_key_performance_metric   = each.value.web_application_load_action_key_performance_metric
  real_user_monitoring_enabled         = each.value.web_application_real_user_monitoring_enabled
  xhr_action_key_performance_metric    = each.value.web_application_xhr_action_key_performance_metric
  custom_action_apdex_settings {
    frustrating_fallback_threshold = each.value.custom_action_apdex_settings_frustrating_fallback_threshold
    frustrating_threshold          = each.value.custom_action_apdex_settings_frustrating_threshold
    tolerated_fallback_threshold   = each.value.custom_action_apdex_settings_tolerated_fallback_threshold
    tolerated_threshold            = each.value.custom_action_apdex_settings_tolerated_threshold
  }
  load_action_apdex_settings {
    frustrating_fallback_threshold = each.value.load_action_apdex_settings_frustrating_fallback_threshold
    frustrating_threshold          = each.value.load_action_apdex_settings_frustrating_threshold
    tolerated_fallback_threshold   = each.value.load_action_apdex_settings_tolerated_fallback_threshold
    tolerated_threshold            = each.value.load_action_apdex_settings_tolerated_threshold
  }
  dynamic "meta_data_capture_settings" {
    for_each = each.value.meta_data_capture_settings != null ? [each.value.meta_data_capture_settings] : []
    content {
      dynamic "capture" {
        for_each = meta_data_capture_settings.value.capture != null ? meta_data_capture_settings.value.capture : []
        content {
          name           = capture.value.name
          type           = capture.value.type
          capturing_name = capture.value.capturing_name
          # public_metadata = false 
          unique_id = capture.value.unique_id
          # use_last_value = false 
        }
      }
    }
  }
  monitoring_settings {
    add_cross_origin_anonymous_attribute = each.value.add_cross_origin_anonymous_attribute
    cache_control_header_optimizations   = each.value.cache_control_header_optimizations
    angular_package_name                 = each.value.angular_package_name
    injection_mode                       = each.value.injection_mode
    script_tag_cache_duration_in_hours   = each.value.script_tag_cache_duration_in_hours
    # secure_cookie_attribute = each.value.secure_cookie_attribute
    # server_request_path_id = each.value.server_request_path_id
    # xml_http_request = each.value.xml_http_request
    # library_file_location = each.value.library_file_location
    # monitoring_data_path = each.value.monitoring_data_path
    # instrumented_web_server = each.value.instrumented_web_server
    # cookie_placement_domain = each.value.cookie_placement_domain
    # correlation_header_inclusion_regex = each.value.correlation_header_inclusion_regex
    # custom_configuration_properties = each.custom_configuration_properties
    # exclude_xhr_regex = each.value.exclude_xhr_regex
    # fetch_requests = each.value.fetch_requests
    # same_site_cookie_attribute = each.value.same_site_cookie_attribute
    # script_tag_cache_duration_in_hours = each.value.script_tag_cache_duration_in_hours
    # use_cors = each.value.cors

    dynamic "ip_address_restriction_settings" {
      for_each = each.value.ip_address_restriction_settings != null ? [each.value.ip_address_restriction_settings] : []
      content {
        mode = each.value.ip_address_restriction_settings_mode
        restrictions {
          range {
            address    = each.value.ip_address_restriction_settings_range
            address_to = each.value.ip_address_restriction_settings_subnet_mask
          }
        }
      }
    }
    dynamic "browser_restriction_settings" {
      for_each = each.value.browser_restriction_settings != null ? [each.value.browser_restriction_settings] : []
      content {
        mode = each.value.browser_restriction_settings_mode
        restrictions {
          restriction {
            browser_type    = each.value.browser_restriction_settings_restriction_browser_type
            browser_version = each.value.browser_restriction_settings_restriction_browser_version
            comparator      = each.value.browser_restriction_settings_restriction_comparator
            platform        = each.value.browser_restriction_settings_restriction_platform
          }
        }
      }

    }
    advanced_javascript_tag_settings {
      # instrument_unsupported_ajax_frameworks = each.value.instrument_unsupported_ajax_frameworks
      max_action_name_length = each.value.max_action_name_length
      max_errors_to_capture  = each.value.max_errors_to_capture
      # special_characters_to_escape = each.value.special_characters_to_escape
      # sync_beacon_firefox = each.value.sync_beacon_firefox 
      # sync_beacon_internet_explorer = each.value.sync_beacon_internet_explorer
      additional_event_handlers {
        # blur   = each.value.additional_event_handlers.blur
        # change = each.value.additional_event_handlers.change
        # click  = each.value.additional_event_handlers.click
        max_dom_nodes = each.value.max_dom_nodes
        # mouseup = each.value.additional_event_handlers.mouseup
        # to_string_method = each.value.additional_event_handlers.to_string_method
        # use_mouse_up_event_for_clicks = each.value.additional_event_handlers.use_mouse_up_event_for_clicks
      }
      global_event_capture_settings {
        # additional_event_captured_as_user_input = each.value.global_event_capture_settings.additional_event_captured_as_user_input 
        click       = each.value.global_event_capture_settings_click
        doubleclick = each.value.global_event_capture_settings_doubleclick
        keydown     = each.value.global_event_capture_settings_keydown
        keyup       = each.value.global_event_capture_settings_keyup
        mousedown   = each.value.global_event_capture_settings_mousedown
        mouseup     = each.value.global_event_capture_settings_mouseup
        scroll      = each.value.global_event_capture_settings_scroll
      }
    }
    content_capture {
      javascript_errors                 = each.value.content_capture_javascript_errors
      visually_complete_and_speed_index = each.value.content_capture_visually_complete_and_speed_index
      resource_timing_settings {
        instrumentation_delay    = each.value.resource_timing_settings_instrumentation_delay
        non_w3c_resource_timings = each.value.resource_timing_settings_non_w3c_resource_timings
        w3c_resource_timings     = each.value.resource_timing_settings_w3c_resource_timings
      }
      timeout_settings {
        temporary_action_limit         = each.value.timeout_settings_temporary_action_limit
        temporary_action_total_timeout = each.value.timeout_settings_temporary_action_total_timeout
        timed_action_support           = each.value.timeout_settings_timed_action_support
      }
      visually_complete_settings {
        # exclude_url_regex = each.value.timeout_settings.exclude_url_regex
        # ignored_mutations_list = each.value.timeout_settings.ignored_mutations_list
        inactivity_timeout = each.value.visually_complete_settings_inactivity_timeout
        mutation_timeout   = each.value.visually_complete_settings_mutation_timeout
        threshold          = each.value.visually_complete_settings_threshold
      }
    }
    dynamic "javascript_framework_support" {
      for_each = each.value.javascript_framework_support != null ? [each.value.javascript_framework_support] : []
      content {
        angular   = javascript_framework_support.value.javascript_framework_support_angular
        extjs     = javascript_framework_support.value.javascript_framework_support_extjs
        jquery    = javascript_framework_support.value.javascript_framework_support_jquery
        prototype = javascript_framework_support.value.javascript_framework_support_prototype
        # dojo = each.value.dojo 
        # moo_tools = each.value.moo_tools
        # icefaces = each.value.icefaces
        # active_x_object = each.value.active_x_object 
      }
    }
    dynamic "javascript_injection_rules" {
      for_each = each.value.javascript_injection_rules != null ? [each.value.javascript_injection_rules] : []
      content {
        rule {
          rule         = each.value.rule
          enabled      = each.value.enabled
          html_pattern = each.value.html_pattern
          url_pattern  = each.value.url_pattern
          target       = each.value.target
          url_operator = each.value.url_operator
        }
      }
    }
  }
  dynamic "session_replay_config" {
    for_each = each.value.session_replay_config != null ? [each.value.session_replay_config] : []
    content {
      enabled                                = session_replay_config.value.enabled
      cost_control_percentage                = session_replay_config.value.cost_control_percentage
      enable_css_resource_capturing          = session_replay_config.value.enable_css_resource_capturing
      css_resource_capturing_exclusion_rules = session_replay_config.value.css_resource_capturing_exclusion_rules
    }
  }
  dynamic "user_action_and_session_properties" {
    for_each = each.value.user_action_and_session_properties != null ? [each.value.user_action_and_session_properties] : []
    content {
      dynamic "property" {
        for_each = user_action_and_session_properties.value.property
        content {
          type                      = property.value.type
          aggregation               = property.value.aggregation
          display_name              = property.value.display_name
          id                        = property.value.id
          key                       = property.value.key
          metadata_id               = property.value.metadata_id
          origin                    = property.value.origin
          store_as_session_property = property.value.store_as_session_property
        }
      }
    }
  }
  dynamic "user_action_naming_settings" {
    for_each = each.value.user_action_naming_settings != null ? [each.value.user_action_naming_settings] : []
    content {
      ignore_case                    = user_action_naming_settings.value.user_action_naming_settings_ignore_case
      query_parameter_cleanups       = user_action_naming_settings.value.user_action_naming_settings_query_parameter_cleanups
      split_user_actions_by_domain   = user_action_naming_settings.value.user_action_naming_settings_split_user_actions_by_domain
      use_first_detected_load_action = user_action_naming_settings.value.user_action_naming_settings_use_first_detected_load_action
      dynamic "custom_action_naming_rules" {
        for_each = user_action_naming_settings.value.custom_action_naming_rules != null ? [user_action_naming_settings.value.custom_action_naming_rules] : []
        content {
          dynamic "rule" {
            for_each = custom_action_naming_rules.value.rule != null ? custom_action_naming_rules.value.rule : []
            content {
              template          = rule.value.template
              use_or_conditions = rule.value.use_or_conditions
              conditions {
                dynamic "condition" {
                  for_each = rule.value.condition != null ? rule.value.condition : []
                  content {
                    operand1 = condition.value.operand1
                    operand2 = condition.value.operand2
                    operator = condition.value.operator
                  }
                }
              }
            }
          }
        }
      }
      dynamic "load_action_naming_rules" {
        for_each = user_action_naming_settings.value.load_action_naming_rules != null ? [user_action_naming_settings.value.load_action_naming_rules] : []
        content {
          dynamic "rule" {
            for_each = load_action_naming_rules.value.rule != null ? load_action_naming_rules.value.rule : []
            content {
              template = rule.value.load_action_naming_rules_template
              conditions {
                dynamic "condition" {
                  for_each = rule.value.condition != null ? rule.value.condition : []
                  content {
                    operand1 = condition.value.operand1
                    operand2 = condition.value.operand2
                    operator = condition.value.operator
                  }
                }
              }
            }
          }
        }
      }
      placeholders {
        dynamic "placeholder" {
          for_each = user_action_naming_settings.value.placeholder != null ? user_action_naming_settings.value.placeholder : []
          content {
            name            = placeholder.value.placeholder_name
            input           = placeholder.value.placeholder_input
            processing_part = placeholder.value.placeholder_processing_part
            metadata_id     = placeholder.value.placeholder_metadata_id
            processing_steps {
              dynamic "step" {
                for_each = placeholder.value.step != null ? placeholder.value.step : []
                content {
                  type                       = step.value.processing_steps_type
                  pattern_after_search_type  = step.value.processing_steps_pattern_after_search_type
                  pattern_before             = step.value.processing_steps_pattern_before
                  pattern_before_search_type = step.value.processing_steps_pattern_before_search_type
                }
              }
            }
          }
        }
      }
      dynamic "xhr_action_naming_rules" {
        for_each = user_action_naming_settings.value.xhr_action_naming_rules != null ? [user_action_naming_settings.value.xhr_action_naming_rules] : []
        content {
          dynamic "rule" {
            for_each = xhr_action_naming_rules.value.rule != null ? xhr_action_naming_rules.value.rule : []
            content {
              template          = rule.value.xhr_action_naming_rules_template
              use_or_conditions = rule.value.xhr_action_naming_rules_use_or_conditions
            }
          }
        }
      }
    }
  }
  # user_tags {
  #   dynamic "tag" {
  #     for_each = each.value.tag != null ? each.value.tag : []
  #     content {
  #       id                            = tag.value.user_tags_id
  #       metadata_id                   = tag.value.user_tags_metadata_id
  #       ignore_case                   = tag.value.user_tags_ignore_case
  #       cleanup_rule                  = tag.value.user_tags_cleanup_role
  #       server_side_request_attribute = tag.value.user_tags_server_side_request_attribute

  #     }
  #   }
  # }
  waterfall_settings {
    resource_browser_caching_threshold            = each.value.waterfall_settings_resource_browser_caching_threshold
    resources_threshold                           = each.value.waterfall_settings_resources_threshold
    slow_cnd_resources_threshold                  = each.value.waterfall_settings_slow_cnd_resources_threshold
    slow_first_party_resources_threshold          = each.value.waterfall_settings_slow_first_party_resources_threshold
    slow_third_party_resources_threshold          = each.value.waterfall_settings_slow_third_party_resources_threshold
    speed_index_visually_complete_ratio_threshold = each.value.waterfall_settings_speed_index_visually_complete_ratio_threshold
    uncompressed_resources_threshold              = each.value.waterfall_settings_uncompressed_resources_threshold
  }
  xhr_action_apdex_settings {
    frustrating_fallback_threshold = each.value.xhr_action_apdex_settings_frustrating_fallback_threshold
    frustrating_threshold          = each.value.xhr_action_apdex_settings_frustrating_threshold
    tolerated_fallback_threshold   = each.value.xhr_action_apdex_settings_tolerated_fallback_threshold
    tolerated_threshold            = each.value.xhr_action_apdex_settings_tolerated_threshold
  }
  dynamic "conversion_goals" {
    for_each = each.value.conversion_goals != null ? [each.value.conversion_goals] : []
    content {
      goal {
        name = each.value.goal
        id   = each.value.id
        type = each.value.type
        visit_duration {
          duration = conversion_goals.value.visit_duration_duration
        }
        user_action {
          action_type    = conversion_goals.value.user_action_user_action
          case_sensitive = conversion_goals.value.user_action_case_sensitive
          match_entity   = conversion_goals.value.user_action_match_entity
          match_type     = conversion_goals.value.user_action_match_type
          value          = conversion_goals.value.user_action_value
        }
        destination {
          url_or_path    = conversion_goals.value.destination_url_or_path
          case_sensitive = conversion_goals.value.destination_case_sensitive
          match_type     = conversion_goals.value.destination_match_type
        }
      }
    }
  }
}
