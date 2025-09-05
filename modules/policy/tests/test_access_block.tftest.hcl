# test_access_block.tftest.hcl

# Define a mock provider to simulate the AWS resource
mock_provider "aws" {}

# A test block to run an assertion
run "public_access_block_check" {

    variables {
      bucket_name = "mock-bucket-name"
      bucket_arn = "arn:aws:s3:::mock-bucket"
    }

    # Define the module to test, in this case, the root module
    module {
        source = "./."
    }

    # An assertion to check a specific attribute of the resource
    assert {
        condition     = aws_s3_bucket_public_access_block.main.block_public_acls == true
        error_message = "The 'block_public_acls' attribute is not set to true."
    }
}