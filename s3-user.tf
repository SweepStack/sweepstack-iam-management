
resource "aws_iam_user" "test-user" {
  name = "test_user_s3"

  tags = {
    "env" = "sbx"
  }
}

resource "aws_iam_access_key" "test-user-key" {
  user = aws_iam_user.test-user.name
}

resource "aws_iam_user_policy_attachment" "test-user-attach" {
  user       = aws_iam_user.test-user.name
  policy_arn = aws_iam_policy.test-user-policy.arn
}

resource "aws_iam_policy" "test-user-policy" {
  name   = "test_user_s3_policy"
  policy = data.aws_iam_policy_document.test-policy-doc.json
}

data "aws_iam_policy_document" "test-policy-doc" {

  statement {
    actions = [
      "s3:ListAllMyBuckets"
    ]
    resources = ["arn:aws:s3:::*"]
    effect    = "Allow"
  }
}
