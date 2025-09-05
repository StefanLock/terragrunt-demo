# Global values for all of my modules.
# Inherited by environments terragrunt files.

locals {
  aws_region        = "eu-west-2"
  state_bucket_name = "terragrunt-slock-demo"
}

# Dynamically generate the state file dependent on which environment/module we are deploying.

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

# Create a provider if not created.

generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite"
  contents = <<EOF
provider "aws" {
  region = "${local.aws_region}"
}
EOF
}