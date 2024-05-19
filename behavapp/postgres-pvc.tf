resource "kubernetes_persistent_volume_claim" "psql_pv_claim" {
  metadata {
    name = "psql-pv-claim"
    labels = {
      app = "postgres"
    }
  }

  spec {
    storage_class_name = "manual"
    access_modes       = ["ReadWriteOnce"]
    resources {
      requests = {
        storage = "1Gi"
      }
    }
  }
}
