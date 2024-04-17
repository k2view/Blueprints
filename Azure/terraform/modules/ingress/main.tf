terraform {
  required_providers {
    azureakscommand = {
      source = "jkroepke/azureakscommand"
      version = "1.2.0"
    }
  }
}

resource "azureakscommand_invoke" "ingress-controller-invoke" {
  resource_group_name = "${var.resource_group_name}"
  name                = "${var.cluster_name}"

  command = "helm upgrade --install ingress-nginx-controller . --set provider=azure,domain=${var.domain},tlsSecret.enabled=true,tlsSecret.default_ssl_certificate=true,tlsSecret.keyPath=${var.keyPath},tlsSecret.certPath=${var.certPath},tlsSecret.key=${var.keyString},tlsSecret.cert=${var.certString},tlsSecret.key_b64=${var.keyb64String},tlsSecret.cert_b64=${var.certb64String}"

  # Re-run command, if cluster gets recreated.
  triggers = {
    id = var.cluster_id
  }

  context = filebase64("../../helm/charts/ingress-nginx-k2v.zip")
}

resource "azureakscommand_invoke" "example" {
  resource_group_name = "${var.resource_group_name}"
  name                = "${var.cluster_name}"

  command = "kubectl get ns"

}

output "invoke_output" {
  value = azureakscommand_invoke.example.output
}

output "invoke_helm_output" {
  value = azureakscommand_invoke.ingress-controller-invoke.output
}

# The ingress controller will create LB, it can take some time to get it ready and get the IP
resource "null_resource" "delay" {
  depends_on = [ azureakscommand_invoke.ingress-controller-invoke ]

  provisioner "local-exec" {
    command = "${var.delay_command}"  // Waits for 60 seconds
  }
}

# # The IP of the service will be the IP of the LB 
# data "kubernetes_service" "nginx_controller_svc" {
#   depends_on = [null_resource.delay]
#   metadata {
#     name      = "ingress-nginx-controller"
#     namespace = "ingress-nginx"
#   }
# }
