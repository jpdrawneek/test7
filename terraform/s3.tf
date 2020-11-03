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

#
## Bucket policies
#

data "aws_iam_policy_document" "bucket_cdn" {
  statement {
      action    = ["s3:GetObject"]
      resources = ["${aws_s3_bucket.a.arn}/*", "${aws_s3_bucket.a.arn}/*"]

      principals {
          type       = "AWS"
          identifers = [aws_cloudfront_distribution.s3_access.iam_arn]
      }
  }

  statement {
      action    = ["s3:ListBucket"]
      resources = [aws_s3_bucket.a.arn, aws_s3_bucket.a.arn]

      principals {
          type       = "AWS"
          identifers = [aws_cloudfront_distribution.s3_access.iam_arn]
      }
  }
}

resource "aws_s3_bucket_policy" "bucket_a" {
  bucket = aws_s3_bucket.a.id
  policy = data.aws_iam_policy_document.bucket_cdn.json
}

resource "aws_s3_bucket_policy" "bucket_b" {
  provider = aws.use1
  bucket   = aws_s3_bucket.b.id
  policy   = data.aws_iam_policy_document.bucket_cdn.json
}
