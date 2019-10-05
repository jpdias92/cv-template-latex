#!/bin/sh
IMAGE=jpdias92/cv-template-latex
exec docker run -d --rm --name latex_daemon -i --user="$(id -u):$(id -g)" --net=none -t -v "$PWD":/data "$IMAGE" /bin/sh -c "sleep infinity"
