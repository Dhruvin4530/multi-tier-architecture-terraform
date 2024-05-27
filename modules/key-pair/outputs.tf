# Key Pair ID
output "id" {
  value = data.aws_key_pair.demo-key.key_name
}