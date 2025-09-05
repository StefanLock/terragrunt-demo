locals {
  aws_region        = "eu-west-2"
  state_bucket_name = "terragrunt-slock-demo"
}

remote_state {
  backend = "s3"
  config = {
    bucket = local.state_bucket_name
    key    = "${path_relative_to_include()}/terraform.tfstate"
    region = local.aws_region
    encrypt = true
  }
  generate = {
    path = "backend.tf"
    if_exists = "overwrite"
  }
}

generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite"
  contents = <<EOF
provider "aws" {
  region = "${local.aws_region}"
}
EOF
}