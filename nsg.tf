resource "azurerm_network_security_group" "nsg" {
  for_each = var.nsg
  name = each.value.name
  location = each.value.location
  resource_group_name = azurerm_resource_group.nimbu1[each.value.resource_group_name].name
}
resource "azurerm_subnet_network_security_group_association" "asso1" {
  for_each = var.nsgasso
  subnet_id = azurerm_subnet.sb1[each.value.subnet_id].id
    network_security_group_id = azurerm_network_security_group.nsg[each.value.network_security_group_id].id
}
resource "azurerm_network_security_group" "nsg1" {
  for_each = var.nsg1
  name = each.value.name
  location = each.value.location
  resource_group_name = azurerm_resource_group.nimbu1[each.value.resource_group_name].name
}
resource "azurerm_subnet_network_security_group_association" "asso2" {
  for_each = var.nsgasso2
  subnet_id = azurerm_subnet.sb2[each.value.subnet_id].id
network_security_group_id = azurerm_network_security_group.nsg1[each.value.network_security_group_id].id
}



