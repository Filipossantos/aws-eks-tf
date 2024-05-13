resource "kubernetes_secret" "postgresql_secret" {
  metadata {
    name = "postgresql-secret"
  }

  data = {
    postgres_password = "cGFzc3dvcmQK"
  }
}
