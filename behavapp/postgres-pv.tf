provider "kubernetes" {
  config_path = "~/.kube/config"
}

resource "kubernetes_persistent_volume" "psql_pv" {
  metadata {
    name = "psql-pv"
    labels = {
      type = "local"
    }
  }

  spec {
    storage_class_name = "manual"
    capacity = {
      storage = "1Gi"
    }
    access_modes = ["ReadWriteOnce"]
    persistent_volume_source {
      host_path {
        path = "/mnt/data/postgresql"
      }
    }
  }
}
