#!/bin/bash
set -e

mkdir -p functions/node_modules
mkdir -p ~/.kube
mkdir -p ~/.docker

cd functions

echo $INPUT_KUBECONFIG |  jq -r '.kube' > ~/.kube/config
echo $INPUT_CLOUDTICON_AUTH > ~/.docker/config.json

cat /root/.kube/config
kubectl get pod -A
cloudticon build
cloudticon push
cloudticon helm
