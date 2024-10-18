# Output لعرض الـ DNS الخاص بـ Internet-facing Load Balancer

output "internet_facing_lb_dns" {
  value = aws_lb.internet_facing_lb.dns_name
    description = "Public IP address of the EC2 instance"
}

-------------------------------

Private Load Balancer Output:


output "private_lb_dns" {
  value = aws_lb.private_lb.dns_name
}


-----------------------------