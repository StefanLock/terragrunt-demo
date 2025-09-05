# tests/test_bucket.tftest.hcl

# Define a mock provider to simulate AWS resources
mock_provider "aws" {}

# A test block to run the assertions
run "s3_bucket_creation_check" {
  # Provide a mock value for the required variable
  variables {
    bucket_name = "mock-terragrunt-bucket"
  }

  # Define the module to test
  module {
    source = "./."
  }

  # An assertion to verify that the bucket's name is correct
  assert {
    condition     = aws_s3_bucket.main.bucket == "mock-terragrunt-bucket"
    error_message = "The bucket name is not correctly set."
  }

  # An assertion to verify that the tags are applied correctly
  assert {
    condition     = aws_s3_bucket.main.tags.Name == "My terragrunt bucket"
    error_message = "The 'Name' tag is not correctly set."
  }
}