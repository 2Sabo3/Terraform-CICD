output "subnet" {
  value = aws_subnet.subnet.id
}

output "security_group" {
  value = aws_security_group.sg.id
}