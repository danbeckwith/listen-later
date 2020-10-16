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