#!/bin/bash
set -e


mkdir -p functions/node_modules
mkdir -p ~/.kube
mkdir -p ~/.docker

cd functions

kubectl config view --raw >~/.kube/config

echo $INPUT_CLOUDTICON_AUTH |  jq -r '.kube' > ~/.kube/config
echo $INPUT_CLOUDTICON_AUTH |  jq -r '.docker' > ~/.docker/config.json
cat /github/home/.kube/config
cloudticon build
cloudticon push
cloudticon helm
