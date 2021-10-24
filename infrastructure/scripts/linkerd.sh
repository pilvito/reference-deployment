# Deploy Linkerd

# Step 1: Install the CLI

curl -fsL https://run.linkerd.io/install | sh

export PATH=$PATH:/home/viji/.linkerd2/bin

linkerd version

# Step 2: Validate your Kubernetes cluster

linkerd check --pre

# Step 3: Install the control plane onto your cluster

linkerd install | kubectl apply -f -

linkerd check


# linkerd install the on-cluster metrics stack

linkerd viz install | kubectl apply -f -
