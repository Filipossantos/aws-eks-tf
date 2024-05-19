resource "kubernetes_service" "postgres" {
  metadata {
    name = "postgres"
    labels = {
      app = "postgres"
    }
  }

  spec {
    port {
      port = 5432
    }
    selector = {
      app  = "postgres"
      tier = "backend"
    }
    cluster_ip = "None"
  }
}
