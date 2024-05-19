resource "kubernetes_service" "behav_app_service" {
  metadata {
    name = "behav-app-service"
  }

  spec {
    selector = {
      app = "behav-app"
    }
    port {
      protocol    = "TCP"
      port        = 80
      target_port = 5000
    }
    type = "LoadBalancer"
  }
}
