resource "kubernetes_deployment" "behav_app" {
  metadata {
    name = "behav-app"
  }

  spec {
    replicas = 1
    selector {
      match_labels = {
        app = "behav-app"
      }
    }
    template {
      metadata {
        labels = {
          app = "behav-app"
        }
      }
      spec {
        container {
          name  = "behav-app"
          image = "filipossantos/python-test:latest"
          port {
            container_port = 5000
          }
          env {
            name  = "DB_HOST"
            value = "postgres"
          }
          env {
            name  = "DB_PORT"
            value = "5432"
          }
          env {
            name  = "DB_NAME"
            value = "postgres"
          }
          env {
            name  = "DB_USER"
            value = "postgres"
          }
          env {
            name  = "DB_PASSWORD"
            value = "cGFzc3dvcmQK"
          }
        }
      }
    }
  }
}
