variable "resource_group_name" {
  description = "Name of the existing resource group to import"
  type        = string
  default     = "existing-rg-name"
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "East US"
}
