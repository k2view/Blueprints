# output "ingress_test_url" {
#   value = "https://ingress-test.${var.domain}"
#   description = "The URL of the test ingress to validate successful deployment."
# }

# output "nginx_lb_ip" {
#   value = data.kubernetes_service.nginx_controller_svc.status.0.load_balancer.0.ingress.0.ip
#   description = "The IP address of the load balancer for the Nginx ingress controller."
# }
