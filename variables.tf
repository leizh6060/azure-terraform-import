variable "subscription_id" {
  description = "Azure Subscription ID"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the existing resource group to import"
  type        = string
}

variable "vnet_name" {
  description = "Name of the existing Virtual Network to import"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "East US"
}
