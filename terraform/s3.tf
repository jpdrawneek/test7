resource "aws_s3_bucket" "a" {
  bucket = "${local.app_name}-store-b"
  acl    = "private"

  versioning {
    enabled = true
  }

  tags = local.tags
}

resource "aws_s3_bucket" "b" {
  provider = aws.use1
  bucket   = "${local.app_name}-store-b"
  acl      = "private"

  versioning {
    enabled = true
  }

  tags = local.tags
}
