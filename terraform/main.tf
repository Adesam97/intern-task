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
  config_path = "~/.kube/config" 
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"  
  }
}


resource "kubectl_manifest" "example" {
  yaml_body = file("kubernete.yml") 
}

resource "helm_release" "kube_prometheus" {
  name       = "kube-prometheus"
  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "kube-prometheus-stack"
  namespace  = "monitoring"
  version    = "17.0.1" 

  set {
    name  = "prometheusOperator.createCustomResource"
    value = "false"
  }
}


