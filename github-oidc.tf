# Permite que GitHub Actions despliegue el sitio sin que ningún secreto de AWS viaje ni se guarde
# en ningún lado: el workflow le pide a AWS un rol temporal, y AWS confía en el token porque viene
# firmado por GitHub. Solo funciona desde pushes a main de este repo puntual.
#
# El thumbprint NO se calcula dinámicamente (vía `tls_certificate`, consultando el certificado en
# vivo): en este entorno el tráfico HTTPS saliente parece estar interceptado, así que la cadena de
# certificados que se ve acá no es la real de GitHub. Se usa el thumbprint oficial y documentado por
# AWS/GitHub para este proveedor (además, AWS valida los proveedores conocidos como este contra su
# propio almacén de CAs de confianza, no solo contra este valor — pero se deja el correcto igual).

resource "aws_iam_openid_connect_provider" "github_actions" {
  url             = "https://token.actions.githubusercontent.com"
  client_id_list  = ["sts.amazonaws.com"]
  thumbprint_list = ["6938fd4d98bab03faadb97b34396831e3780aea1"]
}

resource "aws_iam_role" "github_actions_deploy" {
  name = "wilpel-github-actions-deploy"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Principal = { Federated = aws_iam_openid_connect_provider.github_actions.arn }
        Action    = "sts:AssumeRoleWithWebIdentity"
        Condition = {
          StringEquals = {
            "token.actions.githubusercontent.com:aud" = "sts.amazonaws.com"
          }
          # Solo pushes a la rama main de este repo. Ni otras ramas, ni forks, ni pull_request.
          # GitHub suma el id numérico estable de cuenta y de repo al claim `sub`
          # (repo:owner@ACCOUNT_ID/repo@REPO_ID:ref:...), por eso los wildcards después de cada @.
          StringLike = {
            "token.actions.githubusercontent.com:sub" = "repo:${split("/", var.github_repo)[0]}@*/${split("/", var.github_repo)[1]}@*:ref:refs/heads/main"
          }
        }
      }
    ]
  })
}

# Permisos acotados a lo que el deploy necesita: nada de PowerUserAccess.
resource "aws_iam_role_policy" "github_actions_deploy" {
  name = "deploy-site"
  role = aws_iam_role.github_actions_deploy.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "S3Site"
        Effect = "Allow"
        Action = ["s3:PutObject", "s3:GetObject", "s3:DeleteObject", "s3:ListBucket"]
        Resource = [
          aws_s3_bucket.site.arn,
          "${aws_s3_bucket.site.arn}/*",
        ]
      },
      {
        Sid      = "CloudFrontInvalidation"
        Effect   = "Allow"
        Action   = "cloudfront:CreateInvalidation"
        Resource = aws_cloudfront_distribution.site.arn
      }
    ]
  })
}
