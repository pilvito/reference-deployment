# Getting started with Lab infrastructure

## Overview

!["microservice-deployment.png"](./../images/microservice-deployment.png)

## ./deploy.sh

1. Install helm 
2. Install emissary-ingress
3. Create certs and scerets for emissary ingress
4. Tell Emissary-ingress to use this secret for TLS termination
5. Deploy linkerd
6. Expose linkerd dashboard through emissary ingress
7. Linkerd header mapping for emissary

## ./undeploy.sh

1. Undeploy linkerd
2. Undeploy emissary-ingress
3. Remove emissary repo in helm
4. Remove emissary-ingress tls secret