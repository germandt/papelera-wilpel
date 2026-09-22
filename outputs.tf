output "cloudfront_domain_name" {
  description = "URL donde queda publicado el sitio hasta que se sume el dominio propio."
  value       = "https://${aws_cloudfront_distribution.site.domain_name}"
}

output "cloudfront_distribution_id" {
  description = "Id de la distribution, necesario para invalidar caché después de cada actualización del sitio."
  value       = aws_cloudfront_distribution.site.id
}

output "s3_bucket_name" {
  description = "Bucket donde se suben los archivos del sitio (aws s3 sync)."
  value       = aws_s3_bucket.site.bucket
}

output "route53_nameservers" {
  description = "Nameservers a configurar como delegación del dominio en NIC.ar."
  value       = aws_route53_zone.site.name_servers
}

output "site_url" {
  description = "URL final del sitio con dominio propio, una vez que el certificado valide."
  value       = "https://${var.site_domain}"
}

output "github_actions_deploy_role_arn" {
  description = "Rol que asume GitHub Actions para desplegar. Se carga en el repo como variable AWS_DEPLOY_ROLE_ARN."
  value       = aws_iam_role.github_actions_deploy.arn
}
