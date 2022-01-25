# Install emissary-ingress
# Add the Repo:
helm repo remove datawire
helm repo add datawire https://app.getambassador.io
helm repo update
 
# Create Namespace and Install:
kubectl create namespace emissary && \
kubectl apply -f https://app.getambassador.io/yaml/emissary/latest/emissary-crds.yaml
kubectl wait --timeout=90s --for=condition=available deployment emissary-apiext -n emissary-system
helm install emissary-ingress --devel --namespace emissary datawire/emissary-ingress --set enableAES=false && \
kubectl -n emissary wait --for condition=available --timeout=90s deploy -lapp.kubernetes.io/instance=emissary-ingress