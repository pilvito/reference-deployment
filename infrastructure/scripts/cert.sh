# Create a self-signed certificate
openssl req -x509 -newkey rsa:4096 -keyout ./ssl/key.pem -out ./ssl/cert.pem -subj '/CN=emissary-ingress' -nodes

# Create emissary tsl cert
kubectl create secret tls emissary-tls-cert --cert=./ssl/cert.pem --key=./ssl/key.pem