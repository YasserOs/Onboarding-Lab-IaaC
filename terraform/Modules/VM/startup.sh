# #!/bin/bash
# #install kubectl
# curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
# curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
# sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
# #install helm
# curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
# chmod 700 get_helm.sh
# ./get_helm.sh

# ## getting cluster credentials
# gcloud container clusters get-credentials yasser-demo-cluster --region=us-central1

# ## install docker 
