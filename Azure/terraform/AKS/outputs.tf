
# output "nginx_lb_ip" {
#   value = module.AKS_ingress.nginx_lb_ip
#   description = "The IP address of the load balancer associated with the Nginx ingress controller."
# }

# output "dns_name_servers" {
#   value = var.create_dns ? module.DNS_zone[0].dns_name_servers : []
#   description = "The list of name servers associated with the DNS zone created."
# }

output "acr_user" {
  value = var.create_acr ? module.create_acr[0].acr_name : ""
  description = "The username for the Azure Container Registry (ACR) created by the module."
}

output "acr_admin_password" {
  value = var.create_acr ? module.create_acr[0].acr_admin_password : ""
  description = "The admin password for the Azure Container Registry (ACR), marked as sensitive."
  sensitive = true
}


output "kubectl_helm_output" {
  value = module.AKS_ingress.invoke_helm_output
  description = "kubectl helm install"
}

output "kubectl_ns_output" {
  value = module.AKS_ingress.invoke_output
  description = "kubectl get ns"
}