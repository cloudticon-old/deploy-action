#!/bin/bash
set -e

mkdir -p functions
mkdir -p ~/.kube/config
mkdir -p ~/.docker/config.json

cd functions

echo $INPUT_CLOUDTICON_AUTH |  jq -r '.kube' > ~/.kube/config
echo $INPUT_CLOUDTICON_AUTH |  jq -r '.docker' > ~/.docker/config.json

cloudticon build
cloudticon push
cloudticon helm
