output "bucket_arn" {
  description = "The ARN of the created S3 bucket."
  value       = aws_s3_bucket.main.arn
}

output "bucket_name" {
  description = "The name of the bucket created."
  value = aws_s3_bucket.main.id
}