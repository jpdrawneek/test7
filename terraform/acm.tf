resource "aws_acm_certificate" "cert" {
  provider          = aws.use1
  domain_name       = "${var.subdomain}.${var.domain_name}"
  validation_method = "DNS"

  tags = local.tags

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_acm_certificate_validation" "cert_verf" {
  certificate_arn         = aws_acm_certificate.cert.arn
  validation_record_fqdns = [for record in aws_route53_record.cert_verify : record.fqdn]
}
