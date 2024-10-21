/*output "intermediate_ca_key_1" {
  description = "The private key for the intermediate CA"
  value       = tls_private_key.intermediate_ca_key_1.private_key_pem
   sensitive = true
}

output "intermediate_ca_csr_1" {
  description = "The Certificate Signing Request (CSR) for the intermediate CA"
  value       = tls_cert_request.intermediate_ca_csr_1.cert_request_pem
}

output "intermediate_ca_cert_1" {
  description = "The locally signed certificate for the intermediate CA"
  value       = tls_locally_signed_cert.intermediate_ca_cert_1.cert_pem
}*/



