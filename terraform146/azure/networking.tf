resource "azurerm_virtual_network" "example" {
  name                = "terragoat-vn-${var.environment}"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  tags = {
    git_commit           = "45609ea68b4439bf7793e38ed1c08b084ec93b8c"
    git_file             = "terraform146/azure/networking.tf"
    git_last_modified_at = "2022-04-19 15:25:35"
    git_last_modified_by = "tamsalem@paloaltonetworks.com"
    git_modifiers        = "tamsalem"
    git_org              = "tamsalem"
    git_repo             = "terragoat-gh-1"
    yor_trace            = "eb19f165-9c21-4a7a-96e5-5bb557a38228"
  }
}

resource "azurerm_subnet" "example" {
  name                 = "terragoat-${var.environment}"
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = ["10.0.0.0/24"]
}

resource "azurerm_network_interface" "ni_linux" {
  name                = "terragoat-linux-${var.environment}"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.example.id
    private_ip_address_allocation = "Dynamic"
  }
  tags = {
    git_commit           = "45609ea68b4439bf7793e38ed1c08b084ec93b8c"
    git_file             = "terraform146/azure/networking.tf"
    git_last_modified_at = "2022-04-19 15:25:35"
    git_last_modified_by = "tamsalem@paloaltonetworks.com"
    git_modifiers        = "tamsalem"
    git_org              = "tamsalem"
    git_repo             = "terragoat-gh-1"
    yor_trace            = "2647f099-dff8-4514-8cef-96159380c02a"
  }
}

resource "azurerm_network_interface" "ni_win" {
  name                = "terragoat-win-${var.environment}"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.example.id
    private_ip_address_allocation = "Dynamic"
  }
  tags = {
    git_commit           = "45609ea68b4439bf7793e38ed1c08b084ec93b8c"
    git_file             = "terraform146/azure/networking.tf"
    git_last_modified_at = "2022-04-19 15:25:35"
    git_last_modified_by = "tamsalem@paloaltonetworks.com"
    git_modifiers        = "tamsalem"
    git_org              = "tamsalem"
    git_repo             = "terragoat-gh-1"
    yor_trace            = "2b5dbf28-04fb-4151-a637-a731bbe7ed1d"
  }
}

resource azurerm_network_security_group "bad_sg" {
  location            = var.location
  name                = "terragoat-${var.environment}"
  resource_group_name = azurerm_resource_group.example.name

  security_rule {
    access                     = "Allow"
    direction                  = "Inbound"
    name                       = "AllowSSH"
    priority                   = 200
    protocol                   = "TCP"
    source_address_prefix      = "*"
    source_port_range          = "*"
    destination_port_range     = "22-22"
    destination_address_prefix = "*"
  }

  security_rule {
    access                     = "Allow"
    direction                  = "Inbound"
    name                       = "AllowRDP"
    priority                   = 300
    protocol                   = "TCP"
    source_address_prefix      = "*"
    source_port_range          = "*"
    destination_port_range     = "3389-3389"
    destination_address_prefix = "*"
  }
  tags = {
    git_commit           = "45609ea68b4439bf7793e38ed1c08b084ec93b8c"
    git_file             = "terraform146/azure/networking.tf"
    git_last_modified_at = "2022-04-19 15:25:35"
    git_last_modified_by = "tamsalem@paloaltonetworks.com"
    git_modifiers        = "tamsalem"
    git_org              = "tamsalem"
    git_repo             = "terragoat-gh-1"
    yor_trace            = "1a591ba4-d969-4572-9704-87b5c55c0ba3"
  }
}

resource azurerm_network_watcher "network_watcher" {
  location            = var.location
  name                = "terragoat-network-watcher-${var.environment}"
  resource_group_name = azurerm_resource_group.example.name
  tags = {
    git_commit           = "45609ea68b4439bf7793e38ed1c08b084ec93b8c"
    git_file             = "terraform146/azure/networking.tf"
    git_last_modified_at = "2022-04-19 15:25:35"
    git_last_modified_by = "tamsalem@paloaltonetworks.com"
    git_modifiers        = "tamsalem"
    git_org              = "tamsalem"
    git_repo             = "terragoat-gh-1"
    yor_trace            = "3da368fc-723f-43d2-8e82-08dcc91e5094"
  }
}

resource azurerm_network_watcher_flow_log "flow_log" {
  enabled                   = false
  network_security_group_id = azurerm_network_security_group.bad_sg.id
  network_watcher_name      = azurerm_network_watcher.network_watcher.name
  resource_group_name       = azurerm_resource_group.example.name
  storage_account_id        = azurerm_storage_account.example.id
  retention_policy {
    enabled = false
    days    = 10
  }
  tags = {
    git_commit           = "45609ea68b4439bf7793e38ed1c08b084ec93b8c"
    git_file             = "terraform146/azure/networking.tf"
    git_last_modified_at = "2022-04-19 15:25:35"
    git_last_modified_by = "tamsalem@paloaltonetworks.com"
    git_modifiers        = "tamsalem"
    git_org              = "tamsalem"
    git_repo             = "terragoat-gh-1"
    yor_trace            = "33a7212e-7f1a-49fc-af73-8e525c5546ec"
  }
}