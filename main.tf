terraform {
  required_version = ">= 0.13"

  required_providers {
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = ">= 1.7.0"
    }
  }
}

provider "kubectl" {
  config_path = "~/.kube/config" # Path to Kubernetes config file
}

resource "kubectl_manifest" "example" {
  yaml_body = file("kubernete.yml") # Path to Kubernetes manifest file
}