# Example of importing an existing Resource Group
# The 'id' should be the Azure Resource ID of the existing resource
import {
  to = azurerm_resource_group.imported_rg
  id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/existing-rg-name"
}

resource "azurerm_resource_group" "imported_rg" {
  name     = "existing-rg-name"
  location = var.location
}

# Example of importing a Virtual Network
import {
  to = azurerm_virtual_network.imported_vnet
  id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/existing-rg-name/providers/Microsoft.Network/virtualNetworks/existing-vnet-name"
}

resource "azurerm_virtual_network" "imported_vnet" {
  name                = "existing-vnet-name"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.imported_rg.location
  resource_group_name = azurerm_resource_group.imported_rg.name
}
