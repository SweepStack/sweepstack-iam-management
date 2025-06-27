
resource "aws_iam_user" "cognito_user" {
  name = "cognito_user"

  tags = {
    "env" = local.environment
  }
}

resource "aws_iam_access_key" "cognito_user_access_key" {
  user = aws_iam_user.cognito_user.name
}

resource "aws_iam_user_policy_attachment" "cognito_user_attach" {
  user       = aws_iam_user.cognito_user.name
  policy_arn = aws_iam_policy.cognito_user_policy.arn
}

resource "aws_iam_policy" "cognito_user_policy" {
  name   = "cognito_user_s3_policy"
  policy = data.aws_iam_policy_document.cognito_policy_doc.json
}

data "aws_iam_policy_document" "cognito_policy_doc" {

  statement {
    sid = "TerraformCognitoManagement"
    actions = [
      "cognito-idp:ListUserPools",

      "cognito-idp:CreateUserPool",
      "cognito-idp:DescribeUserPool",
      "cognito-idp:UpdateUserPool",
      "cognito-idp:DeleteUserPool",

      "cognito-idp:ListUserPoolClients",
      "cognito-idp:CreateUserPoolClient",
      "cognito-idp:DescribeUserPoolClient",
      "cognito-idp:UpdateUserPoolClient",
      "cognito-idp:DeleteUserPoolClient",

      "cognito-idp:CreateUserPoolDomain",
      "cognito-idp:DescribeUserPoolDomain",
      "cognito-idp:DeleteUserPoolDomain",

      "cognito-idp:SetUiCustomization",
      "cognito-idp:GetUiCustomization",
      "cognito-idp:DeleteUiCustomization",

      "cognito-idp:CreateResourceServer",
      "cognito-idp:DescribeResourceServer",
      "cognito-idp:UpdateResourceServer",
      "cognito-idp:DeleteResourceServer",
      "cognito-idp:ListResourceServers"
    ]
    resources = "*"
    effect    = "Allow"
  }
}
