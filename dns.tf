# Hosted zone en Route53 para wilpel.com.ar. NIC.ar no permite editar registros DNS directamente:
# solo delegar a otro proveedor. Route53 es ese proveedor, y además permite el registro ALIAS
# que necesita un dominio raíz (sin "www") para apuntar a CloudFront (un CNAME normal no se puede
# usar en la raíz del dominio, por spec de DNS).

resource "aws_route53_zone" "site" {
  name    = var.site_domain
  comment = "Wilpel Papelera"
}
