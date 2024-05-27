data "aws_secretsmanager_secret" "db-password" {
  name = "db_password"
}

data "aws_secretsmanager_secret_version" "secret-version" {
  secret_id = data.aws_secretsmanager_secret.db-password.id
}