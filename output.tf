output "ip_adress" {
  value = aws_ip.ip.public_ip[count.index]
}
