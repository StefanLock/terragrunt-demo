# Terragrunt-demo

This is a basic example of using terragrunt and the a small boilerplate template of how I like to setup up terraform.

This is for demonstration purposes.

_Note: Normally I would have the modules in a terraform registry so that I can pin the module version._

## Context

## Usage
### Pre-reqs
1. You must have an S3 bucket already created to store your state files.
### Deployments
#### Apply all
```
cd environments/dev/
terragrunt plan --all
terragrunt apply --all
```
#### Apply specific module
```
cd environments/dev/storage
terragrunt plan
terragrunt apply
```
### Mock Dependencies
Terragrunt has the ability to define dependencies using a dependency block.
```
dependency "storage" {
  config_path = "../storage"

  mock_outputs = {
    bucket_name = "dependency_mock_bucket_name"
    bucket_arn = "dependency_mock_bucket_arn"
  }
}
```
We must mock some of the output from the storage module because if that module isn't deployed then output returns nothing. This causes the plan to fail.
Mock stops this behaviour and isn't actioned during the `apply` command.

### Tests

There are some very simple tests that are just representative of what I like to add when able.

```
cd modules/storage
terraform init
terraform test
```
