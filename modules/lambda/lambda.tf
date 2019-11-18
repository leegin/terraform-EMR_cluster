resource "aws_iam_role" "lambda_role" {
  name = "lambda_role"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": [
           "lambda.amazonaws.com",
            "s3.amazonaws.com",
             "elasticmapreduce.amazonaws.com"
         ]
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}


resource "aws_lambda_function" "emr_lambda" {
    function_name = "${var.function_name}"
    handler = "${var.handler}"
    runtime = "${var.runtime}"
    filename = "${var.filename}"
    role = "${aws_iam_role.lambda_role.arn}"
}

resource "aws_lambda_permission" "allow_bucket" {
  statement_id  = "AllowExecutionFromS3Bucket"
  action        = "lambda:InvokeFunction"
  function_name = "${aws_lambda_function.emr_lambda.arn}"
  principal     = "s3.amazonaws.com"
  source_arn    = "${aws_s3_bucket.bucket.arn}"
}

resource "aws_s3_bucket" "bucket" {
  bucket = "${var.bucketname}"
}


resource "aws_s3_bucket_notification" "bucket_notification" {
  bucket = "${aws_s3_bucket.bucket.id}"

  lambda_function {
    lambda_function_arn = "${aws_lambda_function.emr_lambda.arn}"
    events              = ["s3:ObjectCreated:*"]
  }
}
