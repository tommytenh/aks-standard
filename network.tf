resource "azurerm_resource_group" "rg" {
  location = "uksouth"
  name     = "rg-test-terraform"
}

module "vnet" {
    source  = "registry.terraform.ioAzure/vnet/azurerm"
    version = "4.1.0"
    resource_group_name = azurerm_resource_group.rg.name
    location            = azurerm_resource_group.rg.location
    address_space       = ["10.0.0.0/24"]
    subnet_prefixes     = ["10.0.1.0/24", 10.0.2.0/24]
    subnet_names        = ["aks-subnet", "app-gateway-subnet"]
    subnet_ids          = []
    dns_servers         = []

}