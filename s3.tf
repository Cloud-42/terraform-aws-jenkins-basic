#--------------------------------------------------------------------
# S3 bucket
#--------------------------------------------------------------------

resource "aws_s3_bucket" "s3" {
  acl = "private"

  tags {
    Name          = "${var.environment}-jenkins-data"
    Environment   = "${var.environment}"
    Orchestration = "${var.orchestration}"
  }

  #
  # s3 encryption setup
  #

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = "${aws_kms_key.key.arn}"
        sse_algorithm     = "aws:kms"
      }
    }
  }

  # Enable versioning

  versioning {
    enabled = true
  }
}
