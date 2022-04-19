resource "azurerm_key_vault" "example" {
  name                = "terragoat-key-${var.environment}${random_integer.rnd_int.result}"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  tenant_id           = data.azurerm_client_config.current.tenant_id
  sku_name            = "premium"
  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id
    key_permissions = [
      "create",
      "get",
    ]
    secret_permissions = [
      "set",
    ]
  }
  tags = merge({
    environment = var.environment
    terragoat   = true
    }, {
    git_commit           = "45609ea68b4439bf7793e38ed1c08b084ec93b8c"
    git_file             = "terraform157/azure/key_vault.tf"
    git_last_modified_at = "2022-04-19 15:25:35"
    git_last_modified_by = "tamsalem@paloaltonetworks.com"
    git_modifiers        = "tamsalem"
    git_org              = "tamsalem"
    git_repo             = "terragoat-gh-1"
    yor_trace            = "79afeacc-248a-4015-a4fa-76a6a57f06e2"
  })
}

resource "azurerm_key_vault_key" "generated" {
  name         = "terragoat-generated-certificate-${var.environment}"
  key_vault_id = azurerm_key_vault.example.id
  key_type     = "RSA"
  key_size     = 2048
  key_opts = [
    "decrypt",
    "encrypt",
    "sign",
    "unwrapKey",
    "verify",
    "wrapKey",
  ]
  tags = {
    git_commit           = "45609ea68b4439bf7793e38ed1c08b084ec93b8c"
    git_file             = "terraform157/azure/key_vault.tf"
    git_last_modified_at = "2022-04-19 15:25:35"
    git_last_modified_by = "tamsalem@paloaltonetworks.com"
    git_modifiers        = "tamsalem"
    git_org              = "tamsalem"
    git_repo             = "terragoat-gh-1"
    yor_trace            = "afbc6e13-63d9-4e6c-8914-d58b7744b5dd"
  }
}

resource "azurerm_key_vault_secret" "secret" {
  key_vault_id = azurerm_key_vault.example.id
  name         = "terragoat-secret-${var.environment}"
  value        = random_string.password.result
  tags = {
    git_commit           = "45609ea68b4439bf7793e38ed1c08b084ec93b8c"
    git_file             = "terraform157/azure/key_vault.tf"
    git_last_modified_at = "2022-04-19 15:25:35"
    git_last_modified_by = "tamsalem@paloaltonetworks.com"
    git_modifiers        = "tamsalem"
    git_org              = "tamsalem"
    git_repo             = "terragoat-gh-1"
    yor_trace            = "40517524-f05d-485b-bfbe-3fa0dbee511e"
  }
}