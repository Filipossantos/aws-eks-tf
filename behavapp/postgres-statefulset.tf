resource "kubernetes_stateful_set" "postgres" {
  metadata {
    name = "postgres"
    labels = {
      app = "postgres"
    }
  }

  spec {
    selector {
      match_labels = {
        app  = "postgres"
        tier = "backend"
      }
    }
    service_name = "postgres"
    replicas     = 2

    template {
      metadata {
        labels = {
          app  = "postgres"
          tier = "backend"
        }
      }
      spec {
        termination_grace_period_seconds = 10

        container {
          image = "postgres:9.4"
          name  = "postgres"
          env {
            name = "POSTGRES_PASSWORD"
            value_from {
              secret_key_ref {
                name = "psql-pass"
                key  = "password"
              }
            }
          }
          port {
            container_port = 5432
            name           = "postgres"
          }
          readiness_probe {
            exec {
              command = ["/bin/sh", "-c", "pg_isready -U postgres"]
            }
            initial_delay_seconds = 10
            period_seconds        = 5
          }
          liveness_probe {
            exec {
              command = ["/bin/sh", "-c", "pg_isready -U postgres"]
            }
            initial_delay_seconds = 15
            period_seconds        = 20
          }
        }

        volume {
          name = "pgdata"
          persistent_volume_claim {
            claim_name = kubernetes_persistent_volume_claim.psql_pv_claim.metadata[0].name
          }
        }
      }
    }
  }
}
