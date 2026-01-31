variable "name_prefix" {
  type        = string
  description = "Prefix used to name Cognito resources (user pool, client, etc.)"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Common tags applied to Cognito resources"
}
