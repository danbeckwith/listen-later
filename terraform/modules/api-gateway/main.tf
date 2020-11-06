resource "aws_api_gateway_rest_api" "spotify" {
  name        = "SpotifyAPI"
  description = "This is an API for checking Spotify data"
}

resource "aws_api_gateway_resource" "home" {
  rest_api_id = aws_api_gateway_rest_api.spotify.id
  parent_id   = aws_api_gateway_rest_api.spotify.root_resource_id
  path_part   = "home"
}

resource "aws_api_gateway_method" "home" {
  rest_api_id   = aws_api_gateway_rest_api.spotify.id
  resource_id   = aws_api_gateway_resource.home.id
  http_method   = "GET"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "home" {
  rest_api_id             = aws_api_gateway_rest_api.spotify.id
  resource_id             = aws_api_gateway_resource.home.id
  http_method             = aws_api_gateway_method.home.http_method
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = var.lambda_invoke_arn
}

resource "aws_lambda_permission" "home_access" {
  statement_id  = "AllowExecutionFromAPIGateway-HomeEndpoint"
  action        = "lambda:InvokeFunction"
  function_name = var.lambda_function_name
  principal     = "apigateway.amazonaws.com"

  # source_arn = "arn:aws:execute-api:eu-west-2:757782070749:${aws_api_gateway_rest_api.spotify.id}/*/*/*"
  source_arn = "arn:aws:execute-api:eu-west-1:757782070749:${aws_api_gateway_rest_api.spotify.id}/*/${aws_api_gateway_method.home.http_method}${aws_api_gateway_resource.home.path}"
}

resource "aws_api_gateway_deployment" "test" {
  depends_on = [aws_api_gateway_integration.home]

  rest_api_id = aws_api_gateway_rest_api.spotify.id
  stage_name  = "test"

  lifecycle {
    create_before_destroy = true
  }
}

///////////////////////////

# resource "aws_api_gateway_resource" "login" {
#   rest_api_id = aws_api_gateway_rest_api.spotify.id
#   parent_id   = aws_api_gateway_rest_api.spotify.root_resource_id
#   path_part   = "login"
# }

# resource "aws_api_gateway_method" "login" {
#   rest_api_id   = aws_api_gateway_rest_api.spotify.id
#   resource_id   = aws_api_gateway_resource.login.id
#   http_method   = "GET"
#   authorization = "NONE"
# }

# resource "aws_api_gateway_integration" "login" {
#   rest_api_id             = aws_api_gateway_rest_api.spotify.id
#   resource_id             = aws_api_gateway_resource.login.id
#   http_method             = aws_api_gateway_method.login.http_method
#   integration_http_method = "POST"
#   type                    = "AWS_PROXY"
#   uri                     = var.lambda_invoke_arn
# }

# resource "aws_lambda_permission" "apigw_add_stream" {
#   statement_id  = "AllowExecutionFromAPIGateway"
#   action        = "lambda:InvokeFunction"
#   function_name = var.lambda_function_name
#   principal     = "apigateway.amazonaws.com"

#   source_arn = "arn:aws:execute-api:eu-west-2:757782070749:${aws_api_gateway_rest_api.spotify.id}/*/${aws_api_gateway_method.login.http_method}${aws_api_gateway_resource.login.path}"
# }

