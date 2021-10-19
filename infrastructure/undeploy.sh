#!/bin/sh
# Test deploy script

# Uninstall emissary-ingress
helm uninstall emissary-ingress -n emissary
kubectl delete ns emissary
kubectl delete ClusterRole emissary-ingress-agent
kubectl delete ClusterRole emissary-ingress

# Delete secrets
kubectl delete secret emissary-tls-cert
