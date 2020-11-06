locals {
  project = "listen-later"

  tags = {
    Owner = "Daniel Beckwith"
    Project = local.project
  }
}

module "spotify_login_lambda" {
  source = "./modules/lambda"

  lambda_name = "spotify-login-lambda"
  tags = local.tags
  project = local.project
  client_id = var.client_id
  client_secret = var.client_secret
}

module "api" {
  source = "./modules/api-gateway"

  lambda_invoke_arn = module.spotify_login_lambda.invoke_arn
  lambda_function_name = module.spotify_login_lambda.function_name
}