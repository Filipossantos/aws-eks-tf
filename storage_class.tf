resource "kubernetes_storage_class" "aws_ebs_sc" {
  metadata {
    name = "aws-ebs-sc"
  }

  storage_provisioner        = "ebs.csi.aws.com"
  reclaim_policy      = "Retain"

  parameters = {
    type      = "gp2"
    encrypted = "true"
  }
}
