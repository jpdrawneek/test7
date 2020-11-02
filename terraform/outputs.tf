output "url" {
  value = aws_route53_record.www.fqdn
}

output "data-store" {
  value = {
    euw1 = aws_s3_bucket.a.id
    use1 = aws_s3_bucket.b.id
  }
}

output "data-store-arn" {
  value = {
    euw1 = aws_s3_bucket.a.arn
    use1 = aws_s3_bucket.b.arn
  }
}
