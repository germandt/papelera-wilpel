# Certificado para wilpel.com.ar y www.wilpel.com.ar. CloudFront exige que el certificado
# viva en us-east-1 sin importar en qué región esté el resto de la infra — coincide con
# la región que ya usa este proyecto, así que no hace falta un provider aparte.

resource "aws_acm_certificate" "site" {
  domain_name               = var.site_domain
  subject_alternative_names = ["www.${var.site_domain}"]
  validation_method         = "DNS"

  lifecycle {
    create_before_destroy = true
  }
}

# Registro DNS que ACM pide para probar que somos dueños del dominio. Se crea solo,
# automáticamente, en la misma hosted zone — no requiere ningún paso manual en NIC.ar.
resource "aws_route53_record" "acm_validation" {
  for_each = {
    for dvo in aws_acm_certificate.site.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  zone_id         = aws_route53_zone.site.zone_id
  name            = each.value.name
  type            = each.value.type
  records         = [each.value.record]
  ttl             = 60
  allow_overwrite = true
}

# Espera a que ACM confirme la validación antes de seguir. Solo se resuelve una vez que la
# delegación del dominio ya propagó (si no, el registro de validación no es visible públicamente).
resource "aws_acm_certificate_validation" "site" {
  certificate_arn         = aws_acm_certificate.site.arn
  validation_record_fqdns = [for r in aws_route53_record.acm_validation : r.fqdn]
}
