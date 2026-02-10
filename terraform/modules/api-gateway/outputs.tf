output "rest_api_id" {
  value = aws_api_gateway_rest_api.this.id
}
output "invoke_url" {
  description = "Base invoke URL for the API Gateway stage"
  value       = aws_api_gateway_stage.dev.invoke_url
}

