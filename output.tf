output "lb_dns_name" {
description ="The DNS Name of the Load Balancer"
value="${aws_lb.external_alb.dns_name}"
}
