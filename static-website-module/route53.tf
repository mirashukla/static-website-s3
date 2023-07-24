resource "aws_route53_zone" "main" {
  name = var.domain_name
}
resource "aws_route53_record" "www-a" {
  zone_id = aws_route53_zone.main.zone_id
  name = var.domain_name
  type = "A"
  alias {
    name                   = aws_s3_bucket_website_configuration.static-website-bucket-config.website_domain
    zone_id = aws_s3_bucket.static-website-bucket.hosted_zone_id
    evaluate_target_health = false
  }
}