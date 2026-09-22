variable "aws_region" {
  description = "Región de AWS para los recursos (el bucket S3 vive acá; CloudFront es global)."
  type        = string
  default     = "us-east-1"
}

variable "site_domain" {
  description = "Dominio del sitio. Se usa como base del nombre del bucket. Sin certificado propio todavía: se accede por la URL de CloudFront hasta sumar el dominio."
  type        = string
  default     = "wilpel.com.ar"
}

variable "price_class" {
  description = "Cobertura de edge locations de CloudFront. PriceClass_All incluye Sudamérica, importante porque el público es de Argentina."
  type        = string
  default     = "PriceClass_All"
}

variable "budget_alert_email" {
  description = "Mail al que AWS Budgets avisa cuando el gasto se acerca al límite mensual."
  type        = string
  # Sin default a propósito: se define en terraform.tfvars (gitignored), no se hardcodea acá.
}

variable "github_repo" {
  description = "Repo de GitHub (owner/name) autorizado a asumir el rol de deploy vía OIDC."
  type        = string
  default     = "germandt/papelera-wilpel"
}
