#!/bin/sh
# Test deploy script

# Install Helm
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh

# Install emissary-ingress
# Add the Repo:
helm repo add datawire https://app.getambassador.io
 
# Create Namespace and Install:
kubectl create namespace emissary && \
helm install emissary-ingress --devel --namespace emissary datawire/emissary-ingress --set enableAES=false && \
kubectl -n emissary wait --for condition=available --timeout=90s deploy -lapp.kubernetes.io/instance=emissary-ingress

# Create certs and scerets
./scripts/cert.sh

# Tell Emissary-ingress to use this secret for TLS termination
kubectl apply -f ./emissary-ingress/wildcard-host.yaml
kubectl apply -f ./emissary-ingress/listeners.yaml
