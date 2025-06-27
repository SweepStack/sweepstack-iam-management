resource "hcp_vault_secrets_app" "cognito_user_configuration" {
  app_name    = "cognito_user_configuration"
  description = "This is where the access key and secret key are for the Cognito IAM user is"
}

# resource "hcp_vault_secrets_secret" "cognito_user_access_key" {
#   app_name     = hcp_vault_secrets_app.cognito_user_configuration.app_name
#   secret_name  = "cognito_user_access_key"
#   secret_value = aws_iam_access_key.cognito_user_access_key.id
# }
# resource "hcp_vault_secrets_secret" "cognito_user_secret_key" {
#   app_name     = hcp_vault_secrets_app.cognito_user_configuration.app_name
#   secret_name  = "cognito_user_secret_key"
#   secret_value = aws_iam_access_key.cognito_user_access_key.secret
# }

resource "hcp_vault_secrets_secret" "cognito_user_credentials" {
  app_name    = hcp_vault_secrets_app.cognito_user_configuration.app_name
  secret_name = "cognito_user_credentials"
  secret_value = jsonencode({
    access_key = aws_iam_access_key.cognito_user_access_key.id
    secret_key = aws_iam_access_key.cognito_user_access_key.secret
  })
}
