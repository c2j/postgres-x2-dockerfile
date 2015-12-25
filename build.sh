#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail

#if [ ! -f settings ]; then
#  echo "Error loading configuration; settings file missing."
#  exit 1
#fi

#source ./settings

for b in base gtm coordinator datanode; do
  cd ${b}/
  docker build -t postgres-x2_${b} .
  cd ..
done
