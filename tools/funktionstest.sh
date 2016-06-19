#!/bin/bash
IMAGES=`bashbrew list --all`
EXIT_STATUS=0
for image in $IMAGES
do
  echo "Testing $image"
  docker run --rm -v /var/run/docker.sock:/var/run/docker.sock -v `pwd`:/work -e TEST_IMAGE=$image serverspec || EXIT_STATUS=$?
done
exit $EXIT_STATUS
