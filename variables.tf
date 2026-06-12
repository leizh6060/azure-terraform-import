variable "resource_group_name" {
  description = "Name of the existing resource group to import"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "East US"
}
