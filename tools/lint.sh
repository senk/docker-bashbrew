#!/bin/bash
FILES=`find . -name "Dockerfile"`
EXIT_STATUS=0
for file in $FILES
do
  echo "Linting $file"
  docker run --rm --privileged -v `pwd`:/root/ projectatomic/dockerfile-lint dockerfile_lint -r basic_rules.yaml -f "$file" ';' || EXIT_STATUS=$?
done
exit $EXIT_STATUS
