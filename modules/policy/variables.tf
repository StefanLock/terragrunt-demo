variable "bucket_name" {
  description = "The name of the bucket to apply the policy to."
  type        = string
}

variable "bucket_arn" {
  description = "The ARN of the bucket to grant access to."
  type        = string
}