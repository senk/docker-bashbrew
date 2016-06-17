#!/bin/bash
IMAGES=`bashbrew list --all`
for image in $IMAGES
do
  echo "Testing $image"
  docker run --rm -v /var/run/docker.sock:/var/run/docker.sock -v `pwd`:/work -e TEST_IMAGE=$image serverspec
done
