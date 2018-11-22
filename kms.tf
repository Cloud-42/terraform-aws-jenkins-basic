# -------------------------------------------------------
# Create KMS key to avoid using default key
# -------------------------------------------------------

resource "aws_kms_key" "key" {
  description             = "This key is used to encrypt the Jenkins ${var.environment} data s3 bucket"
  deletion_window_in_days = 30
}

# -------------------------------------------------------
# Create KMS Alias
# -------------------------------------------------------

resource "aws_kms_alias" "a" {
  name          = "alias/jenkins-${var.environment}-data"
  target_key_id = "${aws_kms_key.key.key_id}"
}
