resource "aws_cloudfront_distribution" "s3_access" {
  comment = local.app_name
}

resource "aws_cloudfront_distribution" "s3_distribution" {
  origin {
    domain_name = aws_s3_bucket.a.bucket_regional_domain_name
    origin_id   = "euw1"

    s3_origin_config {
      origin_access_identity = aws_cloudfront_distribution.s3_access.cloudfront_access_identity_path
    }
  }

  origin {
    domain_name = aws_s3_bucket.b.bucket_regional_domain_name
    origin_id   = "use1"

    s3_origin_config {
      origin_access_identity = aws_cloudfront_distribution.s3_access.cloudfront_access_identity_path
    }
  }

  origin_group {
    origin_id = "groupS3"

    failover_criteria {
      status_codes = [403, 404, 500, 502]
    }

    member {
      origin_id = "euw1"
    }

    member {
      origin_id = "use1"
    }
  }

  enabled             = true
  is_ipv6_enabled     = true
  comment             = "Static site"
  default_root_object = "index.html"

  aliases = ["${var.subdomain}.${var.domain_name}"]

  price_class = var.price_class

  tags = local.tags

  geo_restriction {
    restriction_type = "none"
  }

  viewer_certificate {
    acm_certificate_arn      = aws_acm_certificate.cert.arn
    minimum_protocol_version = "TLSv1.2_2018"
    ssl_support_method       = "sni-only"
  }

  default_cache_behavior {
    allowed_methods        = ["GET", "HEAD", "OPTIONS"]
    cached_methods         = ["GET", "HEAD", "OPTIONS"]
    target_origin_id       = "groupS3"
    compress               = true
    viewer_protocol_policy = "redirect-to-https"

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }
  }
}