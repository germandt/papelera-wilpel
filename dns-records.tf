# Apunta wilpel.com.ar y www.wilpel.com.ar a CloudFront. Es un registro ALIAS (no un CNAME):
# los CNAME no se pueden usar en la raíz de un dominio por spec de DNS, y ALIAS es la forma
# nativa de Route53 de resolver esto, sin costo extra por las consultas.

resource "aws_route53_record" "apex" {
  zone_id = aws_route53_zone.site.zone_id
  name    = var.site_domain
  type    = "A"

  alias {
    name                   = aws_cloudfront_distribution.site.domain_name
    zone_id                = aws_cloudfront_distribution.site.hosted_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "www" {
  zone_id = aws_route53_zone.site.zone_id
  name    = "www.${var.site_domain}"
  type    = "A"

  alias {
    name                   = aws_cloudfront_distribution.site.domain_name
    zone_id                = aws_cloudfront_distribution.site.hosted_zone_id
    evaluate_target_health = false
  }
}
