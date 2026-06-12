# Example of importing an existing Resource Group
# The 'id' should be the Azure Resource ID of the existing resource
import {
  to = azurerm_resource_group.imported_rg
  id = "/subscriptions/af71ded2-458b-4260-9071-82709c4c2107/resourceGroups/MyResourceGroupByTerreform"
}

resource "azurerm_resource_group" "imported_rg" {
  name     = var.resource_group_name
  location = var.location
}

# Example of importing a Virtual Network
import {
  to = azurerm_virtual_network.imported_vnet
  id = "/subscriptions/af71ded2-458b-4260-9071-82709c4c2107/resourceGroups/MyResourceGroupByTerreform/providers/Microsoft.Network/virtualNetworks/LeiVnetFromPilot"
}

resource "azurerm_virtual_network" "imported_vnet" {
  name                = "existing-vnet-name"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.imported_rg.location
  resource_group_name = azurerm_resource_group.imported_rg.name
}
