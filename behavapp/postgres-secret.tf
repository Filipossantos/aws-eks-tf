resource "kubernetes_secret" "psql_pass" {
  metadata {
    name      = "psql-pass"
    namespace = "default"
  }

  data = {
    password = "cGFzc3dvcmQK"
  }

  type = "Opaque"
}
