# Grabs to root hcl file to get provider and backend information.
include {
  path = find_in_parent_folders("root.hcl")
}

# Grab the dev specific common variables.
include "dev_vars" {
    path = "../dev.hcl"
    expose = true
}

# Defines a dependency as we need to know the bucket name to apply the policy.
dependency "storage" {
  config_path = "../storage"
  
  # We need to mock outputs as this can be nothing if upstream isn't deployed. This is only for the plan command.
  mock_outputs = {
    bucket_name = "dependency_mock_bucket_name"
    bucket_arn = "dependency_mock_bucket_arn"
  }
}

# Where is the module found for this resource.
terraform {
  source = "../../../modules/policy"
}

# Pass variables to our modules.
inputs = {
  bucket_name = dependency.storage.outputs.bucket_name
  bucket_arn  = dependency.storage.outputs.bucket_arn
}