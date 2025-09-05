# Grabs to root hcl file to get provider and backend information.
include {
  path = find_in_parent_folders("root.hcl")
}

# Grab the dev specific common variables.
include "dev_vars" {
    path = "../dev.hcl"
    expose = true
}

# Where is the module found for this resource.
terraform {
  source = "../../../modules/storage"
}

# Pass variables to our modules.
inputs = {
  bucket_name = include.dev_vars.locals.bucket_name
}