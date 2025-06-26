resource "hcp_vault_secrets_app" "new-test-app" {
  app_name    = "test-app"
  description = "this is a trap!"
}

resource "hcp_vault_secrets_secret" "test-user-credential-access-key" {
  app_name     = hcp_vault_secrets_app.new-test-app.app_name
  secret_name  = "test-access-key"
  secret_value = aws_iam_access_key.test-user-key.id
}
resource "hcp_vault_secrets_secret" "test-user-credential-secret-key" {
  app_name     = hcp_vault_secrets_app.new-test-app.app_name
  secret_name  = "test-secret-key"
  secret_value = aws_iam_access_key.test-user-key.secret
}
