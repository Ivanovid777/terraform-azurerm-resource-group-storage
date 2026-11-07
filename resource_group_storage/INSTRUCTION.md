 # Usage instructions

This repository appears to contain a Terraform component for Azure resource-group storage. The repository contents and Terraform input/output definitions were not included with this request, so the exact module name, required variables, and outputs cannot be verified here. Before applying the examples, inspect the repository's `README.md`, `main.tf`, `variables.tf`, `outputs.tf`, and any `examples/` directory. Use the actual variable and output names defined there.

## Prerequisites

- Install Terraform (or OpenTofu, if the project explicitly supports it) and the Azure CLI.
- Sign in to the intended Azure tenant and subscription, for example with `az login`, then select the subscription with `az account set --subscription <subscription-id>`.
- Ensure the signed-in identity has permissions to create and manage the resources defined by this component.
- Do not commit credentials, client secrets, state files, or plans containing sensitive values.

## Configure a Terraform root module

Use this repository as a module from a separate Terraform root configuration, or follow the repository's own example if one is provided. For a local checkout, the module block has this general form:

```hcl
module "resource_group_storage" {
	source = "../terraform-azurerm-resource_group_storage"

	# Add every required input declared by this module's variables.tf.
	# Use the exact input names and types documented by the repository.
}
```

For a remote source, set `source` to the repository URL and pin a release or commit according to your team's versioning policy. Configure the AzureRM provider in the root module as required by the installed provider version and the module's documentation. Keep environment-specific values in a `.tfvars` file that is excluded from version control, or supply them through an approved secret-management system.

Review the module source before use. Confirm resource names, region and naming constraints, storage account security settings, network exposure, encryption, diagnostic settings, and any resource-group behavior. Do not assume the module creates a resource group unless its implementation or documentation says so.

## Initialize and review

Run these commands from the Terraform root directory (the directory containing the root configuration):

```sh
terraform init
terraform fmt -check -recursive
terraform validate
terraform plan -out=tfplan
```

Review the plan carefully. Verify the target subscription, tenant, region, resource names, network access, and any planned replacements or deletions. If the plan is correct, apply the saved plan:

```sh
terraform apply tfplan
```

Alternatively, run `terraform apply` interactively to review a fresh plan before confirming. Avoid applying from an unreviewed or stale plan.

## Inspect results and make changes

Use `terraform output` to display outputs declared by the root configuration. A module's outputs are accessed through its module address (for example, `module.resource_group_storage.<output_name>`); use only names actually declared in the module's `outputs.tf`. Change configuration inputs and rerun `terraform plan` before applying updates.

Terraform state records managed resource details. Use a protected remote backend with access controls and locking for shared or production deployments. Do not edit state by hand; use Terraform state commands only when necessary and with a backup.

## Remove resources

To remove resources managed by the root configuration, first review the destroy plan:

```sh
terraform plan -destroy
```

If the consequences are understood and the resources are safe to remove, run `terraform destroy` and confirm interactively. Destroying a storage account or resource group may permanently remove data and other resources; back up required data and check dependencies first.
