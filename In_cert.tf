

/*variable "root_ca_private_key" {
  type      = string
  sensitive = true
}*/


resource "tls_private_key" "intermediate_ca_key_1" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "tls_cert_request" "intermediate_ca_csr_1" {
  private_key_pem = tls_private_key.intermediate_ca_key_1.private_key_pem

  subject {
    common_name  = "intermediate.multicluster.istio.io"
  }
}

resource "tls_locally_signed_cert" "intermediate_ca_cert_1" {
  cert_request_pem = tls_cert_request.intermediate_ca_csr_1.cert_request_pem
  ca_private_key_pem = tls_private_key.root_ca_key.private_key_pem
  ca_cert_pem = tls_self_signed_cert.root_ca.cert_pem

  validity_period_hours = 87600
  is_ca_certificate     = true

  allowed_uses = [
    "key_encipherment",
    "digital_signature",
    "server_auth",
    "client_auth",
    "cert_signing",
  ]
 depends_on = [tls_private_key.root_ca_key, tls_self_signed_cert.root_ca]
}
