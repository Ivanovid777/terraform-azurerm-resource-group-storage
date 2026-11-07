variable "resource_group_location" {
  description = "The location of the resource group"
  type        = string
  default     = "East US"

}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
  default     = "module-resource-group"

}

variable "storage_account_name" {
  description = "The name of the storage account"
  type        = string
  default     = "modulestorageacct"

}

