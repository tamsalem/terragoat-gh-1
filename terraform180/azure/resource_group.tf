resource "azurerm_resource_group" "example" {
  name     = "terragoat-${var.environment}"
  location = var.location
  tags = {
    git_commit           = "45609ea68b4439bf7793e38ed1c08b084ec93b8c"
    git_file             = "terraform180/azure/resource_group.tf"
    git_last_modified_at = "2022-04-19 15:25:35"
    git_last_modified_by = "tamsalem@paloaltonetworks.com"
    git_modifiers        = "tamsalem"
    git_org              = "tamsalem"
    git_repo             = "terragoat-gh-1"
    yor_trace            = "80b3b0ca-e0d8-4266-8a1f-12c71afd7e18"
  }
}