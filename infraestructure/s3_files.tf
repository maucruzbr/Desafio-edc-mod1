resource "aws_s3_object" "delta_insert" {
  bucket = aws_s3_bucket.edc-datalake-desafio-mod1.id
  key = "emr-code/pyspark/01_delta_spark_insert.py"
  acl = "private"
  source = "../etl/01_delta_spark_insert.py"
  etag = filemd5("../etl/01_delta_spark_insert.py")
}

resource "aws_s3_object" "delta_upsert" {
  bucket = aws_s3_bucket.edc-datalake-desafio-mod1.id
  key = "emr-code/pyspark/02_delta_spark_upsert.py"
  acl = "private"
  source = "../etl/02_delta_spark_upsert.py"
  etag = filemd5("../etl/02_delta_spark_upsert.py")
}
