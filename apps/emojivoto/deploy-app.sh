# Deploy emojivoto app in cluster
curl --proto '=https' --tlsv1.2 -sSfL https://run.linkerd.io/emojivoto.yml \
  | kubectl apply -f -

# Inject linkerd into emojivoto app
#kubectl get -n emojivoto deploy -o yaml \
#  | linkerd inject - \
#  | kubectl apply -f -

# Ingress mapping for emojivoto
kubectl apply -f ./apps/emojivoto/emojivoto-ingress-mapping.yaml