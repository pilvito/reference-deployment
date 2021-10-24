#!/bin/sh
# Test deploy script


# To remove Linkerd Viz
linkerd viz uninstall | kubectl delete -f -

# To remove Linkerd Jaeger
linkerd jaeger uninstall | kubectl delete -f -

# To remove Linkerd Multicluster
linkerd multicluster uninstall | kubectl delete -f -


linkerd uninstall | kubectl delete -f -


# Uninstall emissary-ingress
helm uninstall emissary-ingress -n emissary
kubectl delete ns emissary
kubectl delete ClusterRole emissary-ingress-agent
kubectl delete ClusterRole emissary-ingress

# Delete secrets
kubectl delete secret emissary-tls-cert
