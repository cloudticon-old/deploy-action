#!/bin/bash
set -e

yarn global upgrade @cloudticon/cli
mkdir -p functions
cd functions

cloudticon login -t $INPUT_CLOUDTICON_TOKEN
cloudticon build
cloudticon push
cloudticon helm
