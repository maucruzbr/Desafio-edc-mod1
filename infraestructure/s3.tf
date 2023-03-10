resource "aws_s3_bucket" "edc-datalake-desafio-mod1" {
  bucket = "edc-datalake-desafio-mod1"
  tags = {
    IES = "IGTI"
    CURSO = "EDC"

  }
}

resource "aws_s3_bucket_acl" "datalake_bucket_acl" {
  bucket = aws_s3_bucket.edc-datalake-desafio-mod1.id
  acl    = "private"
}


resource "aws_s3_bucket_server_side_encryption_configuration" "datalake_sse" {
  bucket = aws_s3_bucket.edc-datalake-desafio-mod1.bucket

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = "AES256"
    }
    bucket_key_enabled = true
  }
}

resource "aws_s3_bucket_public_access_block" "bucket_public_access_block" {
  bucket = aws_s3_bucket.edc-datalake-desafio-mod1.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true

  depends_on = [
    aws_s3_bucket.edc-datalake-desafio-mod1
  ]
}