variable "lambda_name" {
  type = string
  description = "Name for lambda method"
}

variable "tags" {
  type = map(string)
  description = "Tags for AWS Resources"
}

variable "project" {
  type = string
  description = "Project lambda belongs to"
}

variable "client_id" {
    type = string
    description = "Client ID used to access the spotify API"
}

variable "client_secret" {
    type = string
    description = "Client Secret to access the spotify API"
}