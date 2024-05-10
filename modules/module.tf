variable "my_tag" {
  default = {
    Name = "my-testing-instance"
    disposable = "yes"
  }
}

output "exported_tags" {
  value = var.my_tag
}
