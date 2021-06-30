#!/bin/bash
set -e

echo $INPUT_CLOUDTICON_AUTH |  jq -r '.kube' > ~/.kube/config
echo $INPUT_CLOUDTICON_AUTH |  jq -r '.docker' > ~/.docker/config.json

cloudticon build
cloudticon push
cloudticon helm
