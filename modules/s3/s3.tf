resource "aws_s3_bucket" "s3_logs_bucket" {
  bucket = "${var.cluster_name}-s3logs"
  acl    = "log-delivery-write"

  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}


resource "aws_s3_bucket" "bucket" {
  bucket = "${var.logging_bucket}"
  region = "${var.region}"
  acl    = "private"
  
  logging {
    target_bucket = "${aws_s3_bucket.s3_logs_bucket.id}"
  }

  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

