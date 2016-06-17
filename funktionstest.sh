#!/bin/bash
IMAGES=`bashbrew list --all`
for image in $IMAGES
do
  TEST_IMAGE=$image docker run --rm -v /var/run/docker.sock:/var/run/docker.sock -v `pwd`:/work serverspec
done
