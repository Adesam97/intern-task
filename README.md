# intern-task

- Dockerfile is used to create image <a href= "https://hub.docker.com/repository/docker/fikunmisamson/my-express-app/general">my-express-app</a> in dockerhub with base image node:14-slim
- app.js is used by the Dockerfile to load a simple text "Hello world" express frontend in container
- kubernete manifest file <a href= "#">kubernete.yml</a> is used to create a simple deployment of 2 replica pod that listens on port 3000
- terraform file written in hcl is used to set up kubectl and helms provider, deploys manifest to the created express-demo cluster and create a prometheus stack using helm_release
- the accessment.sh bash script is used to automate
- - server update
  - check system architecture and install kind
  - create an express-demo cluster
  - set the cluster as context for kube-config
  - write out a new file <i>express-demo-config.yaml </i> to store the kube context (optional)
  - set the new config file in environmental variable (optional)
  - lastly initializes terraform environment and apply changes.


- Run:
  ```
  kubectl -n monitoring port-forward svc/kube-prometheus-stack-prometheus 9090
  ```
  to access Prometheus by port-forwarding to the Prometheus service
  You can then access Prometheus at http://localhost:9090 in the web browser.

- Run:
  ```
  kubectl -n monitoring port-forward svc/kube-prometheus-stack-grafana 3003
  ```
  to access Grafana by port-forwarding to the Grafana service
  You can then access Grafana at http://localhost:3003 in the web browser.
