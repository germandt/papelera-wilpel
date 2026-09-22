# Bucket privado: nadie accede a S3 directamente, solo CloudFront (vía Origin Access Control, más abajo).
# El sufijo con el account id evita colisiones, porque los nombres de bucket son únicos en todo AWS.

resource "aws_s3_bucket" "site" {
  bucket = "${replace(var.site_domain, ".", "-")}-${data.aws_caller_identity.current.account_id}"
}

resource "aws_s3_bucket_public_access_block" "site" {
  bucket = aws_s3_bucket.site.id

  # Los 4 bloqueos quedan activos: la policy de más abajo le da acceso solo a CloudFront
  # (un "Service principal" con una condición de SourceArn), nunca acceso público real,
  # así que S3 no la considera una policy pública y no hace falta aflojar nada acá.
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_ownership_controls" "site" {
  bucket = aws_s3_bucket.site.id
  rule {
    object_ownership = "BucketOwnerEnforced" # deshabilita ACLs, todo se maneja por policy
  }
}

resource "aws_s3_bucket_versioning" "site" {
  bucket = aws_s3_bucket.site.id
  versioning_configuration {
    status = "Enabled" # protege contra un `s3 sync` que borre algo sin querer
  }
}
