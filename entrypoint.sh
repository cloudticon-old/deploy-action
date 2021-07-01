#!/bin/bash
set -e

yarn global upgrade @cloudticon/cli
mkdir -p functions
cd functions

cloudticon --version
cloudticon login -t $INPUT_CLOUDTICON_TOKEN
eval $INPUT_COMMAND
