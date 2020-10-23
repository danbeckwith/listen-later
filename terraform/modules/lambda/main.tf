resource "aws_lambda_function" "add_stream" {
  function_name = var.lambda_name

  s3_bucket = "${var.project}-lambda-source"
  s3_key    = var.lambda_name

  role = aws_iam_role.lambda_assume_role.arn

  handler = "index.handler"
  runtime = "nodejs12.x"

  environment {
    variables = {
      clientId = var.client_id
      clientSecret = var.client_secret
    }
  }

  tags = var.tags
}

output "invoke_arn" {
  value = aws_lambda_function.add_stream.invoke_arn
}

output "function_name" {
  value = aws_lambda_function.add_stream.function_name
}