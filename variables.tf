
variable "rt_ca_key" {
  description = "The name of the secret"
  type        = string
  default     = "ROOT_CA_PRIVATE_KEY"
}


variable "root_ca_private_key" {
  description = "The name of the secret"
  type        = string
  sensitive = true
}



variable "github_app_pem" {
  type      = string
  nullable  = false
  sensitive = true
}




