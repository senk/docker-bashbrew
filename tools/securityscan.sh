#!/bin/bash
IMAGES=`bashbrew list --all`
for image in $IMAGES
do
  echo "Scanning $image"
  sudo oscap-docker image-cve $image --result "$image.xml" --report "$image.html"
done
