aws_apigatewayv2_integration_api_id = input(:aws_apigatewayv2_integration_api_id, value: '', description: '')
aws_apigatewayv2_integration_connection_id = input(:aws_apigatewayv2_integration_connection_id, value: '', description: '')
aws_apigatewayv2_integration_connection_type = input(:aws_apigatewayv2_integration_connection_type, value: 'INTERNET', description: '')
aws_apigatewayv2_integration_content_handling_strategy = input(:aws_apigatewayv2_integration_content_handling_strategy, value: '', description: '')
aws_apigatewayv2_integration_credentials_arn = input(:aws_apigatewayv2_integration_credentials_arn, value: '', description: '')
aws_apigatewayv2_integration_description = input(:aws_apigatewayv2_integration_description, value: '', description: '')
aws_apigatewayv2_integration_id = input(:aws_apigatewayv2_integration_id, value: '', description: '')
aws_apigatewayv2_integration_integration_method = input(:aws_apigatewayv2_integration_integration_method, value: 'ANY', description: '')
aws_apigatewayv2_integration_integration_response_selection_expression = input(:aws_apigatewayv2_integration_integration_response_selection_expression, value: '', description: '')
aws_apigatewayv2_integration_integration_subtype = input(:aws_apigatewayv2_integration_integration_subtype, value: '', description: '')
aws_apigatewayv2_integration_integration_type = input(:aws_apigatewayv2_integration_integration_type, value: 'HTTP_PROXY', description: '')
aws_apigatewayv2_integration_integration_uri = input(:aws_apigatewayv2_integration_integration_uri, value: 'https://example.com/{proxy}', description: '')
aws_apigatewayv2_integration_passthrough_behavior = input(:aws_apigatewayv2_integration_passthrough_behavior, value: 'WHEN_NO_MATCH', description: '')
aws_apigatewayv2_integration_payload_format_version = input(:aws_apigatewayv2_integration_payload_format_version, value: '1.0', description: '')
aws_apigatewayv2_integration_request_parameters = input(:aws_apigatewayv2_integration_request_parameters, value: '', description: '')
aws_apigatewayv2_integration_request_templates = input(:aws_apigatewayv2_integration_request_templates, value: '', description: '')
aws_apigatewayv2_integration_template_selection_expression = input(:aws_apigatewayv2_integration_template_selection_expression, value: '', description: '')
aws_apigatewayv2_integration_timeout_milliseconds = input(:aws_apigatewayv2_integration_timeout_milliseconds, value: 29000, description: '')
aws_apigatewayv2_integration_tls_config = input(:aws_apigatewayv2_integration_tls_config, value: '', description: '')

control 'aws-api-gateway-v2-integrations-v1.0.0' do
  impact 1.0
  title 'Ensure API Gateway API Integrations resource has the correct properties.'
  
  describe aws_api_gateway_v2_integrations(api_id: aws_apigatewayv2_integration_api_id) do
    it { should exist }
  end

  describe aws_api_gateway_v2_integrations(api_id: aws_apigatewayv2_integration_api_id) do
    its('api_gateway_manageds') { should be_empty }
    its('connection_ids') { should be_empty }
    its('connection_types') { should include aws_apigatewayv2_integration_connection_type }
    its('content_handling_strategies') { should be_empty }
    its('credentials_arns') { should be_empty }
    its('descriptions') { should be_empty }
    its('integration_ids') { should include aws_apigatewayv2_integration_id }
    its('integration_methods') { should include aws_apigatewayv2_integration_integration_method }
    its('integration_response_selection_expressions') { should be_empty }
    its('integration_subtypes') { should be_empty }
    its('integration_types') { should include aws_apigatewayv2_integration_integration_type }
    its('integration_uris') { should include aws_apigatewayv2_integration_integration_uri }
    its('passthrough_behaviors') { should include aws_apigatewayv2_integration_passthrough_behavior }
    its('payload_format_versions') { should include aws_apigatewayv2_integration_payload_format_version }
    its('request_parameters') { should be_empty }
    its('request_templates') { should be_empty }
    its('template_selection_expressions') { should be_empty }
    its('timeout_in_millis') { should include aws_apigatewayv2_integration_timeout_milliseconds }
    its('tls_configs') { should be_empty }
  end
end
