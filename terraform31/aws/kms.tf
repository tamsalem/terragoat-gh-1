resource "aws_kms_key" "logs_key" {
  # key does not have rotation enabled
  description = "${local.resource_prefix.value}-logs bucket key"

  deletion_window_in_days = 7
  tags = {
    git_commit           = "45609ea68b4439bf7793e38ed1c08b084ec93b8c"
    git_file             = "terraform31/aws/kms.tf"
    git_last_modified_at = "2022-04-19 15:25:35"
    git_last_modified_by = "tamsalem@paloaltonetworks.com"
    git_modifiers        = "tamsalem"
    git_org              = "tamsalem"
    git_repo             = "terragoat-gh-1"
    yor_trace            = "cd8fa2a7-4868-4cd1-993d-da4644808ce5"
  }
}

resource "aws_kms_alias" "logs_key_alias" {
  name          = "alias/${local.resource_prefix.value}-logs-bucket-key"
  target_key_id = "${aws_kms_key.logs_key.key_id}"
}
