variable "cluster_id" {
  type = string
  description = "cluster id of aks"

  default = ""
}
variable "cloud_provider" {
  type        = string
  description = "The name of the cloud provider."
  default     = ""
}

variable "domain" {
  type        = string
  description = "the domain will be used for ingress"
}

# SSL cert
variable "keyPath" {
  type        = string
  description = "Path to the TLS key file."
  default = ""
}

variable "certPath" {
  type        = string
  description = "Path to the TLS cert file."
  default = ""
}

variable "keyString" {
  type        = string
  description = "The TLS key as a string."
  default = ""
}

variable "certString" {
  type        = string
  description = "The TLS cert as a string."
  default = ""
}

variable "keyb64String" {
  type        = string
  description = "The TLS key string in base 64."
  default = ""
}

variable "certb64String" {
  type        = string
  description = "The TLS cert string in base 64."
  default = ""
}

variable "delay_command" {
  type        = string
  description = "The command for delay, the cammand depend on the env the terraform runed on."
  default     = "sleep 60" #"sleep 60" for linux, for windows is "powershell -Command Start-Sleep -Seconds 60"
}

variable "cluster_name" {
  type        = string
  description = "AKS name in Azure"
}

variable "resource_group_name" {
  type        = string
  description = "RG name in Azure"
}