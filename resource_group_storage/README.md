 # Terraform Azure Resource Group and Storage

Terraform module for managing Azure resource-group and storage resources.

## Requirements

- Terraform (version required by the module)
- An AzureRM provider configuration with permissions to create and manage the resources

## Usage

Reference this module from your Terraform configuration and set the input variables declared by the module:

```hcl
module "resource_group_storage" {
	source = "<module source>"

	# Set the required inputs declared in variables.tf.
}
```

Configure the `azurerm` provider in the calling configuration. See the module's variable declarations for supported inputs and required values, and its output declarations for values made available to callers.

## Inputs and outputs

The supported inputs and outputs are defined by the module's Terraform files. Refer to those declarations for names, types, defaults, and descriptions.
