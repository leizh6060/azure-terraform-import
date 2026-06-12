# Import existing Resource Group
import {
  to = azurerm_resource_group.imported_rg
  id = "/subscriptions/${var.subscription_id}/resourceGroups/${var.resource_group_name}"
}

resource "azurerm_resource_group" "imported_rg" {
  name     = var.resource_group_name
  location = var.location
}

# Import existing Virtual Network
import {
  to = azurerm_virtual_network.imported_vnet
  id = "/subscriptions/${var.subscription_id}/resourceGroups/${var.resource_group_name}/providers/Microsoft.Network/virtualNetworks/${var.vnet_name}"
}

resource "azurerm_virtual_network" "imported_vnet" {
  name                = var.vnet_name
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.imported_rg.location
  resource_group_name = azurerm_resource_group.imported_rg.name
}
