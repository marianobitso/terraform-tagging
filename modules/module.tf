variable "my_tag" {
  default = "example-tag"
}

output "exported_tag" {
  value = var.my_tag
}
