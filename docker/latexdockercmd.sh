#!/bin/sh
IMAGE=jpdias92/cv-template-latex
exec docker run --rm -i --user="$(id -u):$(id -g)" --net=none -v "$PWD":/data "$IMAGE" "$@"
