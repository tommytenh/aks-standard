resource "azurerm_resource_group" "rg" {
  name     = "rg-test-terraform"
  location = "uksouth"
}

module "vnet" {
  source  = "Azure/vnet/azurerm"
  version = "4.1.0"

  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  address_space       = ["10.0.0.0/16"]
  subnet_prefixes     = ["10.0.0.0/24", "10.0.1.0/24"]
  subnet_names        = ["aks-subnet", "app-gateway-subnet"]
  subnet_ids          = []
  dns_servers         = []
}