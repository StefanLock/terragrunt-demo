include {
  path = find_in_parent_folders("root.hcl")
}

include "dev_vars" {
    path = "../dev.hcl"
    expose = true
}

dependency "storage" {
  config_path = "../storage"

  mock_outputs = {
    bucket_name = "dependency_mock_bucket_name"
    bucket_arn = "dependency_mock_bucket_arn"
  }
}

terraform {
  source = "../../../modules/policy"
}

inputs = {
  bucket_name = dependency.storage.outputs.bucket_name
  bucket_arn  = dependency.storage.outputs.bucket_arn
}