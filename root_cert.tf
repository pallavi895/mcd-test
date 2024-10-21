

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

resource "github_actions_variable" "example_variable" {
  repository       =  = "mcd-test"
  variable_name    == var.rt_ca_key
  value            = tls_private_key.root_ca_key.private_key_pem
}




# Store Root CA Private Key as a Secret in GitHub Actions
/*resource "github_actions_secret" "root_ca_private_key" {
  repository       = "mcd-test"
  secret_name      = var.rt_ca_key
  plaintext_value  = tls_private_key.root_ca_key.private_key_pem
  provider   = github.mcdevops-org
}*/

