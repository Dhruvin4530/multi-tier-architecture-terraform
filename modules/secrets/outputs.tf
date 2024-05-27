output "db_password" {
  value = jsondecode(data.aws_secretsmanager_secret_version.secret-version.secret_string)["db_password"]
}