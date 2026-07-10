resource "random_password" "password_value" {
  length           = 16
  special          = true
  override_special = "_%@"
}
