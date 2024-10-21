provider "github" {
  alias = "pallavi895"
  owner = "pallavi895"
  app_auth {
    id              = "885017"
    pem_file        = var.github_app_pem
    installation_id = "50052583"
  }
}


resource "tls_private_key" "root_ca_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}


resource "tls_self_signed_cert" "root_ca" {
  private_key_pem   = tls_private_key.root_ca_key.private_key_pem
  is_ca_certificate = true
 
  subject {
    common_name         = "multicluster.istio.io"
  }
 
  validity_period_hours = 87600
 
  allowed_uses = [
    "cert_signing",
    "crl_signing",
    "code_signing",
    "server_auth",
    "client_auth",
    "digital_signature",
    "key_encipherment",
  ]
}


/*data "github_repository" "main" {
  full_name = "mcdevops-org/terraform-aws-module-eks"
}*/



data "github_actions_public_key" "repo_public_key" {
  repository = "terraform-aws-module-eks"
  provider   = github.mcdevops-org
}


# Store Root CA Private Key as a Secret in GitHub Actions
resource "github_actions_secret" "root_ca_private_key" {
  repository       = "terraform-aws-module-eks"
  secret_name      = var.rt_ca_key
  plaintext_value  = tls_private_key.root_ca_key.private_key_pem
  provider   = github.mcdevops-org
}

