##################################
# REST API
##################################
resource "aws_api_gateway_rest_api" "main" {
  name = "${var.name_prefix}-api"
  tags = var.tags
}

##################################
# Cognito Authorizer
##################################
resource "aws_api_gateway_authorizer" "cognito" {
  name          = "cognito-authorizer"
  rest_api_id   = aws_api_gateway_rest_api.main.id
  type          = "COGNITO_USER_POOLS"
  provider_arns = [var.cognito_user_pool_arn]
}

##################################
# API Resource: /test
##################################
resource "aws_api_gateway_resource" "test" {
  rest_api_id = aws_api_gateway_rest_api.main.id
  parent_id   = aws_api_gateway_rest_api.main.root_resource_id
  path_part   = "test"
}

##################################
# GET Method (Protected by Cognito)
##################################
resource "aws_api_gateway_method" "test_get" {
  rest_api_id   = aws_api_gateway_rest_api.main.id
  resource_id   = aws_api_gateway_resource.test.id
  http_method   = "GET"
  authorization = "COGNITO_USER_POOLS"
  authorizer_id = aws_api_gateway_authorizer.cognito.id
}

##################################
# Mock Integration
##################################
resource "aws_api_gateway_integration" "test_mock" {
  rest_api_id = aws_api_gateway_rest_api.main.id
  resource_id = aws_api_gateway_resource.test.id
  http_method = aws_api_gateway_method.test_get.http_method
  type        = "MOCK"

  request_templates = {
    "application/json" = "{\"statusCode\": 200}"
  }
}

##################################
# Method Response
##################################
resource "aws_api_gateway_method_response" "test_200" {
  rest_api_id = aws_api_gateway_rest_api.main.id
  resource_id = aws_api_gateway_resource.test.id
  http_method = aws_api_gateway_method.test_get.http_method
  status_code = "200"
}

##################################
# Integration Response
##################################
resource "aws_api_gateway_integration_response" "test_200" {
  rest_api_id = aws_api_gateway_rest_api.main.id
  resource_id = aws_api_gateway_resource.test.id
  http_method = aws_api_gateway_method.test_get.http_method
  status_code = aws_api_gateway_method_response.test_200.status_code

  response_templates = {
    "application/json" = jsonencode({
      message = "Hello from protected API"
    })
  }
}

##################################
# Deployment & Stage
##################################
resource "aws_api_gateway_deployment" "main" {
  rest_api_id = aws_api_gateway_rest_api.main.id

  depends_on = [
    aws_api_gateway_integration.test_mock
  ]
}

resource "aws_api_gateway_stage" "dev" {
  rest_api_id   = aws_api_gateway_rest_api.main.id
  deployment_id = aws_api_gateway_deployment.main.id
  stage_name    = "dev"
}
