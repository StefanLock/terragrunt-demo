# Terragrunt-demo

This is a basic example of using terragrunt and the a small boilerplate template of how I like to setup up terraform.

This is for demonstration purposes.

_Note: Normally I would have the modules in a terraform registry so that I can pin the module version._

## Context

## Usage
### Pre-reqs
### Deployments

```
cd environments/dev/
terragrunt run-all init
terragrunt run-all plan
terragrunt run-all apply --terragrunt-non-interactive
```

### Tests