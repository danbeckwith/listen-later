resource "aws_lambda_function" "login" {
  function_name = var.lambda_name

  s3_bucket = "${var.project}-lambda-source"
  s3_key    = var.lambda_name

  role = aws_iam_role.lambda_assume_role.arn

  handler = "index.handler"
  runtime = "nodejs12.x"

  environment {
    variables = {
      CLIENT_ID = var.client_id
      CLIENT_SECRET = var.client_secret
    }
  }

  tags = var.tags
}

output "invoke_arn" {
  value = aws_lambda_function.login.invoke_arn
}

output "function_name" {
  value = aws_lambda_function.login.function_name
}