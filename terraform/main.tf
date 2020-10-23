locals {
  project = "listen-later"
  lambda = "listen-later-playlist-poller"

  tags = {
    Owner = "Daniel Beckwith"
    Project = local.project
  }
}

module "listen_later_playlist_poller" {
  source = "./modules/lambda"

  lambda_name = local.lambda
  tags = local.tags
  project = local.project
  client_id = var.client_id
  client_secret = var.client_secret
}

# module "add_stream_api" {
#   source = "./modules/api-gateway"

#   listen_later_lambda_invoke_arn = module.listen_later_playlist_poller.invoke_arn
#   listen_later_function_name = module.listen_later_playlist_poller.function_name
#   tags = local.tags
# }