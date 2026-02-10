output "rest_api_id" {
  description = "ID of the API Gateway REST API"
  value       = aws_api_gateway_rest_api.main.id
}

output "invoke_url" {
  description = "Base invoke URL for the API Gateway dev stage"
  value       = aws_api_gateway_stage.dev.invoke_url
}
