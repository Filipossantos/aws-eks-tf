resource "kubernetes_persistent_volume_claim" "postgresql_data" {
  metadata {
    name = "postgresql-data"
  }

  spec {
    access_modes = ["ReadWriteOnce"]
    storage_class_name = kubernetes_storage_class.aws_ebs_sc.metadata[0].name

    resources {
      requests = {
        storage = "10Gi"
      }
    }
  }
}
