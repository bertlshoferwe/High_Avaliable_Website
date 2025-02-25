resource "aws_lambda_function" "auto_remediate" {
  function_name    = "AutoRemediation"
  runtime         = "python3.8"
  handler         = "lambda_function.lambda_handler"
  role            = aws_iam_role.lambda_role.arn
  filename        = "lambda_function.zip"
}

