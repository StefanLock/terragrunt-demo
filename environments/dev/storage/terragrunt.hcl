include {
  path = find_in_parent_folders("root.hcl")
}

include "dev_vars" {
    path = "../dev.hcl"
    expose = true
}

terraform {
  source = "../../../modules/storage"
}

inputs = {
  bucket_name = include.dev_vars.locals.bucket_name
}